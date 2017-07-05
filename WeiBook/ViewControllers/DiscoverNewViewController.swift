//
//  DisCoverNewViewController.swift
//  WeiBook
//
//  Created by Zhang on 2017/7/4.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit

class DiscoverNewViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindViewModel(viewModel: DiscoverNewViewModel(), controller: self)
        self.setUpTableView(style: .grouped, cells: [UserInfoTableViewCell.self,CommentInfoTableViewCell.self,BookInfoTableViewCell.self], controller: self)
        self.setUpView()
        // Do any additional setup after loading the view.
    }
    
    func setUpView(){
        self.tableView.separatorStyle = .none
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
