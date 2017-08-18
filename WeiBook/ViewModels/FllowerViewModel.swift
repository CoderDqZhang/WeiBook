//
//  FllowerViewModel.swift
//  WeiBook
//
//  Created by Zhang on 2017/7/7.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit

class FllowerViewModel: BaseViewModel {

    var models = NSMutableArray.init()
    override init() {
        super.init()
        self.requestAttention()
    }
    
    func tableViewFollowFanceTableViewCellSetData(_ indexPath:IndexPath, cell:FollowFanceTableViewCell) {
        if self.models.count > 0 {
            cell.cellSetData(model: AttentionAndFollowModel.init(fromDictionary: models[indexPath.row] as! NSDictionary))
        }
    }
    
    func tableViewDidSelect(_ indexPath:IndexPath){
        let booksVC = BooksViewController()
//        booksVC.otherUserModel = models.tails.user
        booksVC.otherBooks = true
        NavigationPushView(self.controller!, toConroller: booksVC)
    }
    
    //MARK: RequestNetWork
    func requestAttention() {
        let url = "\(BaseUrl)\(GetMyAttention)"
        let parameters = ["attentionType":"2",
                          "userId":UserInfoModel.shareInstance().tails.userInfo.userId]
        BaseNetWorke.sharedInstance.getUrlWithString(url, parameters: parameters as AnyObject).observe { (resultDic) in
            if !resultDic.isCompleted {
                self.models = NSMutableArray.mj_objectArray(withKeyValuesArray: resultDic.value)
                self.controller?.tableView.reloadData()
            }
        }
    }
}

//MARK: -UITableViewDelegate&DataSource
extension FllowerViewModel : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.tableViewDidSelect(indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0001
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.00001
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

extension FllowerViewModel : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FollowFanceTableViewCell .description() , for: indexPath)
        self.tableViewFollowFanceTableViewCellSetData(indexPath, cell: cell as! FollowFanceTableViewCell)
        return cell
    }
}
