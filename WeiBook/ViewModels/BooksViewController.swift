//
//  MyBooksViewController.swift
//  WeiBook
//
//  Created by Zhang on 2017/6/23.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit
import SwifterSwift

class BooksViewController: BaseViewController {

    var collectView:UICollectionView!
    var viewModle = BooksViewModel()
    var createComment:Bool = false
    var createBookList:Bool = false
    var otherBooks:Bool = false
    var otherUserModel:UserInfoSwiftModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
        self.bindLogicViewModel()
        self.setNavigaitonItem()
        
        // Do any additional setup after loading the view.
    }
    
    func setUpView(){
        self.setUpCollectView()
    }
    
    func setUpCollectView() {
        let collectionViewLayout = UICollectionViewFlowLayout.init()
        collectView = UICollectionView.init(frame: CGRect.init(x: 0, y: 0, width: SwifterSwift.screenWidth, height: SwifterSwift.screenHeight - 64), collectionViewLayout: collectionViewLayout)
        collectView.register(MyBooksCollectionViewCell.self, forCellWithReuseIdentifier: MyBooksCollectionViewCell.description())
        collectView.backgroundColor = UIColor.init(hexString: App_Theme_FFFFFF_Color)
        collectView.delegate = viewModle
        collectView.dataSource = viewModle
        self.view.addSubview(collectView)
    }
    
    func bindLogicViewModel(){
        self.viewModle.createComment = self.createComment
        self.viewModle.createBookList = self.createBookList
        self.viewModle.controller = self
        self.viewModle.bookController = self
        if self.otherBooks && otherUserModel != nil {
            self.viewModle.requestMyBooks(uid: otherUserModel.tails.userInfo.userId)
        }else{
            self.viewModle.requestMyBooks(uid: UserInfoModel.shareInstance().tails.userInfo.userId)
        }
    }

    func setNavigaitonItem(){
        if self.otherBooks && otherUserModel != nil {
            self.navigationItem.title = "\((otherUserModel.username)!)的书库"
        }else{
            self.navigationItem.title = "我的书库"
            self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "筛选", style: .plain, target: self, action: #selector(BooksViewController.rightBarItemFilter))
        }
    }
    
    func setNavigationItemCollect(collect:Bool){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: collect ? UIImage.init(named: "collection_select") : UIImage.init(named: "collection_normal"), style: .plain, target: self, action: #selector(BookDescViewController.collectRightBarItemPress))
    }
    
    func rightBarItemFilter(){
        UIAlertController.shwoAlertControl(self, style: .actionSheet, title: nil, message: nil, titles: ["拥有","借出","待还","已还","全部"], cancel: "取消", doneTitle: nil, cancelAction: {
            
        }) { str in
            let status = str == "拥有" ? 1 : str == "借出" ? 2 : str == "待还" ? 3 : str == "已还" ? 4 : 0
            (self.viewModle ).rightBarItemFilter(status:status)
        }
    }
    
    func collectRightBarItemPress(){
        (self.viewModle ).rightBarItemPress()
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
