//
//  AddBookViewModel.swift
//  WeiBook
//
//  Created by Zhang on 2017/7/3.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit

class AddBookViewModel: BaseViewModel {

    var isbnStr:String!
    var snbBookModel:SBNBookModel!
    override init() {
    }
    
    //MARK: NetWorking
    func requestGetBook(isbn:String){
        let url = "\(SBNCodeApi)\(isbn)"
        BaseNetWorke.sharedInstance.getUrlWithString(url, parameters: nil).observe { (resultDic) in
            print(resultDic)
            if (!resultDic.isCompleted){
                self.snbBookModel = SBNBookModel.init(fromDictionary: resultDic.value as! NSDictionary)
            }
        }
    }
}
