//
//  AddBookTagsViewController.swift
//  WeiBook
//
//  Created by Zhang on 2017/7/11.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit

class AddBookTagsViewController: BaseViewController {

    var bottomBtn:GloableBottomButtonView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindViewModel(viewModel: AddBookTagsViewModel(), controller: self)
        self.setUpTableView(style: .plain, cells: [GloableImageLableDetailImageCell.self,GloableImageLableSwitchCell.self], controller: self)
        self.setUpView()
        // Do any additional setup after loading the view.
    }
    
    func setUpView(){
        tableView.snp.remakeConstraints { (make) in
            make.top.equalTo(self.view.snp.top).offset(0)
            make.left.equalTo(self.view.snp.left).offset(0)
            make.right.equalTo(self.view.snp.right).offset(0)
            make.bottom.equalTo(self.view.snp.bottom).offset(-49)
        }
        bottomBtn = GloableBottomButtonView.init(frame: nil, title: "加入书库", tag: 1, action: { (tag) in
            (self.viewModel as! AddBookTagsViewModel).addBookDone()
        })
        self.view.addSubview(bottomBtn)
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
