//
//  String+Size.swift
//  Meet
//
//  Created by Zhang on 6/16/16.
//  Copyright © 2016 Meet. All rights reserved.
//

import Foundation
import UIKit


//enum CryptoAlgorithm {
//    case MD5, SHA1, SHA224, SHA256, SHA384, SHA512
//    
//    var HMACAlgorithm: CCHmacAlgorithm {
//        var result: Int = 0
//        switch self {
//        case .MD5:      result = kCCHmacAlgMD5
//        case .SHA1:     result = kCCHmacAlgSHA1
//        case .SHA224:   result = kCCHmacAlgSHA224
//        case .SHA256:   result = kCCHmacAlgSHA256
//        case .SHA384:   result = kCCHmacAlgSHA384
//        case .SHA512:   result = kCCHmacAlgSHA512
//        }
//        return CCHmacAlgorithm(result)
//    }
//    
//    var digestLength: Int {
//        var result: Int32 = 0
//        switch self {
//        case .MD5:      result = CC_MD5_DIGEST_LENGTH
//        case .SHA1:     result = CC_SHA1_DIGEST_LENGTH
//        case .SHA224:   result = CC_SHA224_DIGEST_LENGTH
//        case .SHA256:   result = CC_SHA256_DIGEST_LENGTH
//        case .SHA384:   result = CC_SHA384_DIGEST_LENGTH
//        case .SHA512:   result = CC_SHA512_DIGEST_LENGTH
//        }
//        return Int(result)
//    }
//}

extension String{
    
    //MARK:获得string内容高度
     var length: Int { return self.characters.count }
    
    func heightWithConstrainedWidth(_ textStr:String,font:UIFont,width:CGFloat) -> CGFloat {
        let normalText: NSString = textStr as NSString
        let size = CGSize(width: width,height: 1000)
        let dic = NSDictionary(object: font, forKey: NSFontAttributeName as NSCopying)
        let stringSize = normalText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic as? [String : AnyObject], context:nil).size
        return stringSize.height
    }
    
    func widthWithConstrainedHeight(_ textStr:String,font:UIFont,height:CGFloat) -> CGFloat {
        let normalText: NSString = textStr as NSString
        let size = CGSize(width: 1000, height: height)
        let dic = NSDictionary(object: font, forKey: NSFontAttributeName as NSCopying)
        let stringSize = normalText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic as? [String : AnyObject], context:nil).size
        return stringSize.width
    }
    
    var floatValue: Float {
        return (self as NSString).floatValue
    }
    
    func addEncoding(_ st : String ) ->String? {
        if #available(iOS 8.0, OSX 10.9, *) {
            return st.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        }
        else {
            return  st.addingPercentEscapes(using: String.Encoding.utf8)
        }
    }
    
    func phoneType(_ st: String) -> String {
        let temp = NSMutableString.init(string: st)
        if temp.length == 11 {
            temp.insert("-", at: 3)
            temp.insert("-", at: 8)
        }else{
            temp.insert("-", at: 3)
            temp.insert("-", at: 7)
        }
        return temp as String
    }
    
    func muchType(_ str:String) -> String {
        let doubleStr = Double("\((str))")
        var str = ""
        if doubleStr!.truncatingRemainder(dividingBy: 10) == 0 {
            str = "\(doubleStr! / 100)0"
        }else{
            str = "\(doubleStr! / 100)"
        }
        return str
    }
    
    func md5() ->String!{
        let str = self.cString(using: String.Encoding.utf8)
        let strLen = CUnsignedInt(self.lengthOfBytes(using: String.Encoding.utf8))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen)
        CC_MD5(str!, strLen, result)
        let hash = NSMutableString()
        for i in 0 ..< digestLen {
            hash.appendFormat("%02x", result[i])
        }
        result.deinitialize()
        return String(format: hash as String)
    }
    
    func toBase64() -> String? {
        guard let data = self.data(using: String.Encoding.utf8) else {
            return nil
        }
        
        return data.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
    }
    
    func dataTojsonString(_ object:AnyObject) -> String{
        var str = ""
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: object, options: JSONSerialization.WritingOptions.prettyPrinted)
             str = String.init(data: jsonData, encoding: String.Encoding.utf8)!
        } catch {
            
        }
        return str
    }
    
    func substringWithRange(_ start: Int, end: Int) -> String
    {
        if (start < 0 || start > self.characters.count)
        {
            print("start index \(start) out of bounds")
            return ""
        }
        else if end < 0 || end > self.characters.count
        {
            print("end index \(end) out of bounds")
            return ""
        }
        let range = (self.characters.index(self.startIndex, offsetBy: start) ..< self.characters.index(self.startIndex, offsetBy: end))
        return self.substring(with: range)
    }
    
    func substringWithRange(_ start: Int, location: Int) -> String
    {
        if (start < 0 || start > self.characters.count)
        {
            print("start index \(start) out of bounds")
            return ""
        }
        else if location < 0 || start + location > self.characters.count
        {
            print("end index \(start + location) out of bounds")
            return ""
        }
        let range = (self.characters.index(self.startIndex, offsetBy: start) ..< self.characters.index(self.startIndex, offsetBy: start + location))
        return self.substring(with: range)
    }
    
//    var sha1: String! {
//        let str = self.cStringUsingEncoding(NSUTF8StringEncoding)
//        let strLen = CC_LONG(self.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
//        let digestLen = Int(CC_SHA1_DIGEST_LENGTH)
//        let result = UnsafeMutablePointer<CUnsignedChar>.alloc(digestLen)
//        CC_SHA1(str!, strLen, result)
//        return stringFromBytes(result, length: digestLen)
//    }
//    
//    var sha256String: String! {
//        let str = self.cStringUsingEncoding(NSUTF8StringEncoding)
//        let strLen = CC_LONG(self.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
//        let digestLen = Int(CC_SHA256_DIGEST_LENGTH)
//        let result = UnsafeMutablePointer<CUnsignedChar>.alloc(digestLen)
//        CC_SHA256(str!, strLen, result)
//        return stringFromBytes(result, length: digestLen)
//    }
//    
//    var sha512String: String! {
//        let str = self.cStringUsingEncoding(NSUTF8StringEncoding)
//        let strLen = CC_LONG(self.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
//        let digestLen = Int(CC_SHA512_DIGEST_LENGTH)
//        let result = UnsafeMutablePointer<CUnsignedChar>.alloc(digestLen)
//        CC_SHA512(str!, strLen, result)
//        return stringFromBytes(result, length: digestLen)
//    }
//    
//    func stringFromBytes(bytes: UnsafeMutablePointer<CUnsignedChar>, length: Int) -> String{
//        let hash = NSMutableString()
//        for i in 0..<length {
//            hash.appendFormat("%02x", bytes[i])
//        }
//        bytes.dealloc(length)
//        return String(format: hash as String)
//    }
//    
//    func hmac(algorithm: CryptoAlgorithm, key: String) -> String {
//        let str = self.cStringUsingEncoding(NSUTF8StringEncoding)
//        let strLen = Int(self.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
//        let digestLen = algorithm.digestLength
//        let result = UnsafeMutablePointer<CUnsignedChar>.alloc(digestLen)
//        let keyStr = key.cStringUsingEncoding(NSUTF8StringEncoding)
//        let keyLen = Int(key.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
//        
//        CCHmac(algorithm.HMACAlgorithm, keyStr!, keyLen, str!, strLen, result)
//        
//        let digest = stringFromResult(result, length: digestLen)
//        
//        result.dealloc(digestLen)
//        
//        return digest
//    }
//    
//    private func stringFromResult(result: UnsafeMutablePointer<CUnsignedChar>, length: Int) -> String {
//        let hash = NSMutableString()
//        for i in 0..<length {
//            hash.appendFormat("%02x", result[i])
//        }
//        return String(hash)
//    }
    
}//extension end

