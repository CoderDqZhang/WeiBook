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
        let url = "\(BaseUrl)\(BookBorrow)"
        dic.setValue(UserInfoModel.shareInstance().tails.userInfo.userId, forKey: "userUserId")
        let model = BorrowBook.init(fromDictionary: dic)
        let parameters = ["bookId":model.bookId,
                          "userId":model.userId,
                          "userUserId":model.userUserId,
                          "borrowEnd":model.borrowEnd] as [String : Any]
        BaseNetWorke.sharedInstance.postUrlWithString(url, parameters: parameters as AnyObject).observe { (resultDic) in
            if (!resultDic.isCompleted){
                print(resultDic)
            }
        }
    }
}
