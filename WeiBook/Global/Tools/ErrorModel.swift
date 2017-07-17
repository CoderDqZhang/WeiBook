//
//	ErrorModel.swift
//
//	Create by Zhang on 24/11/2016
//	Copyright © 2016. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class ErrorModel : NSObject, NSCoding{
    
    var error : String!
    var exception : String!
    var message : String!
    var path : String!
    var status : Int!
    var timestamp : Int!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        error = dictionary["error"] as? String
        exception = dictionary["exception"] as? String
        message = dictionary["message"] as? String
        path = dictionary["path"] as? String
        status = dictionary["status"] as? Int
        timestamp = dictionary["timestamp"] as? Int
    }
    
    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        let dictionary = NSMutableDictionary()
        if error != nil{
            dictionary["error"] = error
        }
        if exception != nil{
            dictionary["exception"] = exception
        }
        if message != nil{
            dictionary["message"] = message
        }
        if path != nil{
            dictionary["path"] = path
        }
        if status != nil{
            dictionary["status"] = status
        }
        if timestamp != nil{
            dictionary["timestamp"] = timestamp
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        error = aDecoder.decodeObject(forKey: "error") as? String
        exception = aDecoder.decodeObject(forKey: "exception") as? String
        message = aDecoder.decodeObject(forKey: "message") as? String
        path = aDecoder.decodeObject(forKey: "path") as? String
        status = aDecoder.decodeObject(forKey: "status") as? Int
        timestamp = aDecoder.decodeObject(forKey: "timestamp") as? Int
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if error != nil{
            aCoder.encode(error, forKey: "error")
        }
        if exception != nil{
            aCoder.encode(exception, forKey: "exception")
        }
        if message != nil{
            aCoder.encode(message, forKey: "message")
        }
        if path != nil{
            aCoder.encode(path, forKey: "path")
        }
        if status != nil{
            aCoder.encode(status, forKey: "status")
        }
        if timestamp != nil{
            aCoder.encode(timestamp, forKey: "timestamp")
        }
        
    }
    
}
