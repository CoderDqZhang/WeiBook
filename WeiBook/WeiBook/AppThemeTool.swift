//
//  AppThemeTool.swift
//  LiangPiao
//
//  Created by Zhang on 31/10/2016.
//  Copyright © 2016 Zhang. All rights reserved.
//

import Foundation
import UIKit
import IQKeyboardManagerSwift

class AppleThemeTool {
    class func setUpToolBarColor() {
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.init(hexString: App_Theme_8A96A2_Color)], for: UIControlState())
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.init(hexString: App_Theme_594CA8_Color)], for: .selected)
        UITabBar.appearance().tintColor = UIColor.init(hexString: App_Theme_594CA8_Color)
        
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().barTintColor = UIColor.init(hexString: App_Theme_594CA8_Color)
        UINavigationBar.appearance().titleTextAttributes = [NSFontAttributeName:App_Theme_PinFan_L_17_Font!,NSForegroundColorAttributeName:UIColor.init(hexString: App_Theme_FFFFFF_Color)]
        UIBarButtonItem.appearance().setTitleTextAttributes([NSFontAttributeName:App_Theme_PinFan_L_15_Font!,NSForegroundColorAttributeName:UIColor.init(hexString: App_Theme_FFFFFF_Color)], for: UIControlState())
        SHARE_APPLICATION.setStatusBarStyle(.lightContent, animated: false)
        UINavigationBar.appearance().setBackgroundImage(UIImage.init(color: UIColor.init(hexString: App_Theme_594CA8_Color), size: CGSize(width: SCREENWIDTH, height: 64)), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage.init()
        UINavigationBar.appearance().isTranslucent = false
        
    }
    
    class func setUpKeyBoardManager() {
        IQKeyboardManager.sharedManager().enable = true
        IQKeyboardManager.sharedManager().enableAutoToolbar = false

    }
}
