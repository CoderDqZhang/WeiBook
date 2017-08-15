//
//  SubscriberViewController.swift
//  WeiBook
//
//  Created by Zhang on 2017/6/19.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit

class SubscriberViewController: BaseViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindViewModel(viewModel: SubscriberViewModel(), controller: self)
        self.setUpTableView(style: .plain, cells: [BookInfoTableViewCell.self], controller: self)
        // Do any additional setup after loading the view.
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
