//
//  HomeViewController.swift
//  WeiBook
//
//  Created by Zhang on 2017/6/19.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit
import FDFullscreenPopGesture

class HomeViewController: BaseViewController {

    var searchNavigationBar = GloableNavigationBarView(frame: CGRect(x: 0,y: 0,width: SwifterSwift.screenWidth, height: 64),font:App_Theme_PinFan_L_12_Font)
    var homePageViewController:HomePageViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.bindViewModel(viewModel: HomeViewModel(), controller: self)
        self.setUpView()
        self.setLogicViewModel()
        self.addPagerController()
        // Do any additional setup after loading the view.
    }
    
    func setUpView(){
        self.view.addSubview(searchNavigationBar)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.fd_prefersNavigationBarHidden = true
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func setLogicViewModel(){
        searchNavigationBar.searchNavigationBarQRCodeButtonClouse =  { _ in
            (self.viewModel as! HomeViewModel).pushQRCodeView()
        }
        
        searchNavigationBar.searchTextFieldBecomFirstRespoder = { _ in
            (self.viewModel as! HomeViewModel).pushSearchView()
        }
    }
    
    func addPagerController(){
        homePageViewController = HomePageViewController()
        homePageViewController.progressHeight = 0
        homePageViewController.progressWidth = 0
        homePageViewController.progressColor = UIColor.init(hexString: App_Theme_594CA8_Color)
        homePageViewController.hidesBottomBarWhenPushed = true
        homePageViewController.view.frame = CGRect.init(x: 0, y: 64, width: SwifterSwift.screenWidth, height: SwifterSwift.screenHeight - 108)
        homePageViewController.viewModel.pageViewModelClouse = { controller in
            (self.viewModel as! HomeViewModel).pushViewController(controller: controller)
        }
        self.view.addSubview(homePageViewController.view)
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
