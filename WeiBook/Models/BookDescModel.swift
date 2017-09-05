//
//  BookDescModel.swift
//  WeiBook
//
//  Created by Zhang on 27/07/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class BookDescModel: NSObject, NSCoding {
    var book : ServerBookModel!
    var collectionList : [CollectionList]!
    var isExitCollection : Int!
    var isExitWishBook : Int!
    var isFavorite : Int!
    var users : [UserInfoSwiftModel]!
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        if let bookData = dictionary["book"] as? NSDictionary{
            book = ServerBookModel(fromDictionary: bookData)
        }
        collectionList = [CollectionList]()
        if let collectionListArray = dictionary["collectionList"] as? [NSDictionary]{
            for dic in collectionListArray{
                let value = CollectionList(fromDictionary: dic)
                collectionList.append(value)
            }
        }
        isExitCollection = dictionary["isExitCollection"] as? Int
        isExitWishBook = dictionary["isExitWishBook"] as? Int
        isFavorite = dictionary["isFavorite"] as? Int
        users = [UserInfoSwiftModel]()
        if let usersArray = dictionary["users"] as? [NSDictionary]{
            for dic in usersArray{
                let value = UserInfoSwiftModel(fromDictionary: dic)
                users.append(value)
            }
        }
    }
    
    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        let dictionary = NSMutableDictionary()
        if book != nil{
            dictionary["book"] = book.toDictionary()
        }
        if collectionList != nil{
            var dictionaryElements = [NSDictionary]()
            for collectionListElement in collectionList {
                dictionaryElements.append(collectionListElement.toDictionary())
            }
            dictionary["collectionList"] = dictionaryElements
        }
        if isExitCollection != nil{
            dictionary["isExitCollection"] = isExitCollection
        }
        if isExitWishBook != nil{
            dictionary["isExitWishBook"] = isExitWishBook
        }
        if users != nil{
            var dictionaryElements = [NSDictionary]()
            for usersElement in users {
                dictionaryElements.append(usersElement.toDictionary())
            }
            dictionary["users"] = dictionaryElements
        }
        if isFavorite != nil{
            dictionary["isFavorite"] = isFavorite
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        book = aDecoder.decodeObject(forKey: "book") as? ServerBookModel
        collectionList = aDecoder.decodeObject(forKey: "collectionList") as? [CollectionList]
        isExitCollection = aDecoder.decodeObject(forKey: "isExitCollection") as? Int
        isExitWishBook = aDecoder.decodeObject(forKey: "isExitWishBook") as? Int
        isFavorite = aDecoder.decodeObject(forKey: "isFavorite") as? Int
        users = aDecoder.decodeObject(forKey: "users") as? [UserInfoSwiftModel]
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if book != nil{
            aCoder.encode(book, forKey: "book")
        }
        if collectionList != nil{
            aCoder.encode(collectionList, forKey: "collectionList")
        }
        if isExitCollection != nil{
            aCoder.encode(isExitCollection, forKey: "isExitCollection")
        }
        if isExitWishBook != nil{
            aCoder.encode(isExitWishBook, forKey: "isExitWishBook")
        }
        if isFavorite != nil{
            aCoder.encode(isFavorite, forKey: "isFavorite")
        }
        if users != nil{
            aCoder.encode(users, forKey: "users")
        }
    }
}

class CollectionList : NSObject, NSCoding{
    
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
    var tails : CollectionTail!
    var top : AnyObject!
    var type : AnyObject!
    var updatedAt : AnyObject!
    var userId : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
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
        if let tailsData = dictionary["tails"] as? NSDictionary{
            tails = CollectionTail(fromDictionary: tailsData)
        }
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
        if tails != nil{
            dictionary["tails"] = tails.toDictionary()
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
        tails = aDecoder.decodeObject(forKey: "tails") as? CollectionTail
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
        if tails != nil{
            aCoder.encode(tails, forKey: "tails")
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

class CollectionTail : NSObject, NSCoding{
    
    var collId : String!
    var indexVersion : Int!
    var user : UserInfoModel!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        collId = dictionary["collId"] as? String
        indexVersion = dictionary["indexVersion"] as? Int
        if let userData = dictionary["user"] as? NSDictionary{
            user = UserInfoModel.init(dictionary: userData as! [AnyHashable : Any])
        }
    }
    
    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        let dictionary = NSMutableDictionary()
        if collId != nil{
            dictionary["collId"] = collId
        }
        if indexVersion != nil{
            dictionary["indexVersion"] = indexVersion
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
        collId = aDecoder.decodeObject(forKey: "collId") as? String
        indexVersion = aDecoder.decodeObject(forKey: "indexVersion") as? Int
        user = aDecoder.decodeObject(forKey: "user") as? UserInfoModel
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if collId != nil{
            aCoder.encode(collId, forKey: "collId")
        }
        if indexVersion != nil{
            aCoder.encode(indexVersion, forKey: "indexVersion")
        }
        if user != nil{
            aCoder.encode(user, forKey: "user")
        }
        
    }
    
}
