//
//  BookListDescModel.swift
//  WeiBook
//
//  Created by Zhang on 08/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class BookListDescModel : NSObject, NSCoding{
    
    var bookListDesctails : BookListDesctail!
    var attentionNum : Int!
    var bookNum : Int!
    var categoryId : String!
    var commentNum : Int!
    var createdAt : Int!
    var deletedAt : AnyObject!
    var descriptionField : String!
    var favoriteNum : Int!
    var id : String!
    var imageUrl : String!
    var isDelete : Int!
    var likeNum : Int!
    var listName : String!
    var sort : AnyObject!
    var state : Int!
    var top : AnyObject!
    var type : AnyObject!
    var updatedAt : AnyObject!
    var userId : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        if let bookListDesctailsData = dictionary["tails"] as? NSDictionary{
            bookListDesctails = BookListDesctail(fromDictionary: bookListDesctailsData)
        }
        attentionNum = dictionary["attentionNum"] as? Int
        bookNum = dictionary["bookNum"] as? Int
        categoryId = dictionary["categoryId"] as? String
        commentNum = dictionary["commentNum"] as? Int
        createdAt = dictionary["createdAt"] as? Int
        deletedAt = dictionary["deletedAt"] as AnyObject
        descriptionField = dictionary["description"] as? String
        favoriteNum = dictionary["favoriteNum"] as? Int
        id = dictionary["id"] as? String
        imageUrl = dictionary["imageUrl"] as? String
        isDelete = dictionary["isDelete"] as? Int
        likeNum = dictionary["likeNum"] as? Int
        listName = dictionary["listName"] as? String
        sort = dictionary["sort"] as AnyObject
        state = dictionary["state"] as? Int
        top = dictionary["top"] as AnyObject
        type = dictionary["type"] as AnyObject
        updatedAt = dictionary["updatedAt"] as AnyObject
        userId = dictionary["userId"] as? String
    }
    
    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        let dictionary = NSMutableDictionary()
        if bookListDesctails != nil{
            dictionary["tails"] = bookListDesctails.toDictionary()
        }
        if attentionNum != nil{
            dictionary["attentionNum"] = attentionNum
        }
        if bookNum != nil{
            dictionary["bookNum"] = bookNum
        }
        if categoryId != nil{
            dictionary["categoryId"] = categoryId
        }
        if commentNum != nil{
            dictionary["commentNum"] = commentNum
        }
        if createdAt != nil{
            dictionary["createdAt"] = createdAt
        }
        if deletedAt != nil{
            dictionary["deletedAt"] = deletedAt
        }
        if descriptionField != nil{
            dictionary["description"] = descriptionField
        }
        if favoriteNum != nil{
            dictionary["favoriteNum"] = favoriteNum
        }
        if id != nil{
            dictionary["id"] = id
        }
        if imageUrl != nil{
            dictionary["imageUrl"] = imageUrl
        }
        if isDelete != nil{
            dictionary["isDelete"] = isDelete
        }
        if likeNum != nil{
            dictionary["likeNum"] = likeNum
        }
        if listName != nil{
            dictionary["listName"] = listName
        }
        if sort != nil{
            dictionary["sort"] = sort
        }
        if state != nil{
            dictionary["state"] = state
        }
        if top != nil{
            dictionary["top"] = top
        }
        if type != nil{
            dictionary["type"] = type
        }
        if updatedAt != nil{
            dictionary["updatedAt"] = updatedAt
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
        bookListDesctails = aDecoder.decodeObject(forKey: "tails") as? BookListDesctail
        attentionNum = aDecoder.decodeObject(forKey: "attentionNum") as? Int
        bookNum = aDecoder.decodeObject(forKey: "bookNum") as? Int
        categoryId = aDecoder.decodeObject(forKey: "categoryId") as? String
        commentNum = aDecoder.decodeObject(forKey: "commentNum") as? Int
        createdAt = aDecoder.decodeObject(forKey: "createdAt") as? Int
        deletedAt = aDecoder.decodeObject(forKey: "deletedAt") as AnyObject
        descriptionField = aDecoder.decodeObject(forKey: "description") as? String
        favoriteNum = aDecoder.decodeObject(forKey: "favoriteNum") as? Int
        id = aDecoder.decodeObject(forKey: "id") as? String
        imageUrl = aDecoder.decodeObject(forKey: "imageUrl") as? String
        isDelete = aDecoder.decodeObject(forKey: "isDelete") as? Int
        likeNum = aDecoder.decodeObject(forKey: "likeNum") as? Int
        listName = aDecoder.decodeObject(forKey: "listName") as? String
        sort = aDecoder.decodeObject(forKey: "sort") as AnyObject
        state = aDecoder.decodeObject(forKey: "state") as? Int
        top = aDecoder.decodeObject(forKey: "top") as AnyObject
        type = aDecoder.decodeObject(forKey: "type") as AnyObject
        updatedAt = aDecoder.decodeObject(forKey: "updatedAt") as AnyObject
        userId = aDecoder.decodeObject(forKey: "userId") as? String
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if bookListDesctails != nil{
            aCoder.encode(bookListDesctails, forKey: "BookListDesctails")
        }
        if attentionNum != nil{
            aCoder.encode(attentionNum, forKey: "attentionNum")
        }
        if bookNum != nil{
            aCoder.encode(bookNum, forKey: "bookNum")
        }
        if categoryId != nil{
            aCoder.encode(categoryId, forKey: "categoryId")
        }
        if commentNum != nil{
            aCoder.encode(commentNum, forKey: "commentNum")
        }
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "createdAt")
        }
        if deletedAt != nil{
            aCoder.encode(deletedAt, forKey: "deletedAt")
        }
        if descriptionField != nil{
            aCoder.encode(descriptionField, forKey: "description")
        }
        if favoriteNum != nil{
            aCoder.encode(favoriteNum, forKey: "favoriteNum")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if imageUrl != nil{
            aCoder.encode(imageUrl, forKey: "imageUrl")
        }
        if isDelete != nil{
            aCoder.encode(isDelete, forKey: "isDelete")
        }
        if likeNum != nil{
            aCoder.encode(likeNum, forKey: "likeNum")
        }
        if listName != nil{
            aCoder.encode(listName, forKey: "listName")
        }
        if sort != nil{
            aCoder.encode(sort, forKey: "sort")
        }
        if state != nil{
            aCoder.encode(state, forKey: "state")
        }
        if top != nil{
            aCoder.encode(top, forKey: "top")
        }
        if type != nil{
            aCoder.encode(type, forKey: "type")
        }
        if updatedAt != nil{
            aCoder.encode(updatedAt, forKey: "updatedAt")
        }
        if userId != nil{
            aCoder.encode(userId, forKey: "userId")
        }
        
    }
    
}

class BookListDesctail : NSObject, NSCoding{
    
    var books : [ServerBookModel]!
    var cdrIds : [CdrId]!
    var indexVersion : Int!
    var isAttention : Bool!
    var isFavorite : Bool!
    var isLike : Bool!
    var user : UserInfoSwiftModel!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        books = [ServerBookModel]()
        if let booksArray = dictionary["books"] as? [NSDictionary]{
            for dic in booksArray{
                let value = ServerBookModel(fromDictionary: dic)
                books.append(value)
            }
        }
        cdrIds = [CdrId]()
        if let cdrIdsArray = dictionary["cdrIds"] as? [NSDictionary]{
            for dic in cdrIdsArray{
                let value = CdrId(fromDictionary: dic)
                cdrIds.append(value)
            }
        }
        indexVersion = dictionary["indexVersion"] as? Int
        isAttention = dictionary["isAttention"] as? Bool
        isFavorite = dictionary["isFavorite"] as? Bool
        isLike = dictionary["isLike"] as? Bool
        if let userData = dictionary["user"] as? NSDictionary{
            user = UserInfoSwiftModel(fromDictionary: userData)
        }
    }
    
    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        var dictionary = NSMutableDictionary()
        if books != nil{
            var dictionaryElements = [NSDictionary]()
            for booksElement in books {
                dictionaryElements.append(booksElement.toDictionary())
            }
            dictionary["books"] = dictionaryElements
        }
        if cdrIds != nil{
            var dictionaryElements = [NSDictionary]()
            for cdrIdsElement in cdrIds {
                dictionaryElements.append(cdrIdsElement.toDictionary())
            }
            dictionary["cdrIds"] = dictionaryElements
        }
        if indexVersion != nil{
            dictionary["indexVersion"] = indexVersion
        }
        if isAttention != nil{
            dictionary["isAttention"] = isAttention
        }
        if isFavorite != nil{
            dictionary["isFavorite"] = isFavorite
        }
        if isLike != nil{
            dictionary["isLike"] = isLike
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
        books = aDecoder.decodeObject(forKey: "books") as? [ServerBookModel]
        cdrIds = aDecoder.decodeObject(forKey: "cdrIds") as? [CdrId]
        indexVersion = aDecoder.decodeObject(forKey: "indexVersion") as? Int
        isAttention = aDecoder.decodeObject(forKey: "isAttention") as? Bool
        isFavorite = aDecoder.decodeObject(forKey: "isFavorite") as? Bool
        isLike = aDecoder.decodeObject(forKey: "isLike") as? Bool
        user = aDecoder.decodeObject(forKey: "user") as? UserInfoSwiftModel
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if books != nil{
            aCoder.encode(books, forKey: "books")
        }
        if cdrIds != nil{
            aCoder.encode(cdrIds, forKey: "cdrIds")
        }
        if indexVersion != nil{
            aCoder.encode(indexVersion, forKey: "indexVersion")
        }
        if isAttention != nil{
            aCoder.encode(isAttention, forKey: "isAttention")
        }
        if isFavorite != nil{
            aCoder.encode(isFavorite, forKey: "isFavorite")
        }
        if isLike != nil{
            aCoder.encode(isLike, forKey: "isLike")
        }
        if user != nil{
            aCoder.encode(user, forKey: "user")
        }
        
    }
    
}

class CdrId : NSObject, NSCoding{
    
    var collectionId : String!
    var dictionaryId : String!
    var id : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        collectionId = dictionary["collectionId"] as? String
        dictionaryId = dictionary["dictionaryId"] as? String
        id = dictionary["id"] as? String
        
    }
    
    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        var dictionary = NSMutableDictionary()
        if collectionId != nil{
            dictionary["collectionId"] = collectionId
        }
        if dictionaryId != nil{
            dictionary["dictionaryId"] = dictionaryId
        }
        if id != nil{
            dictionary["id"] = id
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        collectionId = aDecoder.decodeObject(forKey: "collectionId") as? String
        dictionaryId = aDecoder.decodeObject(forKey: "dictionaryId") as? String
        id = aDecoder.decodeObject(forKey: "id") as? String
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if collectionId != nil{
            aCoder.encode(collectionId, forKey: "collectionId")
        }
        if dictionaryId != nil{
            aCoder.encode(dictionaryId, forKey: "dictionaryId")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
    }
}
