//
//  TopBooksViewModel.swift
//  WeiBook
//
//  Created by Zhang on 2017/6/30.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit

class TopBooksViewModel: BaseViewModel {
    
    var models = NSMutableArray.init()
    override init() {
        super.init()
        self.requestHotBook()
    }

    func tableViewTopBooksTableViewCellSetData(_ indexPath:IndexPath, cell:TopBooksTableViewCell){
        cell.cellSetData(model: ServerBookModel.init(fromDictionary: self.models[indexPath.row] as! NSDictionary))
    }
    
    //MARK: RequestNet
    func requestHotBook(){
        let url = "\(BaseUrl)\(BookListHot)"
        BaseNetWorke.sharedInstance.getUrlWithString(url, parameters: nil).observe { (resultDic) in
            if !resultDic.isCompleted {
                self.models = NSMutableArray.mj_keyValuesArray(withObjectArray: resultDic.value as! [Any])
                self.controller?.tableView.reloadData()
            }
        }
    }
}

extension TopBooksViewModel : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if UserInfoModel.isLoggedIn() {
            let bookDescViewController = BookDescViewController()
            bookDescViewController.model = ServerBookModel.init(fromDictionary: self.models[indexPath.row] as! NSDictionary)
            let controller = self.controller?.parent as! HomePageViewController
            controller.viewModel.pushViewController(bookDescViewController)
        }else{
            let loginViewController = LoginViewController()
            let controller = self.controller?.parent as! HomePageViewController
            controller.viewModel.pushViewController(loginViewController)
        }
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
        return self.models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TopBooksTableViewCell.description() , for: indexPath)
        self.tableViewTopBooksTableViewCellSetData(indexPath,cell: cell as! TopBooksTableViewCell)
        return cell

    }
}

