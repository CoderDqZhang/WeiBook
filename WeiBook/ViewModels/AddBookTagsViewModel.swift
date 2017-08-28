//
//  AddTagsViewModel.swift
//  WeiBook
//
//  Created by Zhang on 2017/7/11.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit
import MapKit

class AddBookTagsViewModel: BaseViewModel {

    let commentTitls = ["想读","是否可借","是否可赠"]
    var customComment = false
    
    var addBookForm:AddBookFormModel!
    
    var locationManager:AMapLocationManager!
    var locationStr = "正在获取"
    var selectAddress = ""
    var addressArray = NSMutableArray.init()
    
    override init() {
        super.init()
        if UserDefaultsGetSynchronize(NormalAddress) != nil {
            self.addressArray.addObjects(from: UserDefaultsGetSynchronize(NormalAddress)as! [Any])
        }
    }
    
    func setUpLocationManager(){
        locationManager = AMapLocationManager.init()
        locationManager.locationTimeout = 2
        locationManager.reGeocodeTimeout = 2
        locationManager.delegate = self
        locationManager.requestLocation(withReGeocode: true) { (location, regeo, error) in
            if error != nil {
                return;
            }
            if (regeo != nil) {
                self.locationStr = (regeo?.formattedAddress)!
                if self.addressArray.count == 0 {
                    self.addressArray.add(self.locationStr)
                }else{
                    self.addressArray.insert(self.locationStr, at: 0)
                }
                self.controller?.tableView.reloadData()
            }
        }
    }
//    {"state":"1",
//    "userId":"4aeedfa860994ce9aee0febd89d5d005",
//    "bookId":"365b0af28c1b11e69b740050568261f4",
//    "commentContent":"Ceshi"
//    "comments":[["imageUrl":"http://cdn.topveda.cn/bookComment/2017/7/21/bf1d0a3f9a30b825f775b3c78413f73a.jpg","type":"1"],["imageUrl":"http://cdn.topveda.cn/bookComment/2017/7/21/bf1d0a3f9a30b825f775b3c78413f73a.jpg","type":"1"]]
//    }
    func addBookDone(){
        let url = "\(BaseUrl)\(AddBook)"
        let dics = NSMutableArray.init()
        for comment in addBookForm.comments {
            let dic = ["imageUrl":comment.imageUrl,
                       "type":comment.type] as [String : Any]
            dics.add(dic)
        }
        let parameters = ["bookId":addBookForm.bookId,
                          "userId":addBookForm.userId,
                          "commentContent":addBookForm.commentContent,
                          "comments":dics,
                          "state":"1",
                          "address": self.selectAddress
                          ] as [String : Any]
        UserDefaultsSetSynchronize(self.addressArray, key: NormalAddress)
        BaseNetWorke.sharedInstance.postUrlWithString(url, parameters: parameters as AnyObject).observe { (resultDic) in
            if !resultDic.isCompleted {
                _ = Tools.shareInstance.showMessage((self.controller?.view)!, msg: "加入书库成功", autoHidder: true)
                self.controller?.navigationController?.popToRootViewController(animated: true)
            }
        }
    }
    
    //MARK: - SetCellData
    func tableViewGloableImageLableDetailImageCellSetData(_ indexPath:IndexPath, cell:GloableImageLableDetailImageCell) {
        switch indexPath.section {
        case 0:
            cell.cellSetData(image: nil, lableStr: commentTitls[indexPath.row], detailStr: nil)
        default:
            if indexPath.row == 0 {
                cell.cellSetData(image: nil, lableStr: "手动添加", detailStr: nil)
            }else{
                cell.cellSetData(image: nil, lableStr: self.addressArray[indexPath.row - 1] as! String, detailStr: nil)
            }
        }
    }
    
    func tableViewGloableImageLableSwitchCellSetData(_ indexPath:IndexPath, cell:GloableImageLableSwitchCell){
        cell.cellSetData(image: nil, lableStr: "添加位置", switchStatus: self.customComment)
        cell.gloableImageLableSwitchClouse = { isTrue in
            self.customComment = isTrue
            self.controller?.tableView.reloadData()
            self.setUpLocationManager()
        }
    }
    
    
    func showLoacationAlert(){
        UIAlertController.shwoAlertControl(self.controller!, style: .alert, title: "定位服务未开启", message: "请在手机设置中开启定位服务以便更好为您服务", titles: nil, cancel: "知道了", doneTitle: "开启定位", cancelAction: {
            
        }, doneAction: {_ in 
            let url = URL.init(string: "prefs:root=LOCATION_SERVICES")
            if SHARE_APPLICATION.canOpenURL(url!) {
                SHARE_APPLICATION.canOpenURL(url!)
            }
        })
    }
}

//MARK: TableViewDelegate&DataSource

extension AddBookTagsViewModel : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 0 {
            let cell = tableView.cellForRow(at: indexPath)
            if (cell?.accessoryType == .checkmark) {
                cell?.accessoryType = .none
            }else{
                cell?.accessoryType = .checkmark
            }
        }else{
            if indexPath.row == 0 {
                let toController = AddAddressViewController()
                toController.addAddressClouse = { str in
                    if self.addressArray.count == 0 {
                        self.addressArray.add(str)
                    }else{
                        self.addressArray.insert(str, at: 0)
                    }
                    self.controller?.tableView.reloadData()
                }
                NavigationPushView(self.controller!, toConroller: toController)
            }else{
                for i in 1...self.addressArray.count {
                    let cell = tableView.cellForRow(at: IndexPath.init(row: i, section: 1)) as! GloableImageLableDetailImageCell
                    if i == indexPath.row {
                        self.selectAddress = (cell.textLabel?.text)!
                        cell.accessoryType = .checkmark
                    }else{
                        cell.accessoryType = .none
                    }
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return section == 0 ? 10 : 0.000001
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0001
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}
extension AddBookTagsViewModel : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.customComment ? 2 : 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 4
        default:
            return self.addressArray.count + 1
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 3:
                let cell = tableView.dequeueReusableCell(withIdentifier: GloableImageLableSwitchCell.description() , for: indexPath)
                self.tableViewGloableImageLableSwitchCellSetData(indexPath,cell: cell as! GloableImageLableSwitchCell)
                
                return cell
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: GloableImageLableDetailImageCell.description() , for: indexPath)
                self.tableViewGloableImageLableDetailImageCellSetData(indexPath,cell: cell as! GloableImageLableDetailImageCell)
                if indexPath.row == 0 {
                    cell.accessoryType = .checkmark
                }
                return cell
            }
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: GloableImageLableDetailImageCell.description() , for: indexPath)
            self.tableViewGloableImageLableDetailImageCellSetData(indexPath,cell: cell as! GloableImageLableDetailImageCell)
            return cell
        }
    }
}

extension AddBookTagsViewModel : AMapLocationManagerDelegate {
    private  func amapLocationManager(_ manager: AMapLocationManager!, didFailWithError error: NSError!) {
        print(error)
    }
    
    func amapLocationManager(_ manager: AMapLocationManager!, didUpdate location: CLLocation!) {
        print(location)
        
    }
    
    func amapLocationManager(_ manager: AMapLocationManager!, didExitRegion region: AMapLocationRegion!) {
        print(region)
    }
    
    func amapLocationManager(_ manager: AMapLocationManager!, didUpdate location: CLLocation!, reGeocode: AMapLocationReGeocode!) {
        
    }
    
    func amapLocationManager(_ manager: AMapLocationManager!, didStartMonitoringFor region: AMapLocationRegion!) {
        
    }
    
    func amapLocationManager(_ manager: AMapLocationManager!, didChange status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            if locationStr == "正在获取" {
                manager.requestLocation(withReGeocode: true, completionBlock: { (lcation, regencode, error) in
                    if error != nil {
                        return
                    }
                    if regencode != nil {
                        //                        self.locationStr = NSString(regencode?.city!).substring(to: 2)
                        //                        UserDefaultsSetSynchronize(self.locationStr as AnyObject, key: "location")
                        //                        self.controller.tableView.reloadSections(NSIndexSet.init(index: 0) as IndexSet, with: .automatic)
                    }
                })
            }
        }else if status == .notDetermined {
            self.showLoacationAlert()
        }else {
            
        }
    }
}

