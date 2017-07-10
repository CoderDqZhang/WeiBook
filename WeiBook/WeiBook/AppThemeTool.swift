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
import SKPhotoBrowser

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
        UINavigationBar.appearance().setBackgroundImage(UIImage.init(color: UIColor.init(hexString: App_Theme_594CA8_Color), size: CGSize(width: SwifterSwift.screenWidth, height: 64)), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage.init()
        UINavigationBar.appearance().isTranslucent = false
        
    }
    
    class func setUpKeyBoardManager() {
        IQKeyboardManager.sharedManager().enable = true
        IQKeyboardManager.sharedManager().enableAutoToolbar = false

    }
    
    class func setUpSKPhotoBrowser() {
        SKPhotoBrowserOptions.displayToolbar = false                              // all tool bar will be hidden
        SKPhotoBrowserOptions.displayCounterLabel = true                         // counter label will be hidden
        SKPhotoBrowserOptions.displayCloseButton = false
        //close button hidden
        SKPhotoBrowserOptions.displayBackAndForwardButton = true                 // back / forward button will be hidden
        SKPhotoBrowserOptions.displayAction = false                               // action button will be hidden
        SKPhotoBrowserOptions.displayDeleteButton = false                          // delete button will be shown
        SKPhotoBrowserOptions.displayHorizontalScrollIndicator = false            // horizontal scroll bar will be hidden
        SKPhotoBrowserOptions.displayVerticalScrollIndicator = false              // vertical scroll bar will be hidden
        SKPhotoBrowserOptions.displayStatusbar = false
        // status bar will be hidden
        SKPhotoBrowserOptions.backgroundColor = UIColor.init(hexString: App_Theme_384249_Color, andAlpha: 0.7)
    }
}
