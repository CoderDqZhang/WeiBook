//
//  MyGivePresentViewController.swift
//  WeiBook
//
//  Created by Zhang on 2017/6/23.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit

class MyGivePresentViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindViewModel(viewModel: MyGivePresentViewModel(), controller: self)
        self.setUpTableView(style: .grouped, cells: [GiveUserInfoTableViewCell.self, BookInfoTableViewCell.self], controller: self)
        self.setNavigationItem()
        self.setUpTableView()
        // Do any additional setup after loading the view.
    }
    
    func setUpTableView(){
        self.tableView.separatorStyle = .none
    }
    
    func setNavigationItem(){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "筛选", style: .plain, target: self, action: #selector(MyBorrowViewController.rigthBarItemPress))
        self.navigationItem.title = "我的赠送"
    }
    
    func rigthBarItemPress(){
        UIAlertController.shwoAlertControl(self, style: .actionSheet, title: nil, message: nil, titles: ["领受","赠送"], cancel: "取消", doneTitle: nil, cancelAction: {
            
        }) { str in
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
