//
//  BookDescViewModel.swift
//  WeiBook
//
//  Created by Zhang on 2017/7/5.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit

class BookDescViewModel: BaseViewModel {
    
    var model:ServerBookModel!
    var bookDescModel:BookDescModel!
    
    override init() {
        super.init()
    }
    
    func borrowButtonPress(time:Int64){
        let toController = BaseWebViewController()
        toController.url = "\(QRCodeUrl)'bookId':'\((self.model.id)!)','userId':'\((UserInfoModel.shareInstance().tails.userInfo.userId)!)','borrowEnd':'\(time)'"
        NavigationPushView(self.controller!, toConroller: toController)
    }

    
    //MARK: RequestNetWork
    func requstBookDesc(){
        let url = "\(BaseUrl)\(BookDetail)"
        let parameters = ["userId":UserInfoModel.shareInstance().tails.userInfo.userId,
             "id":self.model.id]
        BaseNetWorke.sharedInstance.getUrlWithString(url, parameters: parameters as AnyObject).observe { (resultDic) in
            if (!resultDic.isCompleted){
                self.bookDescModel = BookDescModel.init(fromDictionary: resultDic.value as! NSDictionary)
            }
        }
    }
}
