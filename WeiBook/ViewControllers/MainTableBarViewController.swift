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
        
        homeViewController.tabBarItem.image = UIImage.init(named: "tabbar_home")
        
        discoverViewController.tabBarItem.image = UIImage.init(named: "tabbar_discover")
        
        subscriberViewController.tabBarItem.image = UIImage.init(named: "tabbar_subscriber")
        
        profileViewController.tabBarItem.image = UIImage.init(named: "tabbar_profile")
        
        
        self.viewControllers = [homeViewController,discoverViewController,subscriberViewController,profileViewController]
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
