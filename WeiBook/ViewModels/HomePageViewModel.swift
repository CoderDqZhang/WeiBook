//
//  HomePageViewModel.swift
//  WeiBook
//
//  Created by Zhang on 2017/6/27.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit

class HomePageViewModel: NSObject {
    
    var controller:HomePageViewController!
    var selectIdex:Int = 0
    var willAddViewController:Int = 0
    var pageControllers:NSMutableArray = NSMutableArray.init(array: [RecommendViewController(),CatergoryViewController(),TopBooksViewController(),OtherViewController()])
    var pageCOntrollersTitls = ["推荐","分类","榜单","其他"]
    override init() {
        super.init()
    }
    
    
    func pushQRCodeView(){
        NavigationPushView(self.controller, toConroller: QRCodeViewController())
    }
    
    func pushSearchView(){
        NavigationPushView(self.controller, toConroller: SearchViewController())
    }
    
    func numberOfControllersInPagerController() -> Int {
        return 4
    }
    
    func pagerControllerTitleForIndex(_ index:Int) ->String {
        return pageCOntrollersTitls[index]
    }
    
    func pagerControllerControllerForIndex(_ index:Int) ->UIViewController {
        return pageControllers[index] as! UIViewController
    }
    
    func pagerControllerDidScrollToTabPageIndex(_ index:Int) {
        selectIdex = index
//        if pageControllers.count != 0 {
//            if !(reconmmendModels[index] is RecommentTickes){
//                self.requestCategotyData(index, controller: pageControllers[index] as! BaseTicketsPageViewController)
//            }
//        }
    }

}
