//
//  MyGivePresentViewModel.swift
//  WeiBook
//
//  Created by Zhang on 2017/7/6.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit

class MyGivePresentViewModel: BaseViewModel {

    let bookStatus:[GiveBookStatus] = [GiveBookStatus.GiveIn,GiveBookStatus.GiveOut,GiveBookStatus.GiveOut,GiveBookStatus.GiveOut,GiveBookStatus.GiveIn]
    override init() {
        
    }
    
    //MARK: - TableViewCellSetData
    func tableViewGiveUserInfoTableViewCellSetData(_ indexPath:IndexPath, cell:GiveUserInfoTableViewCell) {
        
        cell.cellSetData(bookStatus: bookStatus[indexPath.section])
    }
    
}

//MARK: -UITableViewDelegate&DataSource
extension MyGivePresentViewModel : UITableViewDelegate {
    
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
        default:
            return 92
        }
    }
}
extension MyGivePresentViewModel : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: GiveUserInfoTableViewCell .description() , for: indexPath)
            self.tableViewGiveUserInfoTableViewCellSetData(indexPath, cell: cell as! GiveUserInfoTableViewCell)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: BookInfoTableViewCell.description(), for:indexPath) as! BookInfoTableViewCell
            return cell
        }
    }
}
