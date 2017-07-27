//
//  ServerBookModel.swift
//  WeiBook
//
//  Created by Zhang on 2017/7/19.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit

class ServerBookModel : NSObject, NSCoding{
    
    var author : String!
    var bookImg : String!
    var bookTails : HomeBookTail!
    var bookUrl : AnyObject!
    var bookWeImg : AnyObject!
    var catalogDesc : String!
    var categoryId : AnyObject!
    var contentDesc : String!
    var createdAt : Int!
    var deletedAt : AnyObject!
    var descriptionField : String!
    var detailHref : String!
    var favoriteNum : AnyObject!
    var id : String!
    var isbn : String!
    var likeNum : AnyObject!
    var oress : String!
    var people : Int!
    var price : String!
    var publishDate : String!
    var rating : AnyObject!
    var state : AnyObject!
    var subjectId : AnyObject!
    var title : String!
    var updatedAt : Int!
    var inputNum : Int? = 0
    var userId : AnyObject!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        author = dictionary["author"] as? String
        bookImg = dictionary["bookImg"] as? String
        if let bookTailsData = dictionary["bookTails"] as? NSDictionary{
            bookTails = HomeBookTail(fromDictionary: bookTailsData)
        }
        bookUrl = dictionary["bookUrl"] as AnyObject
        bookWeImg = dictionary["bookWeImg"] as AnyObject
        catalogDesc = dictionary["catalogDesc"] as? String
        categoryId = dictionary["categoryId"] as AnyObject
        contentDesc = dictionary["contentDesc"] as? String
        createdAt = dictionary["createdAt"] as? Int
        deletedAt = dictionary["deletedAt"] as AnyObject
        descriptionField = dictionary["description"] as? String
        detailHref = dictionary["detailHref"] as? String
        favoriteNum = dictionary["favoriteNum"] as AnyObject
        id = dictionary["id"] as? String
        isbn = dictionary["isbn"] as? String
        likeNum = dictionary["likeNum"] as AnyObject
        oress = dictionary["oress"] as? String
        people = dictionary["people"] as? Int
        price = dictionary["price"] as? String
        publishDate = dictionary["publishDate"] as? String
        rating = dictionary["rating"] as AnyObject
        state = dictionary["state"] as AnyObject
        subjectId = dictionary["subjectId"] as AnyObject
        title = dictionary["title"] as? String
        updatedAt = dictionary["updatedAt"] as? Int
        inputNum = dictionary["inputNum"] as? Int
        userId = dictionary["userId"] as AnyObject
    }
    
    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        let dictionary = NSMutableDictionary()
        if author != nil{
            dictionary["author"] = author
        }
        if bookImg != nil{
            dictionary["bookImg"] = bookImg
        }
        if bookTails != nil{
            dictionary["bookTails"] = bookTails.toDictionary()
        }
        if bookUrl != nil{
            dictionary["bookUrl"] = bookUrl
        }
        if bookWeImg != nil{
            dictionary["bookWeImg"] = bookWeImg
        }
        if catalogDesc != nil{
            dictionary["catalogDesc"] = catalogDesc
        }
        if categoryId != nil{
            dictionary["categoryId"] = categoryId
        }
        if contentDesc != nil{
            dictionary["contentDesc"] = contentDesc
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
        if detailHref != nil{
            dictionary["detailHref"] = detailHref
        }
        if favoriteNum != nil{
            dictionary["favoriteNum"] = favoriteNum
        }
        if id != nil{
            dictionary["id"] = id
        }
        if isbn != nil{
            dictionary["isbn"] = isbn
        }
        if likeNum != nil{
            dictionary["likeNum"] = likeNum
        }
        if oress != nil{
            dictionary["oress"] = oress
        }
        if people != nil{
            dictionary["people"] = people
        }
        if price != nil{
            dictionary["price"] = price
        }
        if publishDate != nil{
            dictionary["publishDate"] = publishDate
        }
        if rating != nil{
            dictionary["rating"] = rating
        }
        if state != nil{
            dictionary["state"] = state
        }
        if subjectId != nil{
            dictionary["subjectId"] = subjectId
        }
        if title != nil{
            dictionary["title"] = title
        }
        if updatedAt != nil{
            dictionary["updatedAt"] = updatedAt
        }
        if inputNum != nil{
            dictionary["inputNum"] = inputNum
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
        author = aDecoder.decodeObject(forKey: "author") as? String
        bookImg = aDecoder.decodeObject(forKey: "bookImg") as? String
        bookTails = aDecoder.decodeObject(forKey: "tails") as? HomeBookTail
        bookUrl = aDecoder.decodeObject(forKey: "bookUrl") as AnyObject
        bookWeImg = aDecoder.decodeObject(forKey: "bookWeImg") as AnyObject
        catalogDesc = aDecoder.decodeObject(forKey: "catalogDesc") as? String
        categoryId = aDecoder.decodeObject(forKey: "categoryId") as AnyObject
        contentDesc = aDecoder.decodeObject(forKey: "contentDesc") as? String
        createdAt = aDecoder.decodeObject(forKey: "createdAt") as? Int
        deletedAt = aDecoder.decodeObject(forKey: "deletedAt") as AnyObject
        descriptionField = aDecoder.decodeObject(forKey: "description") as? String
        detailHref = aDecoder.decodeObject(forKey: "detailHref") as? String
        favoriteNum = aDecoder.decodeObject(forKey: "favoriteNum") as AnyObject
        id = aDecoder.decodeObject(forKey: "id") as? String
        isbn = aDecoder.decodeObject(forKey: "isbn") as? String
        likeNum = aDecoder.decodeObject(forKey: "likeNum") as AnyObject
        oress = aDecoder.decodeObject(forKey: "oress") as? String
        people = aDecoder.decodeObject(forKey: "people") as? Int
        price = aDecoder.decodeObject(forKey: "price") as? String
        publishDate = aDecoder.decodeObject(forKey: "publishDate") as? String
        rating = aDecoder.decodeObject(forKey: "rating") as AnyObject
        state = aDecoder.decodeObject(forKey: "state") as AnyObject
        subjectId = aDecoder.decodeObject(forKey: "subjectId") as AnyObject
        title = aDecoder.decodeObject(forKey: "title") as? String
        updatedAt = aDecoder.decodeObject(forKey: "updatedAt") as? Int
        inputNum = aDecoder.decodeObject(forKey: "inputNum") as? Int
        userId = aDecoder.decodeObject(forKey: "userId") as AnyObject
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if author != nil{
            aCoder.encode(author, forKey: "author")
        }
        if bookImg != nil{
            aCoder.encode(bookImg, forKey: "bookImg")
        }
        if bookTails != nil{
            aCoder.encode(bookTails, forKey: "tails")
        }
        if bookUrl != nil{
            aCoder.encode(bookUrl, forKey: "bookUrl")
        }
        if bookWeImg != nil{
            aCoder.encode(bookWeImg, forKey: "bookWeImg")
        }
        if catalogDesc != nil{
            aCoder.encode(catalogDesc, forKey: "catalogDesc")
        }
        if categoryId != nil{
            aCoder.encode(categoryId, forKey: "categoryId")
        }
        if contentDesc != nil{
            aCoder.encode(contentDesc, forKey: "contentDesc")
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
        if detailHref != nil{
            aCoder.encode(detailHref, forKey: "detailHref")
        }
        if favoriteNum != nil{
            aCoder.encode(favoriteNum, forKey: "favoriteNum")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if isbn != nil{
            aCoder.encode(isbn, forKey: "isbn")
        }
        if likeNum != nil{
            aCoder.encode(likeNum, forKey: "likeNum")
        }
        if oress != nil{
            aCoder.encode(oress, forKey: "oress")
        }
        if people != nil{
            aCoder.encode(people, forKey: "people")
        }
        if price != nil{
            aCoder.encode(price, forKey: "price")
        }
        if publishDate != nil{
            aCoder.encode(publishDate, forKey: "publishDate")
        }
        if rating != nil{
            aCoder.encode(rating, forKey: "rating")
        }
        if state != nil{
            aCoder.encode(state, forKey: "state")
        }
        if subjectId != nil{
            aCoder.encode(subjectId, forKey: "subjectId")
        }
        if title != nil{
            aCoder.encode(title, forKey: "title")
        }
        if updatedAt != nil{
            aCoder.encode(updatedAt, forKey: "updatedAt")
        }
        if inputNum != nil{
            aCoder.encode(updatedAt, forKey: "inputNum")
        }
        if userId != nil{
            aCoder.encode(userId, forKey: "userId")
        }
        
    }
    
}

class HomeBookTail : NSObject, NSCoding{
    
    var authorDesc : String!
    var dangPrice : String!
    var fetchFrom : String!
    var indexVersion : Int!
    var subTitle : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        authorDesc = dictionary["authorDesc"] as? String
        dangPrice = dictionary["dangPrice"] as? String
        fetchFrom = dictionary["fetchFrom"] as? String
        indexVersion = dictionary["indexVersion"] as? Int
        subTitle = dictionary["subTitle"] as? String
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
        
    }
    
}
