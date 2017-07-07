//
//  FanceViewModel.swift
//  WeiBook
//
//  Created by Zhang on 2017/7/7.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit

class FanceViewModel: BaseViewModel {

    override init() {
        
    }
    
    func tableViewFollowFanceTableViewCellSetData(_ indexPath:IndexPath, cell:FollowFanceTableViewCell) {
        
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
        return 10
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
        return 12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FollowFanceTableViewCell .description() , for: indexPath)
        self.tableViewFollowFanceTableViewCellSetData(indexPath, cell: cell as! FollowFanceTableViewCell)
        return cell
    }
}
