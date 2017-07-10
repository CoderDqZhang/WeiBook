//
//  DiscoverNewViewModel.swift
//  WeiBook
//
//  Created by Zhang on 2017/7/4.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit
import SKPhotoBrowser

class DiscoverNewViewModel: BaseViewModel {

    let testUrl = ["http://ww2.sinaimg.cn/thumbnail/904c2a35jw1emu3ec7kf8j20c10epjsn.jpg",
                   "http://ww2.sinaimg.cn/thumbnail/98719e4agw1e5j49zmf21j20c80c8mxi.jpg",
                   "http://ww2.sinaimg.cn/thumbnail/67307b53jw1epqq3bmwr6j20c80axmy5.jpg",
                   "http://ww2.sinaimg.cn/thumbnail/9ecab84ejw1emgd5nd6eaj20c80c8q4a.jpg",
                   "http://ww2.sinaimg.cn/thumbnail/642beb18gw1ep3629gfm0g206o050b2a.gif",
                   "http://ww1.sinaimg.cn/thumbnail/9be2329dgw1etlyb1yu49j20c82p6qc1.jpg",
                   "http://ww2.sinaimg.cn/thumbnail/642beb18gw1ep3629gfm0g206o050b2a.gif",
                   "http://ww1.sinaimg.cn/thumbnail/9be2329dgw1etlyb1yu49j20c82p6qc1.jpg"]
    var browser:SKPhotoBrowser!
    
    override init() {
        
    }
    
    //MARK: SKPhotoBrowser
    func setUpPhotoBrowser(){
        var images = [SKPhoto]()
        for i in 0...testUrl.count - 1 {
            let photo = SKPhoto.photoWithImageURL(testUrl[i])// add some UIImage
            images.append(photo)
        }
        browser = SKPhotoBrowser.init(photos: images)
    }
    
    //tableViewHeight
    func tableViewHeight() ->CGFloat{
        return CGFloat((CGFloat(testUrl.count / 3) + (testUrl.count % 3 == 0 ? 0 : 1)) * (ImageSize.height + 5)) + 50
    }
    
    //MARK: TableViewCellSetData
    func tableViewUserInfoTableViewCellSetData(_ indexPath:IndexPath, cell:UserInfoTableViewCell) {
        
    }
    
    func tableViewCommentInfoTableViewCellSetData(_ indexPath:IndexPath, cell:CommentInfoTableViewCell) {
        self.setUpPhotoBrowser()
        cell.cellSetData(title: "这是一个测试文件", imgs: testUrl)
        cell.photoBrowserClouse = { tag, view in
            self.browser.initializePageIndex(tag)
            SKPhotoBrowserOptions.displayDeleteButton = false 
            self.controller?.present(self.browser, animated: true, completion: {
                
            })
        }
    }
    
    func tableViewBookInfoTableViewCellSetData(_ indexPath:IndexPath, cell:BookInfoTableViewCell) {
        
    }
    
    
}

//MARK: UITableViewDelegate&DataSource
extension DiscoverNewViewModel : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 2 {
            NavigationPushView(self.controller!, toConroller: BookDescViewController())
        }
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
        case 1:
            return self.tableViewHeight()
        default:
            return 92
        }
    }
}
extension DiscoverNewViewModel : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: UserInfoTableViewCell.description() , for: indexPath)
            self.tableViewUserInfoTableViewCellSetData(indexPath,cell: cell as! UserInfoTableViewCell)
            return cell
        case 1:
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

//MARK - SDPhotoBrowser
