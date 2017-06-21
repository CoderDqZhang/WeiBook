//
//  UIViewController+NavigationBar.swift
//  Meet
//
//  Created by Zhang on 7/1/16.
//  Copyright © 2016 Meet. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {

    func setNavigationItemBack(){
        let leftImage = UIImage.init(named: "Icon_Back_Normal")
        let spacBarButton = UIBarButtonItem.init(barButtonSystemItem: .fixedSpace, target: nil, action: nil);
        self.navigationItem.leftBarButtonItems = [spacBarButton,UIBarButtonItem(image: leftImage?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(UIViewController.backBtnPress(_:)))]
    }

    func backBtnPress(_ sender:UIButton){
        self.view.endEditing(true)
        self.navigationController?.popViewController(animated: true)
    }
    
    func setNavigationItemCleanButton(){
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: nil, style: .plain, target: nil, action: nil)
    }
    
}
