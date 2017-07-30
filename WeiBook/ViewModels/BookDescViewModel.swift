//
//  BookDescViewModel.swift
//  WeiBook
//
//  Created by Zhang on 2017/7/5.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit

class BookDescViewModel: BaseViewModel {
    
    var model:ServerBookModel!
    var myBookModel:MyBooksModel!
    var bookDescModel:BookDescModel!
    
    var sectionsNumber = [1]
    override init() {
        super.init()
    }
    
    //MARK: TableViewBaseInfo 
    func tableViewBookBaseInfoTableViewCellSetData(_ indexPath:IndexPath, cell:BookBaseInfoTableViewCell) {
        if self.myBookModel != nil {
            cell.cellSetDataSnbModel(model: self.myBookModel.tails.bookInfo)
        }
    }
    
    func borrowButtonPress(time:Int64){
        let toController = BaseWebViewController()
        toController.url = "\(QRCodeUrl)'bookId':'\((self.myBookModel.bookId)!)','userId':'\((UserInfoModel.shareInstance().tails.userInfo.userId)!)','borrowEnd':'\(time)'"
        NavigationPushView(self.controller!, toConroller: toController)
    }
    
    func giveButtonPress(time:Int64){
        let toController = BaseWebViewController()
        toController.url = "\(QRCodeUrl)'bookId':'\((self.myBookModel.bookId)!)','userId':'\((UserInfoModel.shareInstance().tails.userInfo.userId)!)','giveEnd':'\(time)'"
        NavigationPushView(self.controller!, toConroller: toController)
    }
    
    func borrowedButtonPress(){
        let toController = BaseWebViewController()
        toController.url = "\(QRCodeUrl)'bookId':'\((self.myBookModel.bookId)!)','userId':'\((UserInfoModel.shareInstance().tails.userInfo.userId)!)'"
        NavigationPushView(self.controller!, toConroller: toController)
    }

    
    //MARK: RequestNetWork
    func requstBookDesc(){
        let url = "\(BaseUrl)\(BookDetail)"
        let parameters = ["userId":UserInfoModel.shareInstance().tails.userInfo.userId,
             "id":self.model.id]
        BaseNetWorke.sharedInstance.getUrlWithString(url, parameters: parameters as AnyObject).observe { (resultDic) in
            if (!resultDic.isCompleted){
                self.bookDescModel = BookDescModel.init(fromDictionary: resultDic.value as! NSDictionary)
            }
        }
    }
}

//MARK: TableViewDelegate&DataSource
extension BookDescViewModel : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
//        self.tableViewDidSelect(indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0001
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0001
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 164
        case 1:
            return 164
//            return (self.controller?.tableView.fd_heightForCell(withIdentifier: BookAdvanceTableViewCell.description(), configuration: { (cell) in
//                if self.snbBookModel != nil {
//                    (cell as! BookAdvanceTableViewCell).cellSetData(model: self.snbBookModel)
//                }
//            }))!
        default:
            return 164
//            return self.snbBookModel == nil ? 60 : self.tableViewTagCellHeight() + 100
        }
    }
}
extension BookDescViewModel : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionsNumber[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: BookBaseInfoTableViewCell.description() , for: indexPath)
            self.tableViewBookBaseInfoTableViewCellSetData(indexPath,cell: cell as! BookBaseInfoTableViewCell)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: BookAdvanceTableViewCell.description() , for: indexPath)
            cell.backgroundColor = UIColor.init(hexString: App_Theme_F8F9F9_Color)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: BookTagTableViewCell.description() , for: indexPath)
            cell.backgroundColor = UIColor.init(hexString: App_Theme_F8F9F9_Color)
            return cell
        }
    }
}
