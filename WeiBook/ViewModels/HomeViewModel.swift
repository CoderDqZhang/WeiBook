//
//  HomeViewModel.swift
//  WeiBook
//
//  Created by Zhang on 2017/6/26.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit

class HomeViewModel: BaseViewModel {

    override init() {
        super.init()
        
    }
    
    func pushQRCodeView(){
        let controller = AddBookViewController()
//        controller.isbn = "9787111079279"
//        NavigationPushView(self.controller!, toConroller: controller)
        NavigationPushView(self.controller!, toConroller: QRCodeViewController())
    }
    
    func pushSearchView(){
        let toController = SearchViewController()
        toController.toController = self.controller as! HomeViewController
        NavigaiontPresentView(self.controller!, toController: toController)
    }
    
    func pushViewController(controller:UIViewController?){
        NavigationPushView(self.controller!, toConroller: controller!)
    }
    
    // MARK: NetWorking
    
}
