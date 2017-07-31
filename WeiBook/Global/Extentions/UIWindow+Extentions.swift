//
//  UIWindow+Extentions.swift
//  WeiBook
//
//  Created by Zhang on 31/07/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

extension UIWindow  {
    var currentViewController: UIViewController? {
        get {
            if let viewController = rootViewController {
                return viewController.currentViewController
            }
            return nil
        }
    }
}

extension UIViewController {
    var currentViewController: UIViewController {
        get {
            if let presentedViewController = presentedViewController {
                return presentedViewController
            }
            return self
        }
    }
}

extension UINavigationController {
    override var currentViewController: UIViewController {
        get {
            if let viewController = visibleViewController {
                return viewController.currentViewController
            }
            return super.currentViewController
        }
    }
}

extension UITabBarController {
    override var currentViewController: UIViewController {
        get {
            if let viewController = selectedViewController {
                return viewController.currentViewController
            }
            return super.currentViewController
        }
    }
}

extension UIApplication {
    var currentViewController: UIViewController? {
        get {
            if let window = self.keyWindow {
                return window.currentViewController
            }
            return nil
        }
    }
}
