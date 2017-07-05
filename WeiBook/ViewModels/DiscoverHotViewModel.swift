//
//  DiscoverHotViewModel.swift
//  WeiBook
//
//  Created by Zhang on 2017/7/4.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit

class DiscoverHotViewModel: BaseViewModel {

    var snbBookModel:SBNBookModel!
    override init() {
        super.init()
        self.requestGetBook(isbn: "9789609828413")
    }
    
    func tableViewBookBaseInfoTableViewCellSetData(_ indexPath:IndexPath, cell:BookBaseInfoTableViewCell) {
        if self.snbBookModel != nil {
            cell.cellSetData(model: self.snbBookModel)
        }
    }
    
    func tableViewCommentToolsTableViewCellSetData(_ indexPath:IndexPath, cell:CommentToolsTableViewCell) {
        
    }
    
    //MARK: NetWorking
    func requestGetBook(isbn:String){
        let url = "\(SBNCodeApi)\(isbn)"
        BaseNetWorke.sharedInstance.getUrlWithString(url, parameters: nil).observe { (resultDic) in
            print(resultDic)
            if (!resultDic.isCompleted){
                self.snbBookModel = SBNBookModel.init(fromDictionary: resultDic.value as! NSDictionary)
                self.controller?.tableView.reloadData()
            }
        }
    }
}

//MARK: UITableViewDelegate&DataSource
extension DiscoverHotViewModel : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        NavigationPushView(self.controller!, toConroller: BookDescViewController())
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
            return 164
        default:
            return 40
        }
    }
}
extension DiscoverHotViewModel : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: BookBaseInfoTableViewCell.description() , for: indexPath)
            self.tableViewBookBaseInfoTableViewCellSetData(indexPath,cell: cell as! BookBaseInfoTableViewCell)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: CommentToolsTableViewCell.description() , for: indexPath)
            self.tableViewCommentToolsTableViewCellSetData(indexPath,cell: cell as! CommentToolsTableViewCell)
            return cell
        }
    }
}
