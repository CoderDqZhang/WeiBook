//
//  DiscoverViewModel.swift
//  WeiBook
//
//  Created by Zhang on 2017/7/4.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit

class DiscoverViewModel: BaseViewModel {

    override init() {
        
    }
    
    func rigthBarItemPress(){
        NavigaiontPresentView(self.controller!, toController: UINavigationController.init(rootViewController: DiscoverCreateViewController()))
    }
}
