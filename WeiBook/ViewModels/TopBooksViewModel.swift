//
//  TopBooksViewModel.swift
//  WeiBook
//
//  Created by Zhang on 2017/6/30.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit

class TopBooksViewModel: BaseViewModel {
    
    override init() {
        
    }

    func tableViewTopBooksTableViewCellSetData(_ indexPath:IndexPath, cell:TopBooksTableViewCell){
        
    }
}

extension TopBooksViewModel : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let bookDescViewController = BookDescViewController()
        let controller = self.controller?.parent as! HomePageViewController
        controller.viewModel.pushViewController(bookDescViewController)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0001
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0001
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SCREENWIDTH / 4 * 24 / 17 + 20
    }
}

extension TopBooksViewModel : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TopBooksTableViewCell.description() , for: indexPath)
        self.tableViewTopBooksTableViewCellSetData(indexPath,cell: cell as! TopBooksTableViewCell)
        return cell

    }
}

