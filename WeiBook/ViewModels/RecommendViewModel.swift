//
//  RecommendViewModel.swift
//  WeiBook
//
//  Created by Zhang on 2017/6/27.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit

class RecommendViewModel: BaseViewModel {

    var sectionsNumber = [1,1,1,1,1]
    var bannerModel:NSMutableArray = NSMutableArray()

    override init() {
        super.init()
        self.requestBanner()
    }
    
    //MARK: -TableViewCellData
    func tableViewRecommendTableViewCellSetData(_ indexPath:IndexPath, cell:RecommendTableViewCell){
        let imageUrls = NSMutableArray()
        for banner in self.bannerModel {
            imageUrls.add((banner as! BannerModel).img)
        }
        cell.setcycleScrollerViewData(imageUrls.mutableCopy() as! NSArray)
        cell.cyCleScrollerViewClouse = { index in
            let banner = self.bannerModel[index]
//            if banner.bannerType == 2 {
//                let controllerVC = NotificationViewController()
//                controllerVC.url = banner.url
//                NavigationPushView(self.controller, toConroller: controllerVC)
//            }else{
//                self.pushTicketDetail(banner.show)
//            }
        }
    }
    
    //MARK: -NetWorking
    func requestBanner(){
        let url = "\(BaseUrl)\(HomeBanner)"
        let parameters = ["type":"1","bannerNum":"4"]
        BaseNetWorke.sharedInstance.getUrlWithString(url, parameters: parameters as AnyObject).observe { (resultDic) in
            print(resultDic)
            if (!resultDic.isCompleted){
                    let models = NSMutableArray.mj_keyValuesArray(withObjectArray: resultDic.value as! [Any])
                for model in models! {
                    self.bannerModel.add(BannerModel.init(fromDictionary: model as! NSDictionary))
                }
                (self.controller as! RecommendViewController).tableView.reloadData()
            }
        }
    }
}

extension RecommendViewModel : UITableViewDelegate {
    
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
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                //图片比例15：7
                return SCREENWIDTH * 7 / 15
            default:
                return 80
            }
        default:
            return 44
        }
    }
}
extension RecommendViewModel : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionsNumber[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: RecommendTableViewCell.description() , for: indexPath)
                self.tableViewRecommendTableViewCellSetData(indexPath,cell: cell as! RecommendTableViewCell)
                return cell
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: RecommendTableViewCell.description() , for: indexPath)
//                self.tableViewRecommendTableViewCellSetData(indexPath,cell: cell as! RecommendTableViewCell)
                return cell
            }
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: RecommendTableViewCell.description() , for: indexPath)
//            self.tableViewRecommendTableViewCellSetData(indexPath,cell: cell as! RecommendTableViewCell)
            return cell
        }
    }
}
