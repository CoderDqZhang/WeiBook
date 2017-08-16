//
//  AttentionAndFollowModel.swift
//  WeiBook
//
//  Created by Zhang on 16/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class AttentionAndFollowModel : NSObject, NSCoding{
    
    var createdAt : Int!
    var email : AnyObject!
    var id : String!
    var lastLoginAt : AnyObject!
    var mobile : String!
    var state : Int!
    var tails : Attentiontail!
    var username : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        createdAt = dictionary["createdAt"] as? Int
        email = dictionary["email"] as AnyObject
        id = dictionary["id"] as? String
        lastLoginAt = dictionary["lastLoginAt"] as AnyObject
        mobile = dictionary["mobile"] as? String
        state = dictionary["state"] as? Int
        if let tailsData = dictionary["tails"] as? NSDictionary{
            tails = Attentiontail(fromDictionary: tailsData)
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
        email = aDecoder.decodeObject(forKey: "email") as AnyObject
        id = aDecoder.decodeObject(forKey: "id") as? String
        lastLoginAt = aDecoder.decodeObject(forKey: "lastLoginAt") as AnyObject
        mobile = aDecoder.decodeObject(forKey: "mobile") as? String
        state = aDecoder.decodeObject(forKey: "state") as? Int
        tails = aDecoder.decodeObject(forKey: "tails") as? Attentiontail
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

class Attentiontail : NSObject, NSCoding{
    
    var attentionTime : Int!
    var userInfo : UserInfoSwift!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        attentionTime = dictionary["attentionTime"] as? Int
        if let userInfoData = dictionary["userInfo"] as? NSDictionary{
            userInfo = UserInfoSwift(fromDictionary: userInfoData)
        }
    }
    
    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        var dictionary = NSMutableDictionary()
        if attentionTime != nil{
            dictionary["attentionTime"] = attentionTime
        }
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
        attentionTime = aDecoder.decodeObject(forKey: "attentionTime") as? Int
        userInfo = aDecoder.decodeObject(forKey: "userInfo") as? UserInfoSwift
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if attentionTime != nil{
            aCoder.encode(attentionTime, forKey: "attentionTime")
        }
        if userInfo != nil{
            aCoder.encode(userInfo, forKey: "userInfo")
        }
        
    }
    
}
