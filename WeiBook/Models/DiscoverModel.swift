//
//  DiscoverModel.swift
//  WeiBook
//
//  Created by Zhang on 14/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class DiscoverModel : NSObject, NSCoding{
    
    var commContent : String!
    var commType : Int!
    var createdAt : Int!
    var currentpage : AnyObject!
    var deletedAt : AnyObject!
    var id : String!
    var isDelete : Int!
    var objectId : String!
    var pagesize : AnyObject!
    var starNum : Int!
    var tails : DiscoverTail!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        commContent = dictionary["commContent"] as? String
        commType = dictionary["commType"] as? Int
        createdAt = dictionary["createdAt"] as? Int
        currentpage = dictionary["currentpage"] as AnyObject
        deletedAt = dictionary["deletedAt"] as AnyObject
        id = dictionary["id"] as? String
        isDelete = dictionary["isDelete"] as? Int
        objectId = dictionary["objectId"] as? String
        pagesize = dictionary["pagesize"] as AnyObject
        starNum = dictionary["starNum"] as? Int
        if let tailsData = dictionary["tails"] as? NSDictionary{
            tails = DiscoverTail(fromDictionary: tailsData)
        }
    }
    
    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        let dictionary = NSMutableDictionary()
        if commContent != nil{
            dictionary["commContent"] = commContent
        }
        if commType != nil{
            dictionary["commType"] = commType
        }
        if createdAt != nil{
            dictionary["createdAt"] = createdAt
        }
        if currentpage != nil{
            dictionary["currentpage"] = currentpage
        }
        if deletedAt != nil{
            dictionary["deletedAt"] = deletedAt
        }
        if id != nil{
            dictionary["id"] = id
        }
        if isDelete != nil{
            dictionary["isDelete"] = isDelete
        }
        if objectId != nil{
            dictionary["objectId"] = objectId
        }
        if pagesize != nil{
            dictionary["pagesize"] = pagesize
        }
        if starNum != nil{
            dictionary["starNum"] = starNum
        }
        if tails != nil{
            dictionary["tails"] = tails.toDictionary()
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        commContent = aDecoder.decodeObject(forKey: "commContent") as? String
        commType = aDecoder.decodeObject(forKey: "commType") as? Int
        createdAt = aDecoder.decodeObject(forKey: "createdAt") as? Int
        currentpage = aDecoder.decodeObject(forKey: "currentpage") as AnyObject
        deletedAt = aDecoder.decodeObject(forKey: "deletedAt") as AnyObject
        id = aDecoder.decodeObject(forKey: "id") as? String
        isDelete = aDecoder.decodeObject(forKey: "isDelete") as? Int
        objectId = aDecoder.decodeObject(forKey: "objectId") as? String
        pagesize = aDecoder.decodeObject(forKey: "pagesize") as AnyObject
        starNum = aDecoder.decodeObject(forKey: "starNum") as? Int
        tails = aDecoder.decodeObject(forKey: "tails") as? DiscoverTail
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if commContent != nil{
            aCoder.encode(commContent, forKey: "commContent")
        }
        if commType != nil{
            aCoder.encode(commType, forKey: "commType")
        }
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "createdAt")
        }
        if currentpage != nil{
            aCoder.encode(currentpage, forKey: "currentpage")
        }
        if deletedAt != nil{
            aCoder.encode(deletedAt, forKey: "deletedAt")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if isDelete != nil{
            aCoder.encode(isDelete, forKey: "isDelete")
        }
        if objectId != nil{
            aCoder.encode(objectId, forKey: "objectId")
        }
        if pagesize != nil{
            aCoder.encode(pagesize, forKey: "pagesize")
        }
        if starNum != nil{
            aCoder.encode(starNum, forKey: "starNum")
        }
        if tails != nil{
            aCoder.encode(tails, forKey: "tails")
        }
        
    }
    
}

class DiscoverTail : NSObject, NSCoding{
    
    var bookInfo : ServerBookModel!
    var commentImages : [CommentImage]!
    var userInfo : UserInfoSwiftModel!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        if let bookInfoData = dictionary["bookInfo"] as? NSDictionary{
            bookInfo = ServerBookModel(fromDictionary: bookInfoData)
        }
        if let bookInfoData = dictionary["book"] as? NSDictionary{
            bookInfo = ServerBookModel(fromDictionary: bookInfoData)
        }
        commentImages = [CommentImage]()
        if let commentImagesArray = dictionary["commentImages"] as? [NSDictionary]{
            for dic in commentImagesArray{
                let value = CommentImage(fromDictionary: dic)
                commentImages.append(value)
            }
        }
        if let userInfoData = dictionary["userInfo"] as? NSDictionary{
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
        if bookInfo != nil{
            dictionary["book"] = bookInfo.toDictionary()
        }
        if commentImages != nil{
            var dictionaryElements = [NSDictionary]()
            for commentImagesElement in commentImages {
                dictionaryElements.append(commentImagesElement.toDictionary())
            }
            dictionary["commentImages"] = dictionaryElements
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
        bookInfo = aDecoder.decodeObject(forKey: "bookInfo") as? ServerBookModel
        commentImages = aDecoder.decodeObject(forKey: "commentImages") as? [CommentImage]
        userInfo = aDecoder.decodeObject(forKey: "userInfo") as? UserInfoSwiftModel
        
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
        if commentImages != nil{
            aCoder.encode(commentImages, forKey: "commentImages")
        }
        if userInfo != nil{
            aCoder.encode(userInfo, forKey: "userInfo")
        }
        
    }
    
}
