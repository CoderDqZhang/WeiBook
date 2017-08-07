//
//  CommentModel.swift
//  WeiBook
//
//  Created by Zhang on 07/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class CommentModel : NSObject, NSCoding{
    
    var tails : CommentTail!
    var commContent : String!
    var commType : Int!
    var createdAt : String!
    var deletedAt : String!
    var id : String!
    var isDelete : Int!
    var objectId : String!
    var starNum : Int!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        if let commentTailsData = dictionary["tails"] as? NSDictionary{
            tails = CommentTail(fromDictionary: commentTailsData)
        }
        commContent = dictionary["commContent"] as? String
        commType = dictionary["commType"] as? Int
        createdAt = dictionary["createdAt"] as? String
        deletedAt = dictionary["deletedAt"] as? String
        id = dictionary["id"] as? String
        isDelete = dictionary["isDelete"] as? Int
        objectId = dictionary["objectId"] as? String
        starNum = dictionary["starNum"] as? Int
    }
    
    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        let dictionary = NSMutableDictionary()
        if tails != nil{
            dictionary["tails"] = tails.toDictionary()
        }
        if commContent != nil{
            dictionary["commContent"] = commContent
        }
        if commType != nil{
            dictionary["commType"] = commType
        }
        if createdAt != nil{
            dictionary["createdAt"] = createdAt
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
        if starNum != nil{
            dictionary["starNum"] = starNum
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        tails = aDecoder.decodeObject(forKey: "tails") as? CommentTail
        commContent = aDecoder.decodeObject(forKey:"commContent") as? String
        commType = aDecoder.decodeObject(forKey:"commType") as? Int
        createdAt = aDecoder.decodeObject(forKey:"createdAt") as? String
        deletedAt = aDecoder.decodeObject(forKey:"deletedAt") as? String
        id = aDecoder.decodeObject(forKey:"id") as? String
        isDelete = aDecoder.decodeObject(forKey:"isDelete") as? Int
        objectId = aDecoder.decodeObject(forKey:"objectId") as? String
        starNum = aDecoder.decodeObject(forKey:"starNum") as? Int
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if tails != nil{
            aCoder.encode(tails, forKey: "tails")
        }
        if commContent != nil{
            aCoder.encode(commContent, forKey: "commContent")
        }
        if commType != nil{
            aCoder.encode(commType, forKey: "commType")
        }
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "createdAt")
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
        if starNum != nil{
            aCoder.encode(starNum, forKey: "starNum")
        }
        
    }
    
}

class CommentTail : NSObject, NSCoding{
    
    var commentImages : [CommentImage]!
    var user : UserInfoSwift!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        commentImages = [CommentImage]()
        if let commentImagesArray = dictionary["commentImages"] as? [NSDictionary]{
            for dic in commentImagesArray{
                let value = CommentImage(fromDictionary: dic)
                commentImages.append(value)
            }
        }
        if let userData = dictionary["user"] as? NSDictionary{
            user = UserInfoSwift(fromDictionary: userData)
        }
    }
    
    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        let dictionary = NSMutableDictionary()
        if commentImages != nil{
            var dictionaryElements = [NSDictionary]()
            for commentImagesElement in commentImages {
                dictionaryElements.append(commentImagesElement.toDictionary())
            }
            dictionary["commentImages"] = dictionaryElements
        }
        if user != nil{
            dictionary["user"] = user.toDictionary()
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        commentImages = aDecoder.decodeObject(forKey:"commentImages") as? [CommentImage]
        user = aDecoder.decodeObject(forKey:"user") as? UserInfoSwift
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if commentImages != nil{
            aCoder.encode(commentImages, forKey: "commentImages")
        }
        if user != nil{
            aCoder.encode(user, forKey: "user")
        }
        
    }
    
}

class CommentImage : NSObject, NSCoding{
    
    var commentImagestails : CommentImagestail!
    var createAt : String!
    var id : String!
    var imageUrl : String!
    var objectId : String!
    var type : Int!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        if let commentImagestailsData = dictionary["CommentImagestails"] as? NSDictionary{
            commentImagestails = CommentImagestail(fromDictionary: commentImagestailsData)
        }
        createAt = dictionary["createAt"] as? String
        id = dictionary["id"] as? String
        imageUrl = dictionary["imageUrl"] as? String
        objectId = dictionary["objectId"] as? String
        type = dictionary["type"] as? Int
    }
    
    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        let dictionary = NSMutableDictionary()
        if commentImagestails != nil{
            dictionary["CommentImagestails"] = commentImagestails.toDictionary()
        }
        if createAt != nil{
            dictionary["createAt"] = createAt
        }
        if id != nil{
            dictionary["id"] = id
        }
        if imageUrl != nil{
            dictionary["imageUrl"] = imageUrl
        }
        if objectId != nil{
            dictionary["objectId"] = objectId
        }
        if type != nil{
            dictionary["type"] = type
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        commentImagestails = aDecoder.decodeObject(forKey:"CommentImagestails") as? CommentImagestail
        createAt = aDecoder.decodeObject(forKey:"createAt") as? String
        id = aDecoder.decodeObject(forKey:"id") as? String
        imageUrl = aDecoder.decodeObject(forKey:"imageUrl") as? String
        objectId = aDecoder.decodeObject(forKey:"objectId") as? String
        type = aDecoder.decodeObject(forKey:"type") as? Int
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if commentImagestails != nil{
            aCoder.encode(commentImagestails, forKey: "CommentImagestails")
        }
        if createAt != nil{
            aCoder.encode(createAt, forKey: "createAt")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if imageUrl != nil{
            aCoder.encode(imageUrl, forKey: "imageUrl")
        }
        if objectId != nil{
            aCoder.encode(objectId, forKey: "objectId")
        }
        if type != nil{
            aCoder.encode(type, forKey: "type")
        }
        
    }
    
}

class CommentImagestail : NSObject, NSCoding{
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
