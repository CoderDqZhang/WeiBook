//
//  BookUserListView.swift
//  WeiBook
//
//  Created by Zhang on 05/09/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class BookUserListViewModel: BaseViewModel {

    var users:[UserInfoSwiftModel] = []
    
    override init() {
        super.init()
    }
    
    //MARK: TableViewCellSetData
    func tableViewUserInfoTableViewCellSetData(_ indexPath:IndexPath, cell:UserInfoTableViewCell) {
        cell.cellSetData(model: users[indexPath.row])
    }
    
    func tableViewDidSelect(_ indexPath:IndexPath) {
        let booksVC = BooksViewController()
        booksVC.otherUserModel = users[indexPath.row]
        booksVC.otherBooks = true
        NavigationPushView(self.controller!, toConroller: booksVC)
    }
}

//MARK: TableViewDelegate&DataSource
extension BookUserListViewModel : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.tableViewDidSelect(indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.00001
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0001
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

extension BookUserListViewModel : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserInfoTableViewCell.description() , for: indexPath)
        cell.backgroundColor = UIColor.init(hexString: App_Theme_FFFFFF_Color)
        self.tableViewUserInfoTableViewCellSetData(indexPath, cell: cell as! UserInfoTableViewCell)
        return cell
    }
}
