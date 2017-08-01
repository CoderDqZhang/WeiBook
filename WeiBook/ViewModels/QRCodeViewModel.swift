//
//  QRCodeViewModel.swift
//  WeiBook
//
//  Created by Zhang on 2017/6/26.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit

class QRCodeViewModel: BaseViewModel {

    
    func lightButtonPress(){
        
    }
    
    //MARK: RequtstNetWorking
    func borrowReqest(dic:NSDictionary) {
        dic.setValue(UserInfoModel.shareInstance().tails.userInfo.userId, forKey: "userUserId")
        let model = QRFormBook.init(fromDictionary: dic)
        if model.giveEnd != nil {
            self.requestGiveBook(model: model)
        }else if model.borrowEnd == nil {
            self.requestBorrowReturn(model: model)
        }else{
            self.requestBorrowBook(model: model)
        }
        
    }
    
    func requestBorrowReturn(model: QRFormBook){
        let url = "\(BaseUrl)\(BookBorrowReturn)"
        let parameters = ["bookId":model.bookId,
                          "userId":model.userId,
                          "useUserId":model.userUserId,
                          ] as [String : Any]
        BaseNetWorke.sharedInstance.postUrlWithString(url, parameters: parameters as AnyObject).observe { (resultDic) in
            if (!resultDic.isCompleted){
                print(resultDic)
                _ = Tools.shareInstance.showMessage((self.controller?.view)!, msg: "还书成功", autoHidder: true)
                self.controller?.popToRoot(animated: true)
            }
        }
    }
    
    func requestBorrowBook(model: QRFormBook) {
        let url = "\(BaseUrl)\(BookBorrow)"
        let parameters = ["bookId":model.bookId,
                          "userId":model.userId,
                          "useUserId":model.userUserId,
                          "borrowEnd":model.borrowEnd] as [String : Any]
        BaseNetWorke.sharedInstance.postUrlWithString(url, parameters: parameters as AnyObject).observe { (resultDic) in
            if (!resultDic.isCompleted){
                print(resultDic)
                 _ = Tools.shareInstance.showMessage((self.controller?.view)!, msg: "借书成功", autoHidder: true)
                self.controller?.popToRoot(animated: true)
            }
        }
    }
    
    func requestGiveBook(model: QRFormBook) {
        let getUrl = "\(BaseUrl)\(BookGet)"
        let parameters = ["bookId":model.bookId,
                          "userId":model.userId,
                          "useUserId":model.userUserId] as [String : Any]
        BaseNetWorke.sharedInstance.postUrlWithString(getUrl, parameters: parameters as AnyObject).observe { (resultDic) in
            if (!resultDic.isCompleted){
                print(resultDic)
                _ = Tools.shareInstance.showMessage((self.controller?.view)!, msg: "领受成功", autoHidder: true)
                self.controller?.popToRoot(animated: true)
            }
        }
        
        let giveUrl = "\(BaseUrl)\(BookGive)"
        let parameter = ["bookId":model.bookId,
                          "userId":model.userUserId,
                          "useUserId":model.userId,
                          "giveEnd":model.giveEnd] as [String : Any]
        BaseNetWorke.sharedInstance.postUrlWithString(giveUrl, parameters: parameter as AnyObject).observe { (resultDic) in
            if (!resultDic.isCompleted){
                print(resultDic)
            }
        }
    }
}
