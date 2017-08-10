//
//  CreateBookListViewController.swift
//  WeiBook
//
//  Created by Zhang on 08/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class CreateBookListViewController: BaseViewController {

    var categoryArray:ZHPickView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindViewModel(viewModel: CreateBookListViewModel(), controller: self)
        self.setUpTableView(style: .grouped, cells: [BookInfoTableViewCell.self, GloableTextFieldCell.self, GloableTextViewCell.self, GloableLableDetailLabelImageCell.self], controller: self)
        self.setUpNavigationItem()
        // Do any additional setup after loading the view.
    }

    func setUpNavigationItem(){
        self.navigationItem.title = "创建书单"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "创建", style: .plain, target: self, action: #selector(CreateBookListViewController.rightBarItemPress))
    }
    
    func rightBarItemPress(){
        (self.viewModel as! CreateBookListViewModel).rightBarItemPress()
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
