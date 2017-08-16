//
//  FanceViewModel.swift
//  WeiBook
//
//  Created by Zhang on 2017/7/7.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit

class FanceViewModel: BaseViewModel {

    var models = NSMutableArray.init()
    override init() {
        super.init()
        self.requestAttention()
    }
    
    func tableViewFollowFanceTableViewCellSetData(_ indexPath:IndexPath, cell:FollowFanceTableViewCell) {
        cell.cellSetData(model: AttentionAndFollowModel.init(fromDictionary: models[indexPath.row] as! NSDictionary))
    }
    
    //MARK: RequestNetWork
    func requestAttention() {
        let url = "\(BaseUrl)\(GetMyFans)"
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
extension FanceViewModel : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0001
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.000001
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
extension FanceViewModel : UITableViewDataSource {
    
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
