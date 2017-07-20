//
//  HomeViewModel.swift
//  WeiBook
//
//  Created by Zhang on 2017/6/27.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit

class HomeModel: NSObject {

    override init() {
        
    }
}

class BannerTails : NSObject, NSCoding {
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
    @objc func encode(with aCoder: NSCoder) {
        
    }
}

class BannerModel : NSObject, NSCoding{
    
    var bannerName : String!
    var bannerUrl : String!
    var bannerUrlType : String!
    var createdAt : Int!
    var descriptionField : String!
    var id : String!
    var img : String!
    var sort : Int!
    var state : String!
    var tails : BannerTails!
    var type : String!
    var updatedAt : AnyObject!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        bannerName = dictionary["bannerName"] as? String
        bannerUrl = dictionary["bannerUrl"] as? String
        bannerUrlType = dictionary["bannerUrlType"] as? String
        createdAt = dictionary["createdAt"] as? Int
        descriptionField = dictionary["description"] as? String
        id = dictionary["id"] as? String
        img = dictionary["img"] as? String
        sort = dictionary["sort"] as? Int
        state = dictionary["state"] as? String
        type = dictionary["type"] as? String
        updatedAt = dictionary["updatedAt"] as? AnyObject
    }
    
    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        let dictionary = NSMutableDictionary()
        if bannerName != nil{
            dictionary["bannerName"] = bannerName
        }
        if bannerUrl != nil{
            dictionary["bannerUrl"] = bannerUrl
        }
        if bannerUrlType != nil{
            dictionary["bannerUrlType"] = bannerUrlType
        }
        if createdAt != nil{
            dictionary["createdAt"] = createdAt
        }
        if descriptionField != nil{
            dictionary["description"] = descriptionField
        }
        if id != nil{
            dictionary["id"] = id
        }
        if img != nil{
            dictionary["img"] = img
        }
        if sort != nil{
            dictionary["sort"] = sort
        }
        if state != nil{
            dictionary["state"] = state
        }
        if tails != nil{
            dictionary["tails"] = tails.toDictionary()
        }
        if type != nil{
            dictionary["type"] = type
        }
        if updatedAt != nil{
            dictionary["updatedAt"] = updatedAt
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        bannerName = aDecoder.decodeObject(forKey: "bannerName") as? String
        bannerUrl = aDecoder.decodeObject(forKey: "bannerUrl") as? String
        bannerUrlType = aDecoder.decodeObject(forKey: "bannerUrlType") as? String
        createdAt = aDecoder.decodeObject(forKey: "createdAt") as? Int
        descriptionField = aDecoder.decodeObject(forKey: "description") as? String
        id = aDecoder.decodeObject(forKey: "id") as? String
        img = aDecoder.decodeObject(forKey: "img") as? String
        sort = aDecoder.decodeObject(forKey: "sort") as? Int
        state = aDecoder.decodeObject(forKey: "state") as? String
        type = aDecoder.decodeObject(forKey: "type") as? String
        updatedAt = aDecoder.decodeObject(forKey: "updatedAt") as AnyObject
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder) {
        if bannerName != nil{
            aCoder.encode(bannerName, forKey: "bannerName")
        }
        if bannerUrl != nil{
            aCoder.encode(bannerUrl, forKey: "bannerUrl")
        }
        if bannerUrlType != nil{
            aCoder.encode(bannerUrlType, forKey: "bannerUrlType")
        }
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "createdAt")
        }
        if descriptionField != nil{
            aCoder.encode(descriptionField, forKey: "description")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if img != nil{
            aCoder.encode(img, forKey: "img")
        }
        if sort != nil{
            aCoder.encode(sort, forKey: "sort")
        }
        if state != nil{
            aCoder.encode(state, forKey: "state")
        }
        if tails != nil{
            aCoder.encode(tails, forKey: "tails")
        }
        if type != nil{
            aCoder.encode(type, forKey: "type")
        }
        if updatedAt != nil{
            aCoder.encode(updatedAt, forKey: "updatedAt")
        }
        
    }
    
}
