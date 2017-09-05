//
//  BookUserListViewController.swift
//  WeiBook
//
//  Created by Zhang on 05/09/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class BookUserListViewController: BaseViewController {

    var users:[UserInfoSwiftModel]!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindViewModel(viewModel: BookUserListViewModel(), controller: self)
        self.setUpTableView(style: .plain, cells: [UserInfoTableViewCell.self], controller: self)
        self.bindLogic()
        // Do any additional setup after loading the view.
    }
    
    func bindLogic(){
        (self.viewModel as! BookUserListViewModel).users = self.users
        self.tableView.reloadData()
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
