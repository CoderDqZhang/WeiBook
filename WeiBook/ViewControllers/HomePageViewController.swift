//
//  HomePageViewController.swift
//  WeiBook
//
//  Created by Zhang on 2017/6/27.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit

let kCollectionLayoutEdging:CGFloat = 29
let kCellSpacing:CGFloat = (SCREENWIDTH - 20) / 8

class HomePageViewController: TYTabButtonPagerController {

    var index:Int = 0
    var viewModel:HomePageViewModel = HomePageViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpPageViewControllerStyle()
        self.bindViewModel()
        self.setUpView()
        // Do any additional setup after loading the view.
    }
    
    func bindViewModel(){
        viewModel.controller = self
    }
    
    override func viewWillAppear(_ animated: Bool) {

    }

    func setUpPageViewControllerStyle(){
        self.collectionLayoutEdging = kCollectionLayoutEdging
        self.pagerBarColor = UIColor.init(hexString: App_Theme_594CA8_Color)
        self.cellSpacing = kCellSpacing
        self.cellEdging = 10
        self.progressHeight = 2
        self.progressEdging = 0
        self.contentTopEdging = 40
        self.progressWidth = 36
        self.normalTextFont = App_Theme_PinFan_R_13_Font
        self.selectedTextFont = App_Theme_PinFan_R_13_Font
        self.normalTextColor = UIColor.init(hexString: App_Theme_8A96A2_Color)
        self.selectedTextColor = UIColor.init(hexString: App_Theme_594CA8_Color)
        self.selectedTextFont = App_Theme_PinFan_R_13_Font
    }
    
    func setUpView(){
        let lineView = GloabLineView(frame: CGRect(x: 0, y: 40, width: SCREENWIDTH, height: 0.5))
        self.view.addSubview(lineView)
    }
    
    func pageViewControllerDidSelectIndexPath(_ index:Int) {
        self.index = index
    }
    
    func filterPress(_ sender:UIBarButtonItem) {
        
    }
    
    func searchPress(_ sender:UIBarButtonItem) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func setBarStyle(_ barStyle: TYPagerBarStyle) {
        super.setBarStyle(barStyle)
    }
    
    // MARK: - TYTabButtonDelegate
    override func pagerController(_ pagerController: TYTabPagerController!, configreCell cell: UICollectionViewCell!, forItemTitle title: String!, at indexPath: IndexPath!) {
        super.pagerController(pagerController, configreCell: cell, forItemTitle: title, at: indexPath)
    }
    
    override func pagerController(_ pagerController: TYTabPagerController!, didScrollToTabPageIndex index: Int) {
        viewModel.pagerControllerDidScrollToTabPageIndex(index)
    }
    
    override func pagerController(_ pagerController: TYPagerController!, transitionFrom fromIndex: Int, to toIndex: Int, animated: Bool) {
        
    }
    
    override func pagerController(_ pagerController: TYPagerController!, willAddViewController index: Int) {
        viewModel.willAddViewController = index
    }
    
    // MARK: - TYTabButtonDataSource
    override func numberOfControllersInPagerController() -> Int {
        return viewModel.numberOfControllersInPagerController()
    }
    override func pagerController(_ pagerController: TYPagerController!, titleFor index: Int) -> String! {
        return viewModel.pagerControllerTitleForIndex(index)
    }
    
    override func pagerController(_ pagerController: TYPagerController!, numberFor index: Int) -> String! {
        return "0"
    }
    
    override func pagerController(_ pagerController: TYPagerController!, controllerFor index: Int) -> UIViewController! {
        return viewModel.pagerControllerControllerForIndex(index)
    }

}
