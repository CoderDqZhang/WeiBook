//
//  AddBookViewController.swift
//  WeiBook
//
//  Created by Zhang on 2017/7/3.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit
import SwifterSwift

class AddBookViewController: BaseViewController {

    var isbn:String = ""
    var bottomBtn:GloableBottomButtonView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpNavigaitonItem()
        self.view.backgroundColor = UIColor.init(hexString: App_Theme_F8F9F9_Color)
        self.bindViewModel(viewModel: AddBookViewModel(), controller: self)
        self.setUpTableView(style: .plain, cells: [BookBaseInfoTableViewCell.self,BookAdvanceTableViewCell.self,BookTagTableViewCell.self], controller: self)
        self.logicViewModel()
        self.setUpView()
        // Do any additional setup after loading the view.
    }

    func setUpView(){
        self.tableView.separatorStyle = .none
        self.tableView.backgroundColor = UIColor.init(hexString: App_Theme_F8F9F9_Color)
        tableView.snp.remakeConstraints { (make) in
            make.top.equalTo(self.view.snp.top).offset(0)
            make.left.equalTo(self.view.snp.left).offset(0)
            make.right.equalTo(self.view.snp.right).offset(0)
            make.bottom.equalTo(self.view.snp.bottom).offset(-49)
        }
        bottomBtn = GloableBottomButtonView.init(frame: nil, title: "加入书库", tag: 1, action: { (tag) in
            NavigationPushView(self, toConroller: AddBookCommentViewController())
        })
        self.view.addSubview(bottomBtn)
    }
    
    func setUpNavigaitonItem(){
        self.navigationController?.navigationBar.barTintColor = UIColor.init(hexString: App_Theme_594CA8_Color, andAlpha: 1)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage.init(color: UIColor.init(hexString: App_Theme_594CA8_Color, andAlpha: 1), size: CGSize(width: SwifterSwift.screenWidth, height: 64)), for: .default)
        self.navigationController?.navigationBar.isTranslucent  = false
    }
    
    
    
    func logicViewModel(){
        (self.viewModel as! AddBookViewModel).isbnStr = self.isbn
        (self.viewModel as! AddBookViewModel).requestGetBook(isbn: self.isbn)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.fd_interactivePopDisabled = true
        self.navigationController?.fd_prefersNavigationBarHidden = false
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func backBtnPress(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
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
