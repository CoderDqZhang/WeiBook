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
    var myBookModel:Book!
    var bookDescModel:BookDescModel!
    var commentsModel = NSMutableArray.init()
    
    var sectionsNumber = [1]
    override init() {
        super.init()
    }
    
    func collectRightBarItemPress(){
        self.collectBookOrBookList()
    }
    
    func tableViewHeight(_ indexPath:IndexPath) ->CGFloat {
        if self.commentsModel.count > 0 {
            let model = CommentModel.init(fromDictionary: self.commentsModel[indexPath.section - 1] as! NSDictionary)
            var images:[String] = []
            for comment in model.tails.commentImages {
                images.append(comment.imageUrl)
            }
            return CGFloat((CGFloat(images.count / 3) + (images.count % 3 == 0 ? 0 : 1)) * (ImageSize.height + 5)) + 50
        }
        return 0
    }
    
    //MARK: TableViewBaseInfo 
    func tableViewBookBaseInfoTableViewCellSetData(_ indexPath:IndexPath, cell:BookBaseInfoTableViewCell) {
        if self.myBookModel != nil {
            cell.cellSetDataSnbModel(model: self.myBookModel.tails.bookInfo)
        }else if self.model != nil {
            cell.cellSetDataSnbModel(model: self.model)
        }
    }
    
    func tableViewBookAdvanceTableViewCellSetData(_ indexPath:IndexPath, cell:BookAdvanceTableViewCell) {
        if self.myBookModel != nil {
            cell.cellSetSeverData(model: self.myBookModel.tails.bookInfo)
        }else if self.model != nil {
            cell.cellSetSeverData(model: self.model)
        }
    }
    
    func tableViewUserInfoTableViewCellSetData(_ indexPath:IndexPath, cell:UserInfoTableViewCell) {
        if self.commentsModel.count > 0 {
            let model = CommentModel.init(fromDictionary: self.commentsModel[indexPath.section - 1] as! NSDictionary)
            cell.cellSetData(model: model.tails.user)
        }
    }
    
    func tableViewCommentInfoTableViewCellSetData(_ indexPath:IndexPath, cell:CommentInfoTableViewCell) {
        if self.commentsModel.count > 0 {
            let model = CommentModel.init(fromDictionary: self.commentsModel[indexPath.section - 1] as! NSDictionary)
            var images:[String] = []
            for comment in model.tails.commentImages {
                images.append(comment.imageUrl)
            }
            cell.cellSetData(title: model.commContent, imgs: images)
        }
    }
    
    func tableViewCollectBookUserTableViewCellSetData(_ indexPath:IndexPath, cell:CollectBookUserTableViewCell) {
        if self.bookDescModel != nil {
            cell.cellSetData(users: self.bookDescModel.users)
        }
    }
    
    func tableViewDidSelect(_ indexPath:IndexPath, tableView:UITableView) {
        if indexPath.section != 0 {
            if indexPath.row == 0 && !(self.controller as! BookDescViewController).otherBookDesc {
                let model = CommentModel.init(fromDictionary: self.commentsModel[indexPath.section - 1] as! NSDictionary)
                let booksVC = BooksViewController()
                booksVC.otherUserModel = model.tails.user
                booksVC.otherBooks = true
                NavigationPushView(self.controller!, toConroller: booksVC)
            }
        }else{
            if indexPath.row == tableView.numberOfRows(inSection: 0) - 1 {
                let toController = BookUserListViewController()
                toController.users = self.bookDescModel.users
                NavigationPushView(self.controller!, toConroller: toController)
            }
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
                (self.controller as! BookDescViewController).setNavigationItemCollect(collect: self.bookDescModel.isFavorite == 1 ? true : false)
                self.controller?.tableView.reloadData()
            }
        }
    }
    
    func requestBookComment(){
        let url = "\(BaseUrl)\(MyBookCommentList)"
        let parameters = ["commType":"2",
                          "objectId":self.model.id]
        BaseNetWorke.sharedInstance.getUrlWithString(url, parameters: parameters as AnyObject).observe { (resultDic) in
            if (!resultDic.isCompleted){
                self.commentsModel = NSMutableArray.mj_objectArray(withKeyValuesArray: resultDic.value)
                self.controller?.tableView.reloadData()
            }
        }
    }
    
    func collectBookOrBookList(){
        //这里后期需要坐个改动
        let url = "\(BaseUrl)\(CollectBookOrList)"
        let parameters = ["objectId":self.model.id,
                          "userId":UserInfoModel.shareInstance().tails.userInfo.userId,
                          "type":"2",
                          "subscribeAction": self.bookDescModel.isFavorite == 2 ? "subscribe" : "cancel"]
        self.bookDescModel.isFavorite = self.bookDescModel.isFavorite == 1 ? 2 : 1
        (self.controller as! BookDescViewController).setNavigationItemCollect(collect: self.bookDescModel.isFavorite == 1 ? true : false)
        BaseNetWorke.sharedInstance.postUrlWithString(url, parameters: parameters as AnyObject).observe { (resultDic) in
            if !resultDic.isCompleted {
                
            }
        }
    }
}

//MARK: TableViewDelegate&DataSource
extension BookDescViewModel : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.tableViewDidSelect(indexPath, tableView: tableView)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 10
        default:
            return 5
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0001
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                return 164
            case 1:
                if self.model.contentDesc != nil {
                    return (self.controller?.tableView.fd_heightForCell(withIdentifier: BookAdvanceTableViewCell.description(), configuration: { (cell) in
                        self.tableViewBookAdvanceTableViewCellSetData(indexPath, cell: cell as! BookAdvanceTableViewCell)
                    }))!  > 300 ? 300 : (self.controller?.tableView.fd_heightForCell(withIdentifier: BookAdvanceTableViewCell.description(), configuration: { (cell) in
                        self.tableViewBookAdvanceTableViewCellSetData(indexPath, cell: cell as! BookAdvanceTableViewCell)
                    }))!
                }
                return 100
            default:
                return 100
            }
        default:
            switch indexPath.row {
                case 0:
                    return 60
                default:
                    return self.tableViewHeight(indexPath)
            }
        }
    }
}

extension BookDescViewModel : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.commentsModel.count + 1 > 5 ? 5 : self.commentsModel.count + 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            let numberOfSection = self.model.contentDesc != nil && self.model.contentDesc != "" ? 1 : 0
            let number = self.bookDescModel != nil && self.bookDescModel.users.count > 0 ? numberOfSection + 1 : numberOfSection + 0
            return  number + 1
        default:
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: BookBaseInfoTableViewCell.description() , for: indexPath)
                self.tableViewBookBaseInfoTableViewCellSetData(indexPath,cell: cell as! BookBaseInfoTableViewCell)
                return cell
            case 1:
                if self.model.contentDesc != nil {
                    let cell = tableView.dequeueReusableCell(withIdentifier: BookAdvanceTableViewCell.description() , for: indexPath)
                    cell.backgroundColor = UIColor.init(hexString: App_Theme_FFFFFF_Color)
                    self.tableViewBookAdvanceTableViewCellSetData(indexPath,cell: cell as! BookAdvanceTableViewCell)
                    return cell
                }else{
                    let cell = tableView.dequeueReusableCell(withIdentifier: CollectBookUserTableViewCell.description() , for: indexPath)
                    cell.backgroundColor = UIColor.init(hexString: App_Theme_FFFFFF_Color)
                    self.tableViewCollectBookUserTableViewCellSetData(indexPath,cell: cell as! CollectBookUserTableViewCell)
                    return cell
                }
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: CollectBookUserTableViewCell.description() , for: indexPath)
                cell.backgroundColor = UIColor.init(hexString: App_Theme_FFFFFF_Color)
                self.tableViewCollectBookUserTableViewCellSetData(indexPath,cell: cell as! CollectBookUserTableViewCell)
                return cell
            }
        default:
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: UserInfoTableViewCell.description() , for: indexPath)
                cell.backgroundColor = UIColor.init(hexString: App_Theme_FFFFFF_Color)
                self.tableViewUserInfoTableViewCellSetData(indexPath, cell: cell as! UserInfoTableViewCell)
                return cell
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: CommentInfoTableViewCell.description() , for: indexPath)
                cell.backgroundColor = UIColor.init(hexString: App_Theme_FFFFFF_Color)
                self.tableViewCommentInfoTableViewCellSetData(indexPath, cell: cell as! CommentInfoTableViewCell)
                return cell
            }
        }
    }
}
