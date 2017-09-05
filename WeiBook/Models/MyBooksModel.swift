//
//  MyBooksModel.swift
//  WeiBook
//
//  Created by Zhang on 2017/7/21.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit

class MyBooksModel : NSObject, NSCoding{
    
    var books : [Book]!
    var isExitWishBook : Int!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        books = [Book]()
        if let booksArray = dictionary["books"] as? [NSDictionary]{
            for dic in booksArray{
                let value = Book(fromDictionary: dic)
                books.append(value)
            }
        }
        isExitWishBook = dictionary["isExitWishBook"] as? Int
    }
    
    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        let dictionary = NSMutableDictionary()
        if books != nil{
            var dictionaryElements = [NSDictionary]()
            for booksElement in books {
                dictionaryElements.append(booksElement.toDictionary())
            }
            dictionary["books"] = dictionaryElements
        }
        if isExitWishBook != nil{
            dictionary["isExitWishBook"] = isExitWishBook
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        books = aDecoder.decodeObject(forKey: "books") as? [Book]
        isExitWishBook = aDecoder.decodeObject(forKey: "isExitWishBook") as? Int
        
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
        if isExitWishBook != nil{
            aCoder.encode(isExitWishBook, forKey: "isExitWishBook")
        }
        
    }
    
}


class Book: NSObject, NSCoding{
    
    var bookId : String!
    var createdAt : Int!
    var id : String!
    var state : String!
    var tails : MyBookListTail!
    var userId : String!
    var borrowState : Int!

    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        bookId = dictionary["bookId"] as? String
        createdAt = dictionary["createdAt"] as? Int
        borrowState = dictionary["borrowState"] as? Int
        id = dictionary["id"] as? String
        state = dictionary["state"] as? String
        if let tailsData = dictionary["tails"] as? NSDictionary{
            tails = MyBookListTail(fromDictionary: tailsData)
        }
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
        if createdAt != nil{
            dictionary["createdAt"] = createdAt
        }
        if borrowState != nil{
            dictionary["borrowState"] = borrowState
        }
        if id != nil{
            dictionary["id"] = id
        }
        if state != nil{
            dictionary["state"] = state
        }
        if tails != nil{
            dictionary["tails"] = tails.toDictionary()
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
        createdAt = aDecoder.decodeObject(forKey: "createdAt") as? Int
        id = aDecoder.decodeObject(forKey: "id") as? String
        borrowState = aDecoder.decodeObject(forKey: "borrowState") as? Int
        state = aDecoder.decodeObject(forKey: "state") as? String
        tails = aDecoder.decodeObject(forKey: "tails") as? MyBookListTail
        userId = aDecoder.decodeObject(forKey: "userId") as? String
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder){
        if bookId != nil{
            aCoder.encode(bookId, forKey: "bookId")
        }
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "createdAt")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if borrowState != nil{
            aCoder.encode(borrowState, forKey: "borrowState")
        }
        if state != nil{
            aCoder.encode(state, forKey: "state")
        }
        if tails != nil{
            aCoder.encode(tails, forKey: "tails")
        }
        if userId != nil{
            aCoder.encode(userId, forKey: "userId")
        }
        
    }
    
}

class MyBookListTail : NSObject, NSCoding{
    
    var authorDesc : String!
    var dangPrice : String!
    var fetchFrom : String!
    var indexVersion : Int!
    var subTitle : String!
    var bookInfo : ServerBookModel!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        authorDesc = dictionary["authorDesc"] as? String
        dangPrice = dictionary["dangPrice"] as? String
        fetchFrom = dictionary["fetchFrom"] as? String
        indexVersion = dictionary["indexVersion"] as? Int
        subTitle = dictionary["subTitle"] as? String
        if let bookInfoData = dictionary["bookInfo"] as? NSDictionary{
            bookInfo = ServerBookModel(fromDictionary: bookInfoData)
        }
    }
    
    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        let dictionary = NSMutableDictionary()
        if authorDesc != nil{
            dictionary["authorDesc"] = authorDesc
        }
        if dangPrice != nil{
            dictionary["dangPrice"] = dangPrice
        }
        if fetchFrom != nil{
            dictionary["fetchFrom"] = fetchFrom
        }
        if indexVersion != nil{
            dictionary["indexVersion"] = indexVersion
        }
        if subTitle != nil{
            dictionary["subTitle"] = subTitle
        }
        if bookInfo != nil{
            dictionary["bookInfo"] = bookInfo.toDictionary()
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        authorDesc = aDecoder.decodeObject(forKey: "authorDesc") as? String
        dangPrice = aDecoder.decodeObject(forKey: "dangPrice") as? String
        fetchFrom = aDecoder.decodeObject(forKey: "fetchFrom") as? String
        indexVersion = aDecoder.decodeObject(forKey: "indexVersion") as? Int
        subTitle = aDecoder.decodeObject(forKey: "subTitle") as? String
        bookInfo = aDecoder.decodeObject(forKey: "bookInfo") as? ServerBookModel
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if authorDesc != nil{
            aCoder.encode(authorDesc, forKey: "authorDesc")
        }
        if dangPrice != nil{
            aCoder.encode(dangPrice, forKey: "dangPrice")
        }
        if fetchFrom != nil{
            aCoder.encode(fetchFrom, forKey: "fetchFrom")
        }
        if indexVersion != nil{
            aCoder.encode(indexVersion, forKey: "indexVersion")
        }
        if subTitle != nil{
            aCoder.encode(subTitle, forKey: "subTitle")
        }
        if bookInfo != nil{
            aCoder.encode(bookInfo, forKey: "bookInfo")
        }
        
    }
    
}
