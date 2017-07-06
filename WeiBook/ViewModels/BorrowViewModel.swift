//
//  BorrowViewModel.swift
//  WeiBook
//
//  Created by Zhang on 2017/7/6.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit

class BorrowViewModel: BaseViewModel {
    
    let bookStatus:[BorrowStatus] = [BorrowStatus.BorrowIn,BorrowStatus.BorrowOut,BorrowStatus.BorrowOut,BorrowStatus.BorrowDone,BorrowStatus.BorrowTimeEnd]
    override init() {
        
    }
    
    //MARK: - TableViewCellSetData
    func tableViewBorrowUserInfoTableViewCellSetData(_ indexPath:IndexPath, cell:BorrowUserInfoTableViewCell) {
        
        cell.cellSetData(bookStatus: bookStatus[indexPath.section])
    }

}

//MARK: -UITableViewDelegate&DataSource
extension BorrowViewModel : UITableViewDelegate {
    
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
extension BorrowViewModel : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: BorrowUserInfoTableViewCell .description() , for: indexPath)
            self.tableViewBorrowUserInfoTableViewCellSetData(indexPath, cell: cell as! BorrowUserInfoTableViewCell)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: BookInfoTableViewCell.description(), for:indexPath) as! BookInfoTableViewCell
            return cell
        }
    }
}
