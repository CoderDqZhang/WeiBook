//
//  MyBookListViewController.swift
//  WeiBook
//
//  Created by Zhang on 2017/6/23.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit

class MyBookListViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindViewModel(viewModel: MyBookListViewModel(), controller: self)
        self.setUpTableView(style: .plain, cells: [BookInfoTableViewCell.self], controller: self)
        self.setUpNavigationItem()
        // Do any additional setup after loading the view.
    }
    
    func setUpNavigationItem(){
        self.navigationItem.title = "我的书单"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "创建", style: .plain, target: self, action: #selector(BookListViewController.rightBarItemPress))
    }
    
    func rightBarItemPress(){
        
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
