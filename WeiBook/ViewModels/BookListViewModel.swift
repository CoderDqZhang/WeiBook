//
//  BookListViewModel.swift
//  WeiBook
//
//  Created by Zhang on 2017/7/5.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit

class BookListViewModel: BaseViewModel {

    var bookListModels = NSMutableArray.init()
    override init() {
        super.init()
        self.requestBookList()
    }
    
    func tableViewBookInfoTableViewCellSetData(_ indexPath:IndexPath, cell:BookInfoTableViewCell){
        cell.cellSetCollenctionData(model: CollectionModel.init(fromDictionary: bookListModels[indexPath.row] as! NSDictionary))
    }
    
    //MARK: NetRequestBookList
    func requestBookList(){
        let url = "\(BaseUrl)\(BookListCreate)"
        let parameters = ["userId":UserInfoModel.shareInstance().tails.userInfo.userId]
        BaseNetWorke.sharedInstance.getUrlWithString(url, parameters: parameters as AnyObject).observe { (resultDic) in
            if (!resultDic.isCompleted){
                self.bookListModels = NSMutableArray.mj_objectArray(withKeyValuesArray: resultDic.value)
                self.controller?.tableView.reloadData()
            }
        }
    }
}

extension BookListViewModel : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        NavigationPushView(self.controller!, toConroller: BookDescViewController())
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0001
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0001
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 92
    }
}

extension BookListViewModel : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookListModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BookInfoTableViewCell.description() , for: indexPath)
        self.tableViewBookInfoTableViewCellSetData(indexPath,cell: cell as! BookInfoTableViewCell)
        return cell
        
    }
}

