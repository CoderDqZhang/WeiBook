//
//  MyCommonViewModel.swift
//  WeiBook
//
//  Created by Zhang on 22/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit
import SKPhotoBrowser

class MyCommonViewModel: BaseViewModel {
    var browser:SKPhotoBrowser!
    var curPage:String!
    var models = NSMutableArray.init()
    override init() {
        super.init()
        self.requestNewComment(curPage: "1", limit: "10")
    }
    
    //MARK: SKPhotoBrowser
    func setUpPhotoBrowser(imgs:[String]){
        var images = [SKPhoto]()
        for i in 0...imgs.count - 1 {
            let photo = SKPhoto.photoWithImageURL(imgs.item(at: i)!)// add some UIImage
            images.append(photo)
        }
        browser = SKPhotoBrowser.init(photos: images)
    }
    
    //tableViewHeight
    func tableViewHeight(_ indexPath:IndexPath) ->CGFloat{
        let model = DiscoverModel.init(fromDictionary: self.models[indexPath.section] as! NSDictionary)
        return CGFloat((CGFloat(model.tails.commentImages.count / 3) + (model.tails.commentImages.count % 3 == 0 ? 0 : 1)) * (ImageSize.height + 5)) + 50
    }
    
    //MARK: TableViewCellSetData
    
//    func tableViewDidSelect(_ indexPath:IndexPath) {
//        if UserInfoModel.isLoggedIn() {
//            if indexPath.row == 0 {
//                let model = DiscoverModel.init(fromDictionary: self.models[indexPath.section] as! NSDictionary)
//                let booksVC = BooksViewController()
//                booksVC.otherUserModel = model.tails.userInfo
//                booksVC.otherBooks = true
//                NavigationPushView(self.controller!, toConroller: booksVC)
//            }else if indexPath.row == 2 {
//                let bookDesc = BookDescViewController()
//                let model = DiscoverModel.init(fromDictionary: self.models[indexPath.section] as! NSDictionary)
//                bookDesc.model = model.tails.bookInfo
//                NavigationPushView(self.controller!, toConroller: bookDesc)
//            }
//        }else{
//            NavigationPushView(self.controller!, toConroller: LoginViewController())
//        }
//    }
    
    func tableViewCommentInfoTableViewCellSetData(_ indexPath:IndexPath, cell:CommentInfoTableViewCell) {
        let model = DiscoverModel.init(fromDictionary: self.models[indexPath.section] as! NSDictionary)
        var images:[String] = []
        if model.tails.commentImages.count > 0 {
            for comment in model.tails.commentImages {
                images.append(comment.imageUrl)
            }
            self.setUpPhotoBrowser(imgs:images)
        }
        
        cell.cellSetData(title: model.commContent, imgs: images)
        cell.photoBrowserClouse = { tag, view in
            self.browser.initializePageIndex(tag)
            SKPhotoBrowserOptions.displayDeleteButton = false
            self.controller?.present(self.browser, animated: true, completion: {
                
            })
        }
    }
    
    func tableViewBookInfoTableViewCellSetData(_ indexPath:IndexPath, cell:BookInfoTableViewCell) {
        let model = DiscoverModel.init(fromDictionary: self.models[indexPath.section] as! NSDictionary)
        cell.cellSetData(model: model.tails.bookInfo)
    }
    
    //MARK: NetWorkRequest
    func requestNewComment(curPage:String, limit:String){
        let url = "\(BaseUrl)\(MyCommentList)"
        let parameters = ["curPage":curPage,
                          "limit":limit,
                          "userId":UserInfoModel.shareInstance().tails.userInfo.userId]
        self.curPage = curPage
        BaseNetWorke.sharedInstance.getUrlWithString(url, parameters: parameters as AnyObject).observe { (resultDic) in
            if !resultDic.isCompleted {
                if curPage == "1" {
                    self.models.removeAllObjects()
                    self.models = NSMutableArray.mj_objectArray(withKeyValuesArray: resultDic.value)
                }else{
                    self.models.addObjects(from: NSMutableArray.mj_objectArray(withKeyValuesArray: resultDic.value) as! [Any])
                }
                self.controller?.tableView.reloadData()
                self.controller?.stopRefresh()
                self.controller?.stopLoadMoreData()
            }
        }
    }
}

//MARK: UITableViewDelegate&DataSource
extension MyCommonViewModel : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
//        self.tableViewDidSelect(indexPath)
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
            return self.tableViewHeight(indexPath)
        default:
            return 92
        }
    }
}
extension MyCommonViewModel : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: CommentInfoTableViewCell.description() , for: indexPath)
            self.tableViewCommentInfoTableViewCellSetData(indexPath,cell: cell as! CommentInfoTableViewCell)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: BookInfoTableViewCell.description() , for: indexPath)
            self.tableViewBookInfoTableViewCellSetData(indexPath,cell: cell as! BookInfoTableViewCell)
            return cell
        }
    }
}
