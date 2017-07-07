//
//  FansViewController.swift
//  WeiBook
//
//  Created by Zhang on 2017/6/23.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit

class FansViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindViewModel(viewModel: FanceViewModel(), controller: self)
        self.setUpTableView(style: .plain, cells: [FollowFanceTableViewCell.self], controller: self)
        self.setNavigationItem()
        // Do any additional setup after loading the view.
    }
    
    func setNavigationItem(){
        self.navigationItem.title = "我的粉丝"
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
