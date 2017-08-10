//
//  CategoryListViewController.swift
//  WeiBook
//
//  Created by Zhang on 09/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

typealias CateGotyListClouse = (_ selectArray:NSMutableArray, _ content:String, _ categoryId:String) ->Void

class CategoryListViewController: BaseViewController {

    var cateGotyListClouse:CateGotyListClouse!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.bindViewModel(viewModel: CategoryListViewModel(), controller: self)
        self.setUpTableView(style: .grouped, cells: [GloableImageLableDetailImageCell.self], controller: self)
        self.setUpNavigaitonItem()
        self.bindLogicModel()
        // Do any additional setup after loading the view.
    }
    
    func setUpNavigaitonItem(){
        self.navigationItem.title = "书单分类"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "确定", style: .plain, target: self, action: #selector(CategoryListViewController.rightBarItemPress))
    }
    
    func rightBarItemPress() {
        (self.viewModel as! CategoryListViewModel).rightBarItemPress()
    }
    
    func bindLogicModel(){
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
