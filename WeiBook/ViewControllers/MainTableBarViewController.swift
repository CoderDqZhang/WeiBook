//
//  MainTableBarViewController.swift
//  WeiBook
//
//  Created by Zhang on 2017/6/19.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit

class MainTableBarViewController: UITabBarController {

    var homeViewController = HomeViewController()
    var discoverViewController = DiscoverViewController()
    var subscriberViewController = SubscriberViewController()
    var profileViewController = ProfileViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setNavigationControllerTitleAndImage(image: UIImage.init(named: "tabbar_home")!, title: "首页", selectImage: nil, controller: homeViewController)
        let homeViewNavigationController = createNavigationController(controller: homeViewController)
//        homePageViewNavigationController.navigationBar.isHidden = false
//        homePageViewController.progressHeight = 0
//        homePageViewController.progressWidth = 0
//        homePageViewController.adjustStatusBarHeight = true
//        homePageViewController.progressColor = UIColor.init(hexString: App_Theme_6B747B_Color)
//        homePageViewNavigationController.hidesBottomBarWhenPushed = true

        
        self.setNavigationControllerTitleAndImage(image: UIImage.init(named: "tabbar_discover")!, title: "发现", selectImage: nil, controller: discoverViewController)
        self.setNavigationControllerTitleAndImage(image: UIImage.init(named: "tabbar_subscribe")!, title: "订阅", selectImage: nil, controller: subscriberViewController)
        self.setNavigationControllerTitleAndImage(image:  UIImage.init(named: "tabbar_profile")!, title: "我的", selectImage: nil, controller: profileViewController)
        
        let controllers = [homeViewNavigationController,createNavigationController(controller: discoverViewController),createNavigationController(controller: subscriberViewController),createNavigationController(controller: profileViewController)]
        
        self.viewControllers = controllers
        // Do any additional setup after loading the view.
    }
    
    func setNavigationControllerTitleAndImage(image:UIImage, title:String, selectImage:UIImage?, controller:UIViewController?) {
        controller?.tabBarItem.image = image
        controller?.tabBarItem.title = title
        controller?.navigationItem.title = title
        controller?.tabBarItem.selectedImage = selectImage
    }

    func createNavigationController(controller:UIViewController?) -> UINavigationController {
        return UINavigationController.init(rootViewController: controller!)
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
