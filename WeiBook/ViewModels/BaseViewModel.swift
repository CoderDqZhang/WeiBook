//
//  BaseViewModel.swift
//  WeiBook
//
//  Created by Zhang on 2017/6/21.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit
import SwifterSwift
import DZNEmptyDataSet

class BaseViewModel: NSObject {

    var controller:BaseViewController?
    
    override init() {
        super.init()
    }
}

extension BaseViewModel : DZNEmptyDataSetDelegate {
    func emptyDataSetShouldFade(in scrollView: UIScrollView!) -> Bool {
        return true
    }
    
    func emptyDataSetShouldAllowTouch(_ scrollView: UIScrollView!) -> Bool {
        return true
    }
    
    func emptyDataSetShouldAllowScroll(_ scrollView: UIScrollView!) -> Bool {
        return true
    }
}

extension BaseViewModel : DZNEmptyDataSetSource {
    func image(forEmptyDataSet scrollView: UIScrollView!) -> UIImage! {
        return UIImage.init(named: "wait_develop")
    }
    
    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        return NSAttributedString.init(string: "敬请期待")
    }
}
