//
//  BookListDescViewController.swift
//  WeiBook
//
//  Created by Zhang on 08/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class BookListDescViewController: BaseViewController {

    var collectionModel:CollectionModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindViewModel(viewModel: BookListDescViewModel(), controller: self)
        self.setUpTableView(style: .plain, cells: [BookListDescInfoTableViewCell.self, BookInfoTableViewCell.self], controller: self)
        self.bindLogicViewModel()
        // Do any additional setup after loading the view.
    }
    
    func bindLogicViewModel(){
        
        (self.viewModel as! BookListDescViewModel).collectionModel = self.collectionModel
        if self.collectionModel.tails.user.tails.userInfo.userId != UserInfoModel.shareInstance().tails.userInfo.userId {
            self.setUpNavigationItem()
        }
        (self.viewModel as! BookListDescViewModel).requestBookListDesc()
    }
    
    func setUpNavigationItem(){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "收藏", style: .plain, target: self, action: #selector(BookListDescViewController.rightBarItemPress))
    }
    
    func rightBarItemPress(){
        (self.viewModel as! BookListDescViewModel).rightBarItemPress()
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
