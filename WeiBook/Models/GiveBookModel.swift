//
//  GiveBookModel.swift
//  WeiBook
//
//  Created by Zhang on 01/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class GiveBookModel : NSObject, NSCoding{
    
    var acceptTime : Int!
    var bookId : String!
    var createdAt : Int!
    var giveEnd : Int!
    var giveStart : Int!
    var id : String!
    var isAccept : Int!
    var state : Int!
    var useUserId : String!
    var userId : String!
    var tails : BorrowAndGivetail!
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        acceptTime = dictionary["acceptTime"] as? Int
        bookId = dictionary["bookId"] as? String
        createdAt = dictionary["createdAt"] as? Int
        giveEnd = dictionary["giveEnd"] as? Int
        giveStart = dictionary["giveStart"] as? Int
        id = dictionary["id"] as? String
        isAccept = dictionary["isAccept"] as? Int
        state = dictionary["state"] as? Int
        useUserId = dictionary["useUserId"] as? String
        userId = dictionary["userId"] as? String
        if let tailsData = dictionary["tails"] as? NSDictionary{
            tails = BorrowAndGivetail(fromDictionary: tailsData)
        }
    }
    
    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        var dictionary = NSMutableDictionary()
        if acceptTime != nil{
            dictionary["acceptTime"] = acceptTime
        }
        if bookId != nil{
            dictionary["bookId"] = bookId
        }
        if createdAt != nil{
            dictionary["createdAt"] = createdAt
        }
        if giveEnd != nil{
            dictionary["giveEnd"] = giveEnd
        }
        if giveStart != nil{
            dictionary["giveStart"] = giveStart
        }
        if id != nil{
            dictionary["id"] = id
        }
        if isAccept != nil{
            dictionary["isAccept"] = isAccept
        }
        if state != nil{
            dictionary["state"] = state
        }
        if useUserId != nil{
            dictionary["useUserId"] = useUserId
        }
        if userId != nil{
            dictionary["userId"] = userId
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
        acceptTime = aDecoder.decodeObject(forKey: "acceptTime") as? Int
        bookId = aDecoder.decodeObject(forKey: "bookId") as? String
        createdAt = aDecoder.decodeObject(forKey: "createdAt") as? Int
        giveEnd = aDecoder.decodeObject(forKey: "giveEnd") as? Int
        giveStart = aDecoder.decodeObject(forKey: "giveStart") as? Int
        id = aDecoder.decodeObject(forKey: "id") as? String
        isAccept = aDecoder.decodeObject(forKey: "isAccept") as? Int
        state = aDecoder.decodeObject(forKey: "state") as? Int
        useUserId = aDecoder.decodeObject(forKey: "useUserId") as? String
        userId = aDecoder.decodeObject(forKey: "userId") as? String
        tails = aDecoder.decodeObject(forKey: "tails") as? BorrowAndGivetail
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if acceptTime != nil{
            aCoder.encode(acceptTime, forKey: "acceptTime")
        }
        if bookId != nil{
            aCoder.encode(bookId, forKey: "bookId")
        }
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "createdAt")
        }
        if giveEnd != nil{
            aCoder.encode(giveEnd, forKey: "giveEnd")
        }
        if giveStart != nil{
            aCoder.encode(giveStart, forKey: "giveStart")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if isAccept != nil{
            aCoder.encode(isAccept, forKey: "isAccept")
        }
        if state != nil{
            aCoder.encode(state, forKey: "state")
        }
        if useUserId != nil{
            aCoder.encode(useUserId, forKey: "useUserId")
        }
        if userId != nil{
            aCoder.encode(userId, forKey: "userId")
        }
        
    }
    
}
