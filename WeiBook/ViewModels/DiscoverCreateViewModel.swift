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
    
    }
    
    func tableViewCreateDataTableViewCellSetData(_ indexPath:IndexPath, cell:CreateDataTableViewCell) {
        cell.cellSetData(images: self.selectedAssetsArray)
        cell.addImagesClouse = {
            (self.controller as! DiscoverCreateViewController).presentImagePickerView()
        }
        cell.imagesSelectClouse = { tag, view in
            self.browser.initializePageIndex(tag)
            self.browser.delegate = self
            self.controller?.present(self.browser, animated: true, completion: {
                
            })
        }
    }
    
    func tableViewBookInfoTableViewCellSetData(_ indexPath:IndexPath, cell:BookInfoTableViewCell) {
        
    }
}

//MARK: UITableViewDelegate&DataSource
extension DiscoverCreateViewModel : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 0 && indexPath.row == 1 {
            NavigationPushView(self.controller!, toConroller:  BooksViewController())
        }
        
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
                for v in cell.contentView.subviews {
                    v.removeFromSuperview()
                }
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
