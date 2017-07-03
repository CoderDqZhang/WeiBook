//
//  QRBookModel.swift
//  WeiBook
//
//  Created by Zhang on 2017/7/3.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit

class SBNBookModel : NSObject, NSCoding{
    
    var alt : String!
    var altTitle : String!
    var author : [String]!
    var authorIntro : String!
    var binding : String!
    var catalog : String!
    var id : String!
    var image : String!
    var images : Image!
    var isbn10 : String!
    var isbn13 : String!
    var originTitle : String!
    var pages : String!
    var price : String!
    var pubdate : String!
    var publisher : String!
    var rating : Rating!
    var subtitle : String!
    var summary : String!
    var tags : [Tag]!
    var title : String!
    var translator : [AnyObject]!
    var url : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        alt = dictionary["alt"] as? String
        altTitle = dictionary["alt_title"] as? String
        author = dictionary["author"] as? [String]
        authorIntro = dictionary["author_intro"] as? String
        binding = dictionary["binding"] as? String
        catalog = dictionary["catalog"] as? String
        id = dictionary["id"] as? String
        image = dictionary["image"] as? String
        if let imagesData = dictionary["images"] as? NSDictionary{
            images = Image(fromDictionary: imagesData)
        }
        isbn10 = dictionary["isbn10"] as? String
        isbn13 = dictionary["isbn13"] as? String
        originTitle = dictionary["origin_title"] as? String
        pages = dictionary["pages"] as? String
        price = dictionary["price"] as? String
        pubdate = dictionary["pubdate"] as? String
        publisher = dictionary["publisher"] as? String
        if let ratingData = dictionary["rating"] as? NSDictionary{
            rating = Rating(fromDictionary: ratingData)
        }
        subtitle = dictionary["subtitle"] as? String
        summary = dictionary["summary"] as? String
        tags = [Tag]()
        if let tagsArray = dictionary["tags"] as? [NSDictionary]{
            for dic in tagsArray{
                let value = Tag(fromDictionary: dic)
                tags.append(value)
            }
        }
        title = dictionary["title"] as? String
        translator = dictionary["translator"] as? [AnyObject]
        url = dictionary["url"] as? String
    }
    
    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        let dictionary = NSMutableDictionary()
        if alt != nil{
            dictionary["alt"] = alt
        }
        if altTitle != nil{
            dictionary["alt_title"] = altTitle
        }
        if author != nil{
            dictionary["author"] = author
        }
        if authorIntro != nil{
            dictionary["author_intro"] = authorIntro
        }
        if binding != nil{
            dictionary["binding"] = binding
        }
        if catalog != nil{
            dictionary["catalog"] = catalog
        }
        if id != nil{
            dictionary["id"] = id
        }
        if image != nil{
            dictionary["image"] = image
        }
        if images != nil{
            dictionary["images"] = images.toDictionary()
        }
        if isbn10 != nil{
            dictionary["isbn10"] = isbn10
        }
        if isbn13 != nil{
            dictionary["isbn13"] = isbn13
        }
        if originTitle != nil{
            dictionary["origin_title"] = originTitle
        }
        if pages != nil{
            dictionary["pages"] = pages
        }
        if price != nil{
            dictionary["price"] = price
        }
        if pubdate != nil{
            dictionary["pubdate"] = pubdate
        }
        if publisher != nil{
            dictionary["publisher"] = publisher
        }
        if rating != nil{
            dictionary["rating"] = rating.toDictionary()
        }
        if subtitle != nil{
            dictionary["subtitle"] = subtitle
        }
        if summary != nil{
            dictionary["summary"] = summary
        }
        if tags != nil{
            var dictionaryElements = [NSDictionary]()
            for tagsElement in tags {
                dictionaryElements.append(tagsElement.toDictionary())
            }
            dictionary["tags"] = dictionaryElements
        }
        if title != nil{
            dictionary["title"] = title
        }
        if translator != nil{
            dictionary["translator"] = translator
        }
        if url != nil{
            dictionary["url"] = url
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        alt = aDecoder.decodeObject(forKey: "alt") as? String
        altTitle = aDecoder.decodeObject(forKey: "alt_title") as? String
        author = aDecoder.decodeObject(forKey: "author") as? [String]
        authorIntro = aDecoder.decodeObject(forKey: "author_intro") as? String
        binding = aDecoder.decodeObject(forKey: "binding") as? String
        catalog = aDecoder.decodeObject(forKey: "catalog") as? String
        id = aDecoder.decodeObject(forKey: "id") as? String
        image = aDecoder.decodeObject(forKey: "image") as? String
        images = aDecoder.decodeObject(forKey: "images") as? Image
        isbn10 = aDecoder.decodeObject(forKey: "isbn10") as? String
        isbn13 = aDecoder.decodeObject(forKey: "isbn13") as? String
        originTitle = aDecoder.decodeObject(forKey: "origin_title") as? String
        pages = aDecoder.decodeObject(forKey: "pages") as? String
        price = aDecoder.decodeObject(forKey: "price") as? String
        pubdate = aDecoder.decodeObject(forKey: "pubdate") as? String
        publisher = aDecoder.decodeObject(forKey: "publisher") as? String
        rating = aDecoder.decodeObject(forKey: "rating") as? Rating
        subtitle = aDecoder.decodeObject(forKey: "subtitle") as? String
        summary = aDecoder.decodeObject(forKey: "summary") as? String
        tags = aDecoder.decodeObject(forKey: "tags") as? [Tag]
        title = aDecoder.decodeObject(forKey: "title") as? String
        translator = aDecoder.decodeObject(forKey: "translator") as? [AnyObject]
        url = aDecoder.decodeObject(forKey: "url") as? String
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if alt != nil{
            aCoder.encode(alt, forKey: "alt")
        }
        if altTitle != nil{
            aCoder.encode(altTitle, forKey: "alt_title")
        }
        if author != nil{
            aCoder.encode(author, forKey: "author")
        }
        if authorIntro != nil{
            aCoder.encode(authorIntro, forKey: "author_intro")
        }
        if binding != nil{
            aCoder.encode(binding, forKey: "binding")
        }
        if catalog != nil{
            aCoder.encode(catalog, forKey: "catalog")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if image != nil{
            aCoder.encode(image, forKey: "image")
        }
        if images != nil{
            aCoder.encode(images, forKey: "images")
        }
        if isbn10 != nil{
            aCoder.encode(isbn10, forKey: "isbn10")
        }
        if isbn13 != nil{
            aCoder.encode(isbn13, forKey: "isbn13")
        }
        if originTitle != nil{
            aCoder.encode(originTitle, forKey: "origin_title")
        }
        if pages != nil{
            aCoder.encode(pages, forKey: "pages")
        }
        if price != nil{
            aCoder.encode(price, forKey: "price")
        }
        if pubdate != nil{
            aCoder.encode(pubdate, forKey: "pubdate")
        }
        if publisher != nil{
            aCoder.encode(publisher, forKey: "publisher")
        }
        if rating != nil{
            aCoder.encode(rating, forKey: "rating")
        }
        if subtitle != nil{
            aCoder.encode(subtitle, forKey: "subtitle")
        }
        if summary != nil{
            aCoder.encode(summary, forKey: "summary")
        }
        if tags != nil{
            aCoder.encode(tags, forKey: "tags")
        }
        if title != nil{
            aCoder.encode(title, forKey: "title")
        }
        if translator != nil{
            aCoder.encode(translator, forKey: "translator")
        }
        if url != nil{
            aCoder.encode(url, forKey: "url")
        }
        
    }
    
}

class Tag : NSObject, NSCoding{
    
    var count : Int!
    var name : String!
    var title : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        count = dictionary["count"] as? Int
        name = dictionary["name"] as? String
        title = dictionary["title"] as? String
    }
    
    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        let dictionary = NSMutableDictionary()
        if count != nil{
            dictionary["count"] = count
        }
        if name != nil{
            dictionary["name"] = name
        }
        if title != nil{
            dictionary["title"] = title
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        count = aDecoder.decodeObject(forKey: "count") as? Int
        name = aDecoder.decodeObject(forKey: "name") as? String
        title = aDecoder.decodeObject(forKey: "title") as? String
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if count != nil{
            aCoder.encode(count, forKey: "count")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if title != nil{
            aCoder.encode(title, forKey: "title")
        }
        
    }
    
}

class Rating : NSObject, NSCoding{
    
    var average : String!
    var max : Int!
    var min : Int!
    var numRaters : Int!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        average = dictionary["average"] as? String
        max = dictionary["max"] as? Int
        min = dictionary["min"] as? Int
        numRaters = dictionary["numRaters"] as? Int
    }
    
    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        let dictionary = NSMutableDictionary()
        if average != nil{
            dictionary["average"] = average
        }
        if max != nil{
            dictionary["max"] = max
        }
        if min != nil{
            dictionary["min"] = min
        }
        if numRaters != nil{
            dictionary["numRaters"] = numRaters
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        average = aDecoder.decodeObject(forKey: "average") as? String
        max = aDecoder.decodeObject(forKey: "max") as? Int
        min = aDecoder.decodeObject(forKey: "min") as? Int
        numRaters = aDecoder.decodeObject(forKey: "numRaters") as? Int
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if average != nil{
            aCoder.encode(average, forKey: "average")
        }
        if max != nil{
            aCoder.encode(max, forKey: "max")
        }
        if min != nil{
            aCoder.encode(min, forKey: "min")
        }
        if numRaters != nil{
            aCoder.encode(numRaters, forKey: "numRaters")
        }
        
    }
    
}

class Image : NSObject, NSCoding{
    
    var large : String!
    var medium : String!
    var small : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        large = dictionary["large"] as? String
        medium = dictionary["medium"] as? String
        small = dictionary["small"] as? String
    }
    
    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        let dictionary = NSMutableDictionary()
        if large != nil{
            dictionary["large"] = large
        }
        if medium != nil{
            dictionary["medium"] = medium
        }
        if small != nil{
            dictionary["small"] = small
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        large = aDecoder.decodeObject(forKey: "large") as? String
        medium = aDecoder.decodeObject(forKey: "medium") as? String
        small = aDecoder.decodeObject(forKey: "small") as? String
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if large != nil{
            aCoder.encode(large, forKey: "large")
        }
        if medium != nil{
            aCoder.encode(medium, forKey: "medium")
        }
        if small != nil{
            aCoder.encode(small, forKey: "small")
        }
        
    }
    
}
