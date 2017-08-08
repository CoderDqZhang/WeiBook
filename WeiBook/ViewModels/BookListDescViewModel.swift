//
//  BookListDescViewModel.swift
//  WeiBook
//
//  Created by Zhang on 08/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class BookListDescViewModel: BaseViewModel {

    var model:BookListDescModel!
    var collectionModel:CollectionModel!
    
    override init() {
        super.init()
    }
    
    func tableViewBookInfoTableViewCellSetData(_ indexPath:IndexPath, cell:BookInfoTableViewCell){
        cell.cellSetData(model: self.model.bookListDesctails.books.item(at: indexPath.row - 1)!)
    }
    
    func tableViewBookListDescInfoTableViewCellSetData(_ indexPath:IndexPath, cell:BookListDescInfoTableViewCell){
        cell.cellSetData(model: model)
    }
    
    //MARK: NetRequestBookList
    func requestBookListDesc(){
        let url = "\(BaseUrl)\(BookListDesc)"
        let parameters = ["userId":UserInfoModel.shareInstance().tails.userInfo.userId,
                          "id":collectionModel.id]
        BaseNetWorke.sharedInstance.getUrlWithString(url, parameters: parameters as AnyObject).observe { (resultDic) in
            if (!resultDic.isCompleted){
                self.model = BookListDescModel.init(fromDictionary: resultDic.value as! NSDictionary)
                self.controller?.tableView.reloadData()
            }
        }
    }
}

extension BookListDescViewModel : UITableViewDelegate {
    
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
        switch indexPath.row {
        case 0:
            return 152
        default:
            return 92
        }
    }
}

extension BookListDescViewModel : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model == nil ? 0 : model.bookListDesctails.books.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: BookListDescInfoTableViewCell.description() , for: indexPath)
            self.tableViewBookListDescInfoTableViewCellSetData(indexPath,cell: cell as! BookListDescInfoTableViewCell)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: BookInfoTableViewCell.description() , for: indexPath)
            self.tableViewBookInfoTableViewCellSetData(indexPath,cell: cell as! BookInfoTableViewCell)
            return cell
        }
        
    }
}
