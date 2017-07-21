//
//  AddBookCommentViewModel.swift
//  WeiBook
//
//  Created by Zhang on 2017/7/11.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit
import Photos
import SKPhotoBrowser
import Qiniu

class AddBookCommentViewModel: BaseViewModel {

    let sectionsNumber = [3,1]
    var bookModel:ServerBookModel!
    var addBookForm = AddBookFormModel.init()
    
    var commentContent:String = ""
    var commentCustomContent:String = ""
    var comments:[Comment] = []
    var uploadImageDone = false
    var uploadRecodeDone = true
    
    let commentTitls = ["很好好的书","超级经典","tag"]
    var customComment = false
    
    var images:[UIImage] = []
    var selectedAssetsArray:[PHAsset] = []
    
    let recoder_manager = RecordManager()//初始化
    var browser:SKPhotoBrowser!
    override init() {
        super.init()
        self.configSKPhotoBrowser()
    }
    
    func rightBarItemPress(){
        self.configForm()
        if self.customComment {
            self.uploadImages()
            if self.uploadRecodeDone {
                self.uploadRecode()
            }
        }else{
            self.navigationPushAddTag()
        }
    }
    
    func configForm(){
        addBookForm.bookId = self.bookModel.id
        addBookForm.userId = UserInfoModel.shareInstance().tails.userInfo.userId
        addBookForm.commentContent = self.customComment ? self.commentCustomContent : self.commentContent
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
    
    func navigationPushAddTag() {
        let toController = AddBookTagsViewController()
        toController.addBookForm = self.addBookForm
        NavigationPushView(self.controller!, toConroller: toController)
    }
    
    
    //MARK: - SetCellData
    func tableViewGloableImageLableDetailImageCellSetData(_ indexPath:IndexPath, cell:GloableImageLableDetailImageCell) {
        cell.cellSetData(image: nil, lableStr: commentTitls[indexPath.row], detailStr: nil)
    }
    
    func tableViewGloableImageLableSwitchCellSetData(_ indexPath:IndexPath, cell:GloableImageLableSwitchCell){
        cell.cellSetData(image: nil, lableStr: "自定义评论", switchStatus: self.customComment)
        cell.gloableImageLableSwitchClouse = { isTrue in
            self.customComment = isTrue
            self.controller?.tableView.reloadSections(IndexSet.init(integer: 1), with: .automatic)
        }
    }
    
    func tableViewCreateDataTableViewCellSetData(_ indexPath:IndexPath, cell:CreateDataTableViewCell) {
        cell.cellSetData(images: self.selectedAssetsArray)
        cell.addImagesClouse = {
            cell.textView.resignFirstResponder()
            (self.controller as! AddBookCommentViewController).presentImagePickerView()
        }
        cell.imagesSelectClouse = { tag, view in
            self.browser.initializePageIndex(tag)
            self.browser.delegate = self
            self.controller?.present(self.browser, animated: true, completion: {
                
            })
        }
        cell.textView.reactive.textValues.observeValues { (str) in
            self.commentCustomContent = str!
        }
    }
    
    func tableViewRecordTableViewCellSetData(_ indexPath:IndexPath, cell:RecordTableViewCell) {
        cell.startButton.reactive.controlEvents(.touchUpInside).observe { (button) in
            self.recoder_manager.beginRecord()//开始录音
            self.uploadRecodeDone = false
            
        }
        cell.stopButton.reactive.controlEvents(.touchUpInside).observe { (button) in
            self.recoder_manager.stopRecord()//结束录音
        }
        cell.playButton.reactive.controlEvents(.touchUpInside).observe { (button) in
            self.recoder_manager.play()//播放录制的音频
        }
    }
    
    //MARK: Request--
    func uploadImages(){
        let hud = Tools.shareInstance.showLoading((self.controller?.view)!, msg: "上传图片中")
        _ = BaseNetWorke.sharedInstance.uploadImages(images: self.selectedAssetsArray, fileName: "bookComment", success: { (resultDic) in
            for url in (resultDic as! NSMutableArray) {
                let comment = Comment.init(url: url as! String, type: 1)
                self.comments.append(comment)
            }
            self.addBookForm.comments = self.comments
            Tools.shareInstance.hiddenLoading(hud: hud)
            self.navigationPushAddTag()
            print(resultDic)
        }) { (failureDic) in
            
        }
    }
    
    func uploadRecode(){
        _ = BaseNetWorke.sharedInstance.uploadRecode(recode: recoder_manager.file_path!, fileName: "bookReconder", success: { (resultDic) in
            let comment = Comment.init(url: resultDic as! String, type: 2)
            self.comments.append(comment)
        }, failure: { (failureDic) in
            
        })
    }
}

//MARK: TableViewDelegate&DataSource

extension AddBookCommentViewModel : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 0 {
            let cell = tableView.cellForRow(at: indexPath)
            if (cell?.accessoryType == .checkmark) {
                cell?.accessoryType = .none
            }else{
                cell?.accessoryType = .checkmark
            }
            commentContent = ""
            for i in 0...tableView.numberOfRows(inSection: indexPath.section) - 1 {
                let cell = tableView.cellForRow(at: IndexPath.init(row: i, section: indexPath.section)) as! GloableImageLableDetailImageCell
                if cell.accessoryType == .checkmark {
                    commentContent = commentContent + (cell.textLabel?.text!)! + ","
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0001
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 44
        default:
            switch indexPath.row {
            case 0:
                return 44
            case 1:
                return self.tableViewHeight()
            default:
                return 60
            }
        }
    }
}
extension AddBookCommentViewModel : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 3
        default:
            return self.customComment ? 3 : 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: GloableImageLableDetailImageCell.description() , for: indexPath)
            self.tableViewGloableImageLableDetailImageCellSetData(indexPath,cell: cell as! GloableImageLableDetailImageCell)
            if indexPath.row == 0 {
                cell.accessoryType = .checkmark
            }
            return cell
        default:
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: GloableImageLableSwitchCell.description() , for: indexPath)
                self.tableViewGloableImageLableSwitchCellSetData(indexPath,cell: cell as! GloableImageLableSwitchCell)
                
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: CreateDataTableViewCell.description() , for: indexPath)
                self.tableViewCreateDataTableViewCellSetData(indexPath,cell: cell as! CreateDataTableViewCell)
                return cell
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: RecordTableViewCell.description() , for: indexPath)
                self.tableViewRecordTableViewCellSetData(indexPath,cell: cell as! RecordTableViewCell)
                return cell
            }
            
        }
    }
}

extension AddBookCommentViewModel : SKPhotoBrowserDelegate {
    func removePhoto(_ browser: SKPhotoBrowser, index: Int, reload: @escaping (() -> Void)) {
        self.selectedAssetsArray.remove(at: index)
        reload()
        self.controller?.tableView.reloadData()
    }
}
