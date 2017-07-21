//
//  AddTagsViewModel.swift
//  WeiBook
//
//  Created by Zhang on 2017/7/11.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit

class AddBookTagsViewModel: BaseViewModel {

    let commentTitls = ["想读","是否可借","是否可赠"]
    var customComment = false
    
    var addBookForm:AddBookFormModel!
    
    override init() {
        super.init()
    }
//    {"state":"1",
//    "userId":"4aeedfa860994ce9aee0febd89d5d005",
//    "bookId":"365b0af28c1b11e69b740050568261f4",
//    "commentContent":"Ceshi"
//    "comments":[["imageUrl":"http://cdn.topveda.cn/bookComment/2017/7/21/bf1d0a3f9a30b825f775b3c78413f73a.jpg","type":"1"],["imageUrl":"http://cdn.topveda.cn/bookComment/2017/7/21/bf1d0a3f9a30b825f775b3c78413f73a.jpg","type":"1"]]
//    }
    func addBookDone(){
        let url = "\(BaseUrl)\(AddBook)"
        let parameters = ["bookId":addBookForm.bookId,
                          "userId":addBookForm.userId,
                          "commentContent":addBookForm.commentContent,
                          "comments":[["imageUrl":"http://cdn.topveda.cn/bookComment/2017/7/21/bf1d0a3f9a30b825f775b3c78413f73a.jpg","type":"1"],["imageUrl":"http://cdn.topveda.cn/bookComment/2017/7/21/bf1d0a3f9a30b825f775b3c78413f73a.jpg","type":"1"]],
                          "state":"1"
                          ] as [String : Any]
        BaseNetWorke.sharedInstance.postUrlWithString(url, parameters: parameters as AnyObject).observe { (resultDic) in
            if !resultDic.isCompleted {
                _ = Tools.shareInstance.showMessage((self.controller?.view)!, msg: "加入书库成功", autoHidder: true)
                self.controller?.navigationController?.popToRootViewController(animated: true)
            }
        }
    }
    
    //MARK: - SetCellData
    func tableViewGloableImageLableDetailImageCellSetData(_ indexPath:IndexPath, cell:GloableImageLableDetailImageCell) {
        cell.cellSetData(image: nil, lableStr: commentTitls[indexPath.row], detailStr: nil)
    }
    
    func tableViewGloableImageLableSwitchCellSetData(_ indexPath:IndexPath, cell:GloableImageLableSwitchCell){
        cell.cellSetData(image: nil, lableStr: "添加位置", switchStatus: self.customComment)
        cell.gloableImageLableSwitchClouse = { isTrue in
            self.customComment = isTrue
            self.controller?.tableView.reloadSections(IndexSet.init(integer: 1), with: .automatic)
        }
    }
}

//MARK: TableViewDelegate&DataSource

extension AddBookTagsViewModel : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 0 {
            let cell = tableView.cellForRow(at: indexPath)
            if (cell?.accessoryType == .checkmark) {
                cell?.accessoryType = .none
            }else{
                cell?.accessoryType = .checkmark
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
        return 44
    }
}
extension AddBookTagsViewModel : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: GloableImageLableSwitchCell.description() , for: indexPath)
            self.tableViewGloableImageLableSwitchCellSetData(indexPath,cell: cell as! GloableImageLableSwitchCell)
            
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: GloableImageLableDetailImageCell.description() , for: indexPath)
            self.tableViewGloableImageLableDetailImageCellSetData(indexPath,cell: cell as! GloableImageLableDetailImageCell)
            if indexPath.row == 0 {
                cell.accessoryType = .checkmark
            }
            return cell
        }
    }
}
