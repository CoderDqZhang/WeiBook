//
//  BorrowModel.swift
//  WeiBook
//
//  Created by Zhang on 28/07/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class BorrowModel : NSObject, NSCoding{
    
    var bookId : String!
    var borrowEnd : Int!
    var borrowStart : Int!
    var createdAt : Int!
    var id : String!
    var isReturn : Int!
    var returnTime : Int!
    var state : Int!
    var tails : BorrowAndGivetail!
    var useUserId : String!
    var userId : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        bookId = dictionary["bookId"] as? String
        borrowEnd = dictionary["borrowEnd"] as? Int
        borrowStart = dictionary["borrowStart"] as? Int
        createdAt = dictionary["createdAt"] as? Int
        id = dictionary["id"] as? String
        isReturn = dictionary["isReturn"] as? Int
        returnTime = dictionary["returnTime"] as? Int
        state = dictionary["state"] as? Int
        if let tailsData = dictionary["tails"] as? NSDictionary{
            tails = BorrowAndGivetail(fromDictionary: tailsData)
        }
        useUserId = dictionary["useUserId"] as? String
        userId = dictionary["userId"] as? String
    }
    
    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        let dictionary = NSMutableDictionary()
        if bookId != nil{
            dictionary["bookId"] = bookId
        }
        if borrowEnd != nil{
            dictionary["borrowEnd"] = borrowEnd
        }
        if borrowStart != nil{
            dictionary["borrowStart"] = borrowStart
        }
        if createdAt != nil{
            dictionary["createdAt"] = createdAt
        }
        if id != nil{
            dictionary["id"] = id
        }
        if isReturn != nil{
            dictionary["isReturn"] = isReturn
        }
        if returnTime != nil{
            dictionary["returnTime"] = returnTime
        }
        if state != nil{
            dictionary["state"] = state
        }
        if tails != nil{
            dictionary["tails"] = tails.toDictionary()
        }
        if useUserId != nil{
            dictionary["useUserId"] = useUserId
        }
        if userId != nil{
            dictionary["userId"] = userId
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        bookId = aDecoder.decodeObject(forKey: "bookId") as? String
        borrowEnd = aDecoder.decodeObject(forKey: "borrowEnd") as? Int
        borrowStart = aDecoder.decodeObject(forKey: "borrowStart") as? Int
        createdAt = aDecoder.decodeObject(forKey: "createdAt") as? Int
        id = aDecoder.decodeObject(forKey: "id") as? String
        isReturn = aDecoder.decodeObject(forKey: "isReturn") as? Int
        returnTime = aDecoder.decodeObject(forKey: "returnTime") as? Int
        state = aDecoder.decodeObject(forKey: "state") as? Int
        tails = aDecoder.decodeObject(forKey: "tails") as? BorrowAndGivetail
        useUserId = aDecoder.decodeObject(forKey: "useUserId") as? String
        userId = aDecoder.decodeObject(forKey: "userId") as? String
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if bookId != nil{
            aCoder.encode(bookId, forKey: "bookId")
        }
        if borrowEnd != nil{
            aCoder.encode(borrowEnd, forKey: "borrowEnd")
        }
        if borrowStart != nil{
            aCoder.encode(borrowStart, forKey: "borrowStart")
        }
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "createdAt")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if isReturn != nil{
            aCoder.encode(isReturn, forKey: "isReturn")
        }
        if returnTime != nil{
            aCoder.encode(returnTime, forKey: "returnTime")
        }
        if state != nil{
            aCoder.encode(state, forKey: "state")
        }
        if tails != nil{
            aCoder.encode(tails, forKey: "tails")
        }
        if useUserId != nil{
            aCoder.encode(useUserId, forKey: "useUserId")
        }
        if userId != nil{
            aCoder.encode(userId, forKey: "userId")
        }
        
    }
    
}

class BorrowAndGivetail: NSObject, NSCoding{
    
    var bookInfo : ServerBookModel!
    var userInfo : UserInfoSwiftModel!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        if let bookInfoData = dictionary["bookInfo"] as? NSDictionary{
            bookInfo = ServerBookModel(fromDictionary: bookInfoData)
        }
        if let userInfoData = dictionary["user"] as? NSDictionary{
            userInfo = UserInfoSwiftModel(fromDictionary: userInfoData)
        }
    }
    
    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        let dictionary = NSMutableDictionary()
        if bookInfo != nil{
            dictionary["bookInfo"] = bookInfo.toDictionary()
        }
        if userInfo != nil{
            dictionary["user"] = userInfo.toDictionary()
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        bookInfo = aDecoder.decodeObject(forKey: "bookInfo") as? ServerBookModel
        userInfo = aDecoder.decodeObject(forKey: "user") as? UserInfoSwiftModel
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if bookInfo != nil{
            aCoder.encode(bookInfo, forKey: "bookInfo")
        }
        if userInfo != nil{
            aCoder.encode(userInfo, forKey: "user")
        }
        
    }
    
}

class UserInfoSwiftModel : NSObject, NSCoding{
    
    var createdAt : Int!
    var email : String!
    var id : String!
    var lastLoginAt : AnyObject!
    var mobile : String!
    var state : Int!
    var tails : SwfitUserInfoTail!
    var username : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        createdAt = dictionary["createdAt"] as? Int
        email = dictionary["email"] as? String
        id = dictionary["id"] as? String
        lastLoginAt = dictionary["lastLoginAt"] as AnyObject
        mobile = dictionary["mobile"] as? String
        state = dictionary["state"] as? Int
        if let tailsData = dictionary["tails"] as? NSDictionary{
            tails = SwfitUserInfoTail(fromDictionary: tailsData)
        }
        username = dictionary["username"] as? String
    }
    
    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        let dictionary = NSMutableDictionary()
        if createdAt != nil{
            dictionary["createdAt"] = createdAt
        }
        if email != nil{
            dictionary["email"] = email
        }
        if id != nil{
            dictionary["id"] = id
        }
        if lastLoginAt != nil{
            dictionary["lastLoginAt"] = lastLoginAt
        }
        if mobile != nil{
            dictionary["mobile"] = mobile
        }
        if state != nil{
            dictionary["state"] = state
        }
        if tails != nil{
            dictionary["tails"] = tails.toDictionary()
        }
        if username != nil{
            dictionary["username"] = username
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        createdAt = aDecoder.decodeObject(forKey: "createdAt") as? Int
        email = aDecoder.decodeObject(forKey: "email") as? String
        id = aDecoder.decodeObject(forKey: "id") as? String
        lastLoginAt = aDecoder.decodeObject(forKey: "lastLoginAt") as AnyObject
        mobile = aDecoder.decodeObject(forKey: "mobile") as? String
        state = aDecoder.decodeObject(forKey: "state") as? Int
        tails = aDecoder.decodeObject(forKey: "tails") as? SwfitUserInfoTail
        username = aDecoder.decodeObject(forKey: "username") as? String
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "createdAt")
        }
        if email != nil{
            aCoder.encode(email, forKey: "email")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if lastLoginAt != nil{
            aCoder.encode(lastLoginAt, forKey: "lastLoginAt")
        }
        if mobile != nil{
            aCoder.encode(mobile, forKey: "mobile")
        }
        if state != nil{
            aCoder.encode(state, forKey: "state")
        }
        if tails != nil{
            aCoder.encode(tails, forKey: "tails")
        }
        if username != nil{
            aCoder.encode(username, forKey: "username")
        }
        
    }
    
}

class UserInfoSwift : NSObject, NSCoding{
    
    var address : String!
    var attentionNum : Int!
    var city : AnyObject!
    var company : AnyObject!
    var createdAt : AnyObject!
    var fansNum : AnyObject!
    var hobbyTag : AnyObject!
    var id : String!
    var identify : String!
    var introduction : String!
    var invitationCode : String!
    var nickname : AnyObject!
    var photo : String!
    var professionTag : AnyObject!
    var qq : String!
    var qrCode : String!
    var sex : String!
    var socialUtility : AnyObject!
    var star : String!
    var tails : UseInfotail!
    var title : String!
    var userId : String!
    var weixin : AnyObject!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        address = dictionary["address"] as? String
        attentionNum = dictionary["attentionNum"] as? Int
        city = dictionary["city"] as AnyObject
        company = dictionary["company"] as AnyObject
        createdAt = dictionary["createdAt"] as AnyObject
        fansNum = dictionary["fansNum"] as AnyObject
        hobbyTag = dictionary["hobbyTag"] as AnyObject
        id = dictionary["id"] as? String
        identify = dictionary["identify"] as? String
        introduction = dictionary["introduction"] as? String
        invitationCode = dictionary["invitationCode"] as? String
        nickname = dictionary["nickname"] as AnyObject
        photo = dictionary["photo"] as? String
        professionTag = dictionary["professionTag"] as AnyObject
        qq = dictionary["qq"] as? String
        qrCode = dictionary["qrCode"] as? String
        sex = dictionary["sex"] as? String
        socialUtility = dictionary["socialUtility"] as AnyObject
        star = dictionary["star"] as? String
        if let tailsData = dictionary["tails"] as? NSDictionary{
            tails = UseInfotail(fromDictionary: tailsData)
        }
        title = dictionary["title"] as? String
        userId = dictionary["userId"] as? String
        weixin = dictionary["weixin"] as AnyObject
    }
    
    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        let dictionary = NSMutableDictionary()
        if address != nil{
            dictionary["address"] = address
        }
        if attentionNum != nil{
            dictionary["attentionNum"] = attentionNum
        }
        if city != nil{
            dictionary["city"] = city
        }
        if company != nil{
            dictionary["company"] = company
        }
        if createdAt != nil{
            dictionary["createdAt"] = createdAt
        }
        if fansNum != nil{
            dictionary["fansNum"] = fansNum
        }
        if hobbyTag != nil{
            dictionary["hobbyTag"] = hobbyTag
        }
        if id != nil{
            dictionary["id"] = id
        }
        if identify != nil{
            dictionary["identify"] = identify
        }
        if introduction != nil{
            dictionary["introduction"] = introduction
        }
        if invitationCode != nil{
            dictionary["invitationCode"] = invitationCode
        }
        if nickname != nil{
            dictionary["nickname"] = nickname
        }
        if photo != nil{
            dictionary["photo"] = photo
        }
        if professionTag != nil{
            dictionary["professionTag"] = professionTag
        }
        if qq != nil{
            dictionary["qq"] = qq
        }
        if qrCode != nil{
            dictionary["qrCode"] = qrCode
        }
        if sex != nil{
            dictionary["sex"] = sex
        }
        if socialUtility != nil{
            dictionary["socialUtility"] = socialUtility
        }
        if star != nil{
            dictionary["star"] = star
        }
        if tails != nil{
            dictionary["tails"] = tails.toDictionary()
        }
        if title != nil{
            dictionary["title"] = title
        }
        if userId != nil{
            dictionary["userId"] = userId
        }
        if weixin != nil{
            dictionary["weixin"] = weixin
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        address = aDecoder.decodeObject(forKey: "address") as? String
        attentionNum = aDecoder.decodeObject(forKey: "attentionNum") as? Int
        city = aDecoder.decodeObject(forKey: "city") as AnyObject
        company = aDecoder.decodeObject(forKey: "company") as AnyObject
        createdAt = aDecoder.decodeObject(forKey: "createdAt") as AnyObject
        fansNum = aDecoder.decodeObject(forKey: "fansNum") as AnyObject
        hobbyTag = aDecoder.decodeObject(forKey: "hobbyTag") as AnyObject
        id = aDecoder.decodeObject(forKey: "id") as? String
        identify = aDecoder.decodeObject(forKey: "identify") as? String
        introduction = aDecoder.decodeObject(forKey: "introduction") as? String
        invitationCode = aDecoder.decodeObject(forKey: "invitationCode") as? String
        nickname = aDecoder.decodeObject(forKey: "nickname") as AnyObject
        photo = aDecoder.decodeObject(forKey: "photo") as? String
        professionTag = aDecoder.decodeObject(forKey: "professionTag") as AnyObject
        qq = aDecoder.decodeObject(forKey: "qq") as? String
        qrCode = aDecoder.decodeObject(forKey: "qrCode") as? String
        sex = aDecoder.decodeObject(forKey: "sex") as? String
        socialUtility = aDecoder.decodeObject(forKey: "socialUtility") as AnyObject
        star = aDecoder.decodeObject(forKey: "star") as? String
        tails = aDecoder.decodeObject(forKey: "tails") as? UseInfotail
        title = aDecoder.decodeObject(forKey: "title") as? String
        userId = aDecoder.decodeObject(forKey: "userId") as? String
        weixin = aDecoder.decodeObject(forKey: "weixin") as AnyObject
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if address != nil{
            aCoder.encode(address, forKey: "address")
        }
        if attentionNum != nil{
            aCoder.encode(attentionNum, forKey: "attentionNum")
        }
        if city != nil{
            aCoder.encode(city, forKey: "city")
        }
        if company != nil{
            aCoder.encode(company, forKey: "company")
        }
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "createdAt")
        }
        if fansNum != nil{
            aCoder.encode(fansNum, forKey: "fansNum")
        }
        if hobbyTag != nil{
            aCoder.encode(hobbyTag, forKey: "hobbyTag")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if identify != nil{
            aCoder.encode(identify, forKey: "identify")
        }
        if introduction != nil{
            aCoder.encode(introduction, forKey: "introduction")
        }
        if invitationCode != nil{
            aCoder.encode(invitationCode, forKey: "invitationCode")
        }
        if nickname != nil{
            aCoder.encode(nickname, forKey: "nickname")
        }
        if photo != nil{
            aCoder.encode(photo, forKey: "photo")
        }
        if professionTag != nil{
            aCoder.encode(professionTag, forKey: "professionTag")
        }
        if qq != nil{
            aCoder.encode(qq, forKey: "qq")
        }
        if qrCode != nil{
            aCoder.encode(qrCode, forKey: "qrCode")
        }
        if sex != nil{
            aCoder.encode(sex, forKey: "sex")
        }
        if socialUtility != nil{
            aCoder.encode(socialUtility, forKey: "socialUtility")
        }
        if star != nil{
            aCoder.encode(star, forKey: "star")
        }
        if tails != nil{
            aCoder.encode(tails, forKey: "tails")
        }
        if title != nil{
            aCoder.encode(title, forKey: "title")
        }
        if userId != nil{
            aCoder.encode(userId, forKey: "userId")
        }
        if weixin != nil{
            aCoder.encode(weixin, forKey: "weixin")
        }
        
    }
    
}

class SwfitUserInfoTail : NSObject, NSCoding{
    
    var userInfo : UserInfoSwift!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        if let userInfoData = dictionary["userInfo"] as? NSDictionary{
            userInfo = UserInfoSwift(fromDictionary: userInfoData)
        }
    }
    
    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        let dictionary = NSMutableDictionary()
        if userInfo != nil{
            dictionary["userInfo"] = userInfo.toDictionary()
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        userInfo = aDecoder.decodeObject(forKey: "userInfo") as? UserInfoSwift
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if userInfo != nil{
            aCoder.encode(userInfo, forKey: "userInfo")
        }
        
    }
    
}

class UseInfotail : NSObject{
    
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
    }
    
    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        let dictionary = NSMutableDictionary()
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encodeWithCoder(aCoder: NSCoder)
    {
        
    }
    
}
