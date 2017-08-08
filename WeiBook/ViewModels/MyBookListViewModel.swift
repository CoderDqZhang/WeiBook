//
//  MyBookListViewModel.swift
//  WeiBook
//
//  Created by Zhang on 08/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class MyBookListViewModel: BaseViewModel {

    var bookListModels:BookListModel!
    override init() {
        super.init()
        self.requestBookList()
    }
    
    func tableViewBookInfoTableViewCellSetData(_ indexPath:IndexPath, cell:BookInfoTableViewCell){
        if self.bookListModels != nil {
            cell.cellSetCollenctionData(model: self.bookListModels.collections[indexPath.row])
        }
    }
    
    
    func tableViewDidSelct(_ indexPath:IndexPath) {
        let toControllerVC = BookListDescViewController()
        toControllerVC.collectionModel = self.bookListModels.collections[indexPath.row]
        NavigationPushView(self.controller!, toConroller: toControllerVC)
    }
    
    
    //MARK: NetRequestBookList
    func requestBookList(){
        let url = "\(BaseUrl)\(BookListCreate)"
        let parameters = ["userId":UserInfoModel.shareInstance().tails.userInfo.userId,
                          "state":"2"]
        BaseNetWorke.sharedInstance.getUrlWithString(url, parameters: parameters as AnyObject).observe { (resultDic) in
            if (!resultDic.isCompleted){
                self.bookListModels = BookListModel.init(fromDictionary: resultDic.value as! NSDictionary)
                self.controller?.tableView.reloadData()
            }
        }
    }
}

extension MyBookListViewModel : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.tableViewDidSelct(indexPath)
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

extension MyBookListViewModel : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookListModels == nil ? 0 : bookListModels.collections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BookInfoTableViewCell.description() , for: indexPath)
        self.tableViewBookInfoTableViewCellSetData(indexPath,cell: cell as! BookInfoTableViewCell)
        return cell
        
    }
}
