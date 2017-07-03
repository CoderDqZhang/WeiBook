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
        controller.isbn = "9787111079279"
        NavigationPushView(self.controller!, toConroller: controller)
//        NavigationPushView(self.controller!, toConroller: QRCodeViewController())
    }
    
    func pushSearchView(){
        NavigaiontPresentView(self.controller!, toController: SearchViewController())
    }
    
    // MARK: NetWorking
    
}
