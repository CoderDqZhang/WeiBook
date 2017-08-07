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
        self.viewModle.controller = self
    }

    func setNavigaitonItem(){
        self.navigationItem.title = "我的书库"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "筛选", style: .plain, target: self, action: #selector(BooksViewController.rightBarItemPress))
    }
    
    func rightBarItemPress(){
//        print(bcg84599348)
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
