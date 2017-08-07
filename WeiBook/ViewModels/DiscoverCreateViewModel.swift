//
//  DiscoverCreateViewModel.swift
//  WeiBook
//
//  Created by Zhang on 2017/7/10.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit
import Photos
import SKPhotoBrowser

class DiscoverCreateViewModel: BaseViewModel {

    var images:[UIImage] = []
    var selectedAssetsArray:[PHAsset] = []
    
    var browser:SKPhotoBrowser!
    var model:ServerBookModel!
    var myBookId:String!
    
    var comments:[Comment] = []
    var commentForm = CommentsForm.init()
    
    override init() {
        super.init()
        self.configSKPhotoBrowser()
        
    }
    
    //MARK: SKPhotoBrowser
    func setUpPhotoBrowser(){
        var images = [SKPhoto]()
        for image in self.images {
            let photo = SKPhoto.photoWithImage(image)// add some UIImage
            images.append(photo)
        }
        browser = SKPhotoBrowser.init(photos: images)
    }
    
    func configSKPhotoBrowser(){
        SKPhotoBrowserOptions.displayDeleteButton = true
        SKPhotoBrowserOptions.displayCounterLabel = true
        SKPhotoBrowserOptions.displayToolbar = true
    }
    
    func tableViewHeight() -> CGFloat{
        let imageCount = selectedAssetsArray.count + 1
        return CGFloat((CGFloat(imageCount / 4) + (imageCount % 4 == 0 ? 0 : 1)) * (ImageSize.height + 5)) + 110
    }
    
    func imagePickerDone(sendImages:[PHAsset]) {
        self.images.removeAll()
        self.selectedAssetsArray.removeAll()
        for asset in sendImages{
            DXPickerHelper.fetchImage(viaAsset: asset, targetSize: ImageSize, imageResultHandler: { (image) in
                self.images.append(image!)
            })
        }
        self.setUpPhotoBrowser()
        self.selectedAssetsArray = sendImages
        self.controller?.tableView.reloadData()
    }
    
    func rigthBarItemPress(){
        if self.selectedAssetsArray.count > 0 {
            self.uploadImages()
        }else{
            self.requestBookComment()
        }
    }
    
    func tableViewDidSelect(_ indexPath:IndexPath) {
        if indexPath.section == 0 && indexPath.row == 1 {
            let books = BooksViewController()
            books.createComment = true
            books.viewModle.bookSelectClouse = { model in
                self.model = model.tails.bookInfo
                self.commentForm.objectId = model.bookId
                self.controller?.tableView.reloadData()
            }
            NavigationPushView(self.controller!, toConroller:  books)
        }
    }
    
    func tableViewCreateDataTableViewCellSetData(_ indexPath:IndexPath, cell:CreateDataTableViewCell) {
        cell.cellSetData(images: self.selectedAssetsArray)
        cell.addImagesClouse = {
            cell.textView.resignFirstResponder()
            (self.controller as! DiscoverCreateViewController).presentImagePickerView()
        }
        cell.imagesSelectClouse = { tag, view in
            self.browser.initializePageIndex(tag)
            self.browser.delegate = self
            self.controller?.present(self.browser, animated: true, completion: {
                
            })
        }
        cell.textView.becomeFirstResponder()
        cell.textView.reactive.continuousTextValues.observeValues { (str) in
            self.commentForm.commContent = str
        }
    }
    
    func tableViewBookInfoTableViewCellSetData(_ indexPath:IndexPath, cell:BookInfoTableViewCell) {
        if self.model != nil {
            cell.cellSetData(model: self.model)
        }
    }
    
    //MARK: RequestComment
    func requestBookComment(){
        self.commentForm.userId = UserInfoModel.shareInstance().tails.userInfo.userId
        let url = "\(BaseUrl)\(CreateBookComment)"
        let dics = NSMutableArray.init()
        for comment in comments {
            let dic = ["imageUrl":comment.imageUrl,
                       "type":comment.type] as [String : Any]
            dics.add(dic)
        }
        let parameters = [
                          "commType":"2",
                          "objectId":self.commentForm.objectId,
                          "userId":self.commentForm.userId,
                          "commContent":self.commentForm.commContent,
                          "comments":dics,
            ] as [String : Any]
        BaseNetWorke.sharedInstance.postUrlWithString(url, parameters: parameters as AnyObject).observe { (resultDic) in
            if !resultDic.isCompleted {
                _ = Tools.shareInstance.showMessage((self.controller?.view)!, msg: "发表动态成功", autoHidder: true)
                self.controller?.dismiss(animated: true, completion: { 
                    
                })
            }
        }

    }
    
    func uploadImages(){
        let hud = Tools.shareInstance.showLoading((self.controller?.view)!, msg: "上传图片中")
        _ = BaseNetWorke.sharedInstance.uploadImages(images: self.selectedAssetsArray, fileName: "bookComment", success: { (resultDic) in
            for url in (resultDic as! NSMutableArray) {
                let comment = Comment.init(url: url as! String, type: 1)
                self.comments.append(comment)
            }
            self.commentForm.comments = self.comments
            Tools.shareInstance.hiddenLoading(hud: hud)
            self.requestBookComment()
        }) { (failureDic) in
            
        }
    }
}

//MARK: UITableViewDelegate&DataSource
extension DiscoverCreateViewModel : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.tableViewDidSelect(indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.00001
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                return self.tableViewHeight()

            default:
                return 92
            }
        default:
            return 44
        }
    }
}
extension DiscoverCreateViewModel : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        default:
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: CreateDataTableViewCell.description() , for: indexPath)
//                for v in cell.contentView.subviews {
//                    v.removeFromSuperview()
//                }
                self.tableViewCreateDataTableViewCellSetData(indexPath,cell: cell as! CreateDataTableViewCell)
                return cell
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: BookInfoTableViewCell.description() , for: indexPath)
                self.tableViewBookInfoTableViewCellSetData(indexPath,cell: cell as! BookInfoTableViewCell)
                return cell
            }
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: AddBookTableViewCell.description() , for: indexPath)
            return cell
        }
    }
}

extension DiscoverCreateViewModel : SKPhotoBrowserDelegate {
    func removePhoto(_ browser: SKPhotoBrowser, index: Int, reload: @escaping (() -> Void)) {
        self.selectedAssetsArray.remove(at: index)
        reload()
        self.controller?.tableView.reloadData()
    }
}
