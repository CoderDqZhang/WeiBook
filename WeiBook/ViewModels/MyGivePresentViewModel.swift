//
//  MyGivePresentViewModel.swift
//  WeiBook
//
//  Created by Zhang on 2017/7/6.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit

class MyGivePresentViewModel: BaseViewModel {

    let bookStatus:[GiveBookStatus] = [GiveBookStatus.GiveIn,GiveBookStatus.GiveOut,GiveBookStatus.GiveOut,GiveBookStatus.GiveOut,GiveBookStatus.GiveIn]
    var giveList = NSMutableArray.init()
    var tempGiveList = NSMutableArray.init()
    override init() {
        super.init()
        self.requestGiveBook()
    }
    
    func rigthBarItemPress(status:Int){
        if status == 0 {
            self.giveList = self.tempGiveList
        }else{
            let array = self.tempGiveList.filter({ (str) -> Bool in
                let dic = str as! NSDictionary
                if status == 3 {
                    return dic["useUserId"] as? String != UserInfoModel.shareInstance().tails.userInfo.userId
                }else {
                    return dic["useUserId"] as! String == UserInfoModel.shareInstance().tails.userInfo.userId
                }
//                if  {
//                    return Int(dic["isAccept"] as! Int) == status
//                }else{
//                    return Int(dic["isAccept"] as! Int) == status
//                }
            })
            
            self.giveList = NSMutableArray.init(array: array)
        }
        self.controller?.tableView.reloadData()
    }
    
    //MARK: - TableViewCellSetData
    func tableViewGiveUserInfoTableViewCellSetData(_ indexPath:IndexPath, cell:GiveUserInfoTableViewCell) {
        cell.cellSetData(model: GiveBookModel.init(fromDictionary: self.giveList[indexPath.section] as! NSDictionary))
    }
    
    func tableViewBookInfoTableViewCellSetData(_ indexPath:IndexPath, cell:BookInfoTableViewCell) {
        cell.cellSetData(model: GiveBookModel.init(fromDictionary: self.giveList[indexPath.section] as! NSDictionary).tails.bookInfo)
    }
    
    //MARK: -RequestNet
    func requestGiveBook(){
        self.giveList.removeAllObjects()
        if UserInfoModel.isLoggedIn() {
            let group = DispatchGroup.init()
            let queue = DispatchQueue.init(label: "Give")
            queue.async(group: group, execute: DispatchWorkItem.init(block: {
                group.enter()
                let url = "\(BaseUrl)\(MyBookGetList)"
                let parameters = ["userId":UserInfoModel.shareInstance().tails.userInfo.userId]
                BaseNetWorke.sharedInstance.getUrlWithString(url, parameters: parameters as AnyObject).observe { (resultDic) in
                    if !resultDic.isCompleted {
                        self.giveList.addObjects(from:NSMutableArray.mj_keyValuesArray(withObjectArray: resultDic.value as! [Any]) as! [Any])
                        self.tempGiveList.addObjects(from:NSMutableArray.mj_keyValuesArray(withObjectArray: resultDic.value as! [Any]) as! [Any])
                        group.leave()
                    }
                }
            }))
            
            queue.async(group: group, execute: DispatchWorkItem.init(block: {
                group.enter()
                let urlList = "\(BaseUrl)\(MyBookGiveList)"
                let parametersList = ["useUserId":UserInfoModel.shareInstance().tails.userInfo.userId]
                BaseNetWorke.sharedInstance.getUrlWithString(urlList, parameters: parametersList as AnyObject).observe { (resultDic) in
                    if !resultDic.isCompleted {
                        self.giveList.addObjects(from:NSMutableArray.mj_keyValuesArray(withObjectArray: resultDic.value as! [Any]) as! [Any])
                        self.tempGiveList.addObjects(from:NSMutableArray.mj_keyValuesArray(withObjectArray: resultDic.value as! [Any]) as! [Any])
                        group.leave()
                    }
                }
            }))
            group.notify(queue: DispatchQueue.main, execute: { 
                self.controller?.tableView.reloadData()
            })
            
        }else{
            NavigationPushView(self.controller!, toConroller: LoginViewController())
        }
    }
    
}

//MARK: -UITableViewDelegate&DataSource
extension MyGivePresentViewModel : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0001
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 60
        default:
            return 92
        }
    }
}
extension MyGivePresentViewModel : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.giveList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: GiveUserInfoTableViewCell .description() , for: indexPath)
            self.tableViewGiveUserInfoTableViewCellSetData(indexPath, cell: cell as! GiveUserInfoTableViewCell)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: BookInfoTableViewCell.description(), for:indexPath) as! BookInfoTableViewCell
            self.tableViewBookInfoTableViewCellSetData(indexPath, cell: cell)
            return cell
        }
    }
}
