//
//  SubscriberViewModel.swift
//  WeiBook
//
//  Created by Zhang on 15/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class SubscriberViewModel: BaseViewModel {

    var model = NSMutableArray.init()
    
    override init() {
        super.init()
        if UserInfoModel.isLoggedIn() {
            self.requestSubscriberList(type: "2")
        }else{
            _ = Tools.shareInstance.showMessage(KWINDOWDS(), msg: "用户未登录", autoHidder: true)
        }
    }
    
    func tableViewBookInfoTableViewCellSetData(_ indexPath:IndexPath, cell:BookInfoTableViewCell) {
        cell.cellSetData(model: ServerBookModel.init(fromDictionary: self.model[indexPath.row] as! NSDictionary))
    }
    
    func tableViewDidSelect(_ indexPath:IndexPath) {
        let bookDesc = BookDescViewController()
        let model = ServerBookModel.init(fromDictionary: self.model[indexPath.row] as! NSDictionary)
        bookDesc.model = model
        NavigationPushView(self.controller!, toConroller: bookDesc)

    }
    
    //MARK: NetWorkingRequest
    func requestSubscriberList(type:String){
        let url = "\(BaseUrl)\(MyCollectBookList)"
        let parameters = ["type":type,
                          "userId":UserInfoModel.shareInstance().tails.userInfo.userId]
        BaseNetWorke.sharedInstance.getUrlWithString(url, parameters: parameters as AnyObject).observe { (resultDic) in
            if !resultDic.isCompleted {
                self.model = NSMutableArray.mj_keyValuesArray(withObjectArray: (resultDic.value as! NSDictionary).object(forKey: "books") as! [Any])
                self.controller?.tableView.reloadData()
            }
        }
        
    }
}

extension SubscriberViewModel : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.tableViewDidSelect(indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0001
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 92
    }
}

extension SubscriberViewModel : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BookInfoTableViewCell.description() , for: indexPath)
        self.tableViewBookInfoTableViewCellSetData(indexPath,cell: cell as! BookInfoTableViewCell)
        return cell
    }
}
