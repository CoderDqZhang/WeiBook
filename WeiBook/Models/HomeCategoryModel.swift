
//
//  HomeCategoryModel.swift
//  WeiBook
//
//  Created by Zhang on 10/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class HomeCategoryModel : NSObject, NSCoding{
    
    var createBy : String!
    var createDate : Int!
    var delFlag : String!
    var descriptionField : String!
    var id : String!
    var label : String!
    var parentId : String!
    var remarks : String!
    var sort : Int!
    var tails : HomeCatgorTail!
    var type : String!
    var updateBy : String!
    var updateDate : Int!
    var value : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        createBy = dictionary["createBy"] as? String
        createDate = dictionary["createDate"] as? Int
        delFlag = dictionary["delFlag"] as? String
        descriptionField = dictionary["description"] as? String
        id = dictionary["id"] as? String
        label = dictionary["label"] as? String
        parentId = dictionary["parentId"] as? String
        remarks = dictionary["remarks"] as? String
        sort = dictionary["sort"] as? Int
        if let tailsData = dictionary["tails"] as? NSDictionary{
            tails = HomeCatgorTail(fromDictionary: tailsData)
        }
        type = dictionary["type"] as? String
        updateBy = dictionary["updateBy"] as? String
        updateDate = dictionary["updateDate"] as? Int
        value = dictionary["value"] as? String
    }
    
    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        let dictionary = NSMutableDictionary()
        if createBy != nil{
            dictionary["createBy"] = createBy
        }
        if createDate != nil{
            dictionary["createDate"] = createDate
        }
        if delFlag != nil{
            dictionary["delFlag"] = delFlag
        }
        if descriptionField != nil{
            dictionary["description"] = descriptionField
        }
        if id != nil{
            dictionary["id"] = id
        }
        if label != nil{
            dictionary["label"] = label
        }
        if parentId != nil{
            dictionary["parentId"] = parentId
        }
        if remarks != nil{
            dictionary["remarks"] = remarks
        }
        if sort != nil{
            dictionary["sort"] = sort
        }
        if tails != nil{
            dictionary["tails"] = tails.toDictionary()
        }
        if type != nil{
            dictionary["type"] = type
        }
        if updateBy != nil{
            dictionary["updateBy"] = updateBy
        }
        if updateDate != nil{
            dictionary["updateDate"] = updateDate
        }
        if value != nil{
            dictionary["value"] = value
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        createBy = aDecoder.decodeObject(forKey: "createBy") as? String
        createDate = aDecoder.decodeObject(forKey: "createDate") as? Int
        delFlag = aDecoder.decodeObject(forKey: "delFlag") as? String
        descriptionField = aDecoder.decodeObject(forKey: "description") as? String
        id = aDecoder.decodeObject(forKey: "id") as? String
        label = aDecoder.decodeObject(forKey: "label") as? String
        parentId = aDecoder.decodeObject(forKey: "parentId") as? String
        remarks = aDecoder.decodeObject(forKey: "remarks") as? String
        sort = aDecoder.decodeObject(forKey: "sort") as? Int
        tails = aDecoder.decodeObject(forKey: "tails") as? HomeCatgorTail
        type = aDecoder.decodeObject(forKey: "type") as? String
        updateBy = aDecoder.decodeObject(forKey: "updateBy") as? String
        updateDate = aDecoder.decodeObject(forKey: "updateDate") as? Int
        value = aDecoder.decodeObject(forKey: "value") as? String
        
    }
    
    /**
     * NSCoding required method.
     * encodeObjects mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if createBy != nil{
            aCoder.encode(createBy, forKey: "createBy")
        }
        if createDate != nil{
            aCoder.encode(createDate, forKey: "createDate")
        }
        if delFlag != nil{
            aCoder.encode(delFlag, forKey: "delFlag")
        }
        if descriptionField != nil{
            aCoder.encode(descriptionField, forKey: "description")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if label != nil{
            aCoder.encode(label, forKey: "label")
        }
        if parentId != nil{
            aCoder.encode(parentId, forKey: "parentId")
        }
        if remarks != nil{
            aCoder.encode(remarks, forKey: "remarks")
        }
        if sort != nil{
            aCoder.encode(sort, forKey: "sort")
        }
        if tails != nil{
            aCoder.encode(tails, forKey: "tails")
        }
        if type != nil{
            aCoder.encode(type, forKey: "type")
        }
        if updateBy != nil{
            aCoder.encode(updateBy, forKey: "updateBy")
        }
        if updateDate != nil{
            aCoder.encode(updateDate, forKey: "updateDate")
        }
        if value != nil{
            aCoder.encode(value, forKey: "value")
        }
        
    }
    
}

class HomeCatgorTail : NSObject, NSCoding{
    
    var categories : [CategoryModel]!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        categories = [CategoryModel]()
        if let categoriesArray = dictionary["categories"] as? [NSDictionary]{
            for dic in categoriesArray{
                let value = CategoryModel(fromDictionary: dic)
                categories.append(value)
            }
        }
    }
    
    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        let dictionary = NSMutableDictionary()
        if categories != nil{
            var dictionaryElements = [NSDictionary]()
            for categoriesElement in categories {
                dictionaryElements.append(categoriesElement.toDictionary())
            }
            dictionary["categories"] = dictionaryElements
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        categories = aDecoder.decodeObject(forKey: "categories") as? [CategoryModel]
        
    }
    
    /**
     * NSCoding required method.
     * encodeObjects mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if categories != nil{
            aCoder.encode(categories, forKey: "categories")
        }
        
    }
    
}
