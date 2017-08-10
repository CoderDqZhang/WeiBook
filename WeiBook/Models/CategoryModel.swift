//
//  CategoryModel.swift
//  WeiBook
//
//  Created by Zhang on 09/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class CategoryModel : NSObject, NSCoding{
    
    var dictName : String!
    var dictType : String!
    var dictValue : String!
    var id : String!
    var pid : String!
    var state : Int!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        dictName = dictionary["dictName"] as? String
        dictType = dictionary["dictType"] as? String
        dictValue = dictionary["dictValue"] as? String
        id = dictionary["id"] as? String
        pid = dictionary["pid"] as? String
        state = dictionary["state"] as? Int
    }
    
    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        var dictionary = NSMutableDictionary()
        if dictName != nil{
            dictionary["dictName"] = dictName
        }
        if dictType != nil{
            dictionary["dictType"] = dictType
        }
        if dictValue != nil{
            dictionary["dictValue"] = dictValue
        }
        if id != nil{
            dictionary["id"] = id
        }
        if pid != nil{
            dictionary["pid"] = pid
        }
        if state != nil{
            dictionary["state"] = state
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        dictName = aDecoder.decodeObject(forKey: "dictName") as? String
        dictType = aDecoder.decodeObject(forKey:"dictType") as? String
        dictValue = aDecoder.decodeObject(forKey:"dictValue") as? String
        id = aDecoder.decodeObject(forKey:"id") as? String
        pid = aDecoder.decodeObject(forKey:"pid") as? String
        state = aDecoder.decodeObject(forKey:"state") as? Int
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if dictName != nil{
            aCoder.encode(dictName, forKey: "dictName")
        }
        if dictType != nil{
            aCoder.encode(dictType, forKey: "dictType")
        }
        if dictValue != nil{
            aCoder.encode(dictValue, forKey: "dictValue")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if pid != nil{
            aCoder.encode(pid, forKey: "pid")
        }
        if state != nil{
            aCoder.encode(state, forKey: "state")
        }
    }
    
}
