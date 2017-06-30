//
//  SetingViewController.swift
//  WeiBook
//
//  Created by Zhang on 2017/6/23.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit

class SetingViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindViewModel(viewModel: SettingViewModel(), controller: self)
        self.setUpTableView(style: .grouped, cells: [GloableLableDetailLabelImageCell.self], controller: self)
        self.navigationItem.title = "设置"
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
