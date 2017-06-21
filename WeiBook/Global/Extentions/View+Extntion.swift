
//
//  View+Extntion.swift
//  LiangPiao
//
//  Created by Zhang on 02/12/2016.
//  Copyright © 2016 Zhang. All rights reserved.
//

import Foundation
import UIKit
extension UIView {
    func findViewController()->UIViewController?{
        var next:UIView? = self
        repeat{
            if let nextResponder = next?.next, nextResponder.isKind(of: UIViewController.self)
            {
                return (nextResponder as! UIViewController)
            }
            next = next?.superview
        }while next != nil
        return nil
    }
}
