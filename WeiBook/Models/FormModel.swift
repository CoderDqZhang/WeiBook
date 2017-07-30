//
//  FormModel.swift
//  WeiBook
//
//  Created by Zhang on 2017/7/21.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit

class FormModel: NSObject {

}

class Comment: NSObject {
    var imageUrl:String!
    var type:Int!
    
    override init() {
        
    }
    
    init(url:String!, type:Int) {
        self.imageUrl = url
        self.type = type
    }
}

class AddBookFormModel: NSObject {
    var bookId:String!
    var userId:String!
    var commentContent:String!
    var comments:[Comment] = []
    override init() {
        super.init()
    }
}

class QRFormBook: NSObject {
    var bookId:String!
    var userId:String!
    var userUserId:String!
    var borrowEnd:String!
    var giveEnd:String!
    init(fromDictionary dictionary: NSDictionary){
        bookId = dictionary["bookId"] as? String
        userId = dictionary["userId"] as? String
        userUserId = dictionary["userUserId"] as? String
        borrowEnd = dictionary["borrowEnd"] as? String
        giveEnd = dictionary["giveEnd"] as? String
    }
}


