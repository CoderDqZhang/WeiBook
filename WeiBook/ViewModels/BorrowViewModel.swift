
//
//  BorrowViewModel.swift
//  WeiBook
//
//  Created by Zhang on 2017/7/6.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit

class BorrowViewModel: BaseViewModel {
    
    let bookStatus:[BorrowStatus] = [BorrowStatus.BorrowIn,BorrowStatus.BorrowOut,BorrowStatus.BorrowOut,BorrowStatus.BorrowDone,BorrowStatus.BorrowTimeEnd]
    var borrowList = NSMutableArray.init()
    var tempBorrowList = NSMutableArray.init()
    override init() {
        super.init()
        self.requestBorrow()
    }
    
    func rigthBarItemPress(status:Int){
        if status == 0 {
            self.borrowList = self.tempBorrowList
        }else{
            let array = self.tempBorrowList.filter({ (str) -> Bool in
                let dic = str as! NSDictionary
                if dic["useUserId"] as! String == UserInfoModel.shareInstance().tails.userInfo.userId {
                    return Int(dic["isReturn"] as! Int) == status
                }else{
                    return Int(dic["state"] as! Int) == status
                }
            })
            
            self.borrowList = array as! NSMutableArray
        }
        self.controller?.tableView.reloadData()
    }
    
    //MARK: - TableViewCellSetData
    func tableViewBorrowUserInfoTableViewCellSetData(_ indexPath:IndexPath, cell:BorrowUserInfoTableViewCell) {
        cell.cellSetData(model: BorrowModel.init(fromDictionary: self.borrowList[indexPath.section] as! NSDictionary))
    }
    
    func tableViewBookInfoTableViewCellSetData(_ indexPath:IndexPath, cell:BookInfoTableViewCell) {
        cell.cellSetData(model: BorrowModel.init(fromDictionary: self.borrowList[indexPath.section] as! NSDictionary).tails.bookInfo)
    }
    
    //MARK: -RequestNet
    func requestBorrow(){
        self.borrowList.removeAllObjects()
        let url = "\(BaseUrl)\(BookBorrowList)"
        if UserInfoModel.isLoggedIn() {
            let parameters = ["userId":UserInfoModel.shareInstance().tails.userInfo.userId]
            BaseNetWorke.sharedInstance.getUrlWithString(url, parameters: parameters as AnyObject).observe { (resultDic) in
                if !resultDic.isCompleted {
                    self.borrowList.addObjects(from:NSMutableArray.mj_keyValuesArray(withObjectArray: resultDic.value as! [Any]) as! [Any])
                    self.tempBorrowList.addObjects(from:NSMutableArray.mj_keyValuesArray(withObjectArray: resultDic.value as! [Any]) as! [Any])
                    self.controller?.tableView.reloadData()
                }
            }
            
            let urlList = "\(BaseUrl)\(BookBorrowUserList)"
            let parametersList = ["useUserId":UserInfoModel.shareInstance().tails.userInfo.userId]
            BaseNetWorke.sharedInstance.getUrlWithString(urlList, parameters: parametersList as AnyObject).observe { (resultDic) in
                if !resultDic.isCompleted {
                    self.borrowList.addObjects(from:NSMutableArray.mj_keyValuesArray(withObjectArray: resultDic.value as! [Any]) as! [Any])
                    self.tempBorrowList.addObjects(from:NSMutableArray.mj_keyValuesArray(withObjectArray: resultDic.value as! [Any]) as! [Any])
                    self.controller?.tableView.reloadData()
                }
            }
        }else{
            NavigationPushView(self.controller!, toConroller: LoginViewController())
        }
        
    }

}

//MARK: -UITableViewDelegate&DataSource
extension BorrowViewModel : UITableViewDelegate {
    
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
extension BorrowViewModel : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.borrowList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: BorrowUserInfoTableViewCell .description() , for: indexPath)
            self.tableViewBorrowUserInfoTableViewCellSetData(indexPath, cell: cell as! BorrowUserInfoTableViewCell)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: BookInfoTableViewCell.description(), for:indexPath) as! BookInfoTableViewCell
            self.tableViewBookInfoTableViewCellSetData(indexPath, cell: cell)
            return cell
        }
    }
}
