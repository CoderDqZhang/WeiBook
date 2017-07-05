//
//  DiscoverNewViewModel.swift
//  WeiBook
//
//  Created by Zhang on 2017/7/4.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit

class DiscoverNewViewModel: BaseViewModel {

    override init() {
        
    }
    //MARK: TableViewCellSetData
    func tableViewUserInfoTableViewCellSetData(_ indexPath:IndexPath, cell:UserInfoTableViewCell) {
        
    }
    
    func tableViewCommentInfoTableViewCellSetData(_ indexPath:IndexPath, cell:CommentInfoTableViewCell) {
        
    }
    
    func tableViewBookInfoTableViewCellSetData(_ indexPath:IndexPath, cell:BookInfoTableViewCell) {
        
    }
    
    
}

//MARK: UITableViewDelegate&DataSource
extension DiscoverNewViewModel : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
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
            return 100
        default:
            return 82
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
