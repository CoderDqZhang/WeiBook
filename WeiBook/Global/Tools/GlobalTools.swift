//
//  GlobalTools.swift
//  LiangPiao
//
//  Created by Zhang on 03/11/2016.
//  Copyright © 2016 Zhang. All rights reserved.
//

import UIKit

class GlobalTools: NSObject {

}

public extension UIDevice {
    
    var modelName: String {
//        var systemInfo = utsname()
//        uname(&systemInfo)
//        let machineMirror = Mirror(reflecting: systemInfo.machine)
//        let identifier = machineMirror.children.reduce("") { identifier, element in
//            guard let value = (element.value as? Int8) value != 0 else { return identifier }
//            return identifier + String(UnicodeScalar(UInt8(value)))
//        }
//        
//        switch identifier {
//        case "iPod5,1":                                 return "iPod Touch 5"
//        case "iPod7,1":                                 return "iPod Touch 6"
//        case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return "iPhone 4"
//        case "iPhone4,1":                               return "iPhone 4s"
//        case "iPhone5,1", "iPhone5,2":                  return "iPhone 5"
//        case "iPhone5,3", "iPhone5,4":                  return "iPhone 5c"
//        case "iPhone6,1", "iPhone6,2":                  return "iPhone 5s"
//        case "iPhone7,2":                               return "iPhone 6"
//        case "iPhone7,1":                               return "iPhone 6 Plus"
//        case "iPhone8,1":                               return "iPhone 6s"
//        case "iPhone8,2":                               return "iPhone 6s Plus"
//        case "iPhone9,1":                               return "iPhone 7 (CDMA)"
//        case "iPhone9,3":                               return "iPhone 7 (GSM)"
//        case "iPhone9,2":                               return "iPhone 7 Plus (CDMA)"
//        case "iPhone9,4":                               return "iPhone 7 Plus (GSM)"
//            
//        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad 2"
//        case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad 3"
//        case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad 4"
//        case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad Air"
//        case "iPad5,3", "iPad5,4":                      return "iPad Air 2"
//        case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad Mini"
//        case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad Mini 2"
//        case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad Mini 3"
//        case "iPad5,1", "iPad5,2":                      return "iPad Mini 4"
//        case "iPad6,7", "iPad6,8":                      return "iPad Pro"
//        case "AppleTV5,3":                              return "Apple TV"
//        case "i386", "x86_64":                          return "Simulator"
//        default:                                        return identifier
//        }
        return ""
    }
    
}

let kEncodedObjectPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last! as NSString
let kEncodeUserCachesDirectory = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first! as String

class SaveImageTools{
    
    fileprivate init(){}
    
    static let sharedInstance = SaveImageTools()
    
    func getCachesDirectoryUserInfoDocumetPathDocument(_ user:String, document:String) ->String? {
        let manager = FileManager.default
        let path = (kEncodeUserCachesDirectory + "/\(user)") + "/\(document)"
        if !manager.fileExists(atPath: path) {
            do {
                try manager.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
                return path
            } catch {
                print("创建失败")
                return nil
            }
        }else{
            return path
        }
    }
    
    func getCachesDirectoryUserInfoSmallDocumetPathDocument(_ user:String, document:String) ->String? {
        let manager = FileManager.default
        let path = (kEncodeUserCachesDirectory + "/\(user)") + "/\(document)"  + "/Small/"
        if !manager.fileExists(atPath: path) {
            do {
                try manager.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
                return path
            } catch {
                print("创建失败")
                return nil
            }
        }else{
            return path
        }
    }
    
    
    func saveImage(_ name:String, image:UIImage, path:String) -> Bool {
        if UserInfoModel.isLoggedIn() {
            let saveFilePath = self.getCachesDirectoryUserInfoDocumetPathDocument(UserInfoModel.shareInstance().mobile, document: path)
            if saveFilePath == nil {
                return false
            }
            let saveName = saveFilePath?.appendingFormat("/\(name)")
            let imageData = UIImagePNGRepresentation(image)
            _ = self.saveSmallImage(name, image: image, path: path)
            do {
                try imageData?.write(to: URL.init(fileURLWithPath: saveName!), options: .atomic)
                return true
            } catch  {
                return false
            }
        }else{
            let saveFilePath = self.getCachesDirectoryUserInfoDocumetPathDocument("Public", document: path)
            if saveFilePath == nil {
                return false
            }
            let saveName = (saveFilePath)! + "/\(name)"
            let imageData = UIImagePNGRepresentation(image)
            _ = self.saveSmallImage(name, image: image, path: path)
            return ((try? imageData?.write(to: URL(fileURLWithPath: saveName), options: [.atomic])) != nil)
        }
    }
    
    func saveSmallImage(_ name:String, image:UIImage, path:String) -> Bool {
        if UserInfoModel.isLoggedIn() {
            let saveFilePath = self.getCachesDirectoryUserInfoSmallDocumetPathDocument(UserInfoModel.shareInstance().mobile, document: path)
            if saveFilePath == nil {
                return false
            }
            let saveName = saveFilePath?.appendingFormat("\(name)")
            let imageData = UIImageJPEGRepresentation(image, 0.2)
            do {
                try imageData?.write(to: URL.init(fileURLWithPath: saveName!), options: .atomic)
                return true
            } catch  {
                return false
            }
        }else{
            let saveFilePath = self.getCachesDirectoryUserInfoDocumetPathDocument("Public", document: path)
            if saveFilePath == nil {
                return false
            }
            let saveName = (saveFilePath)! + "/\(name)"
            let imageData = UIImageJPEGRepresentation(image, 0.2)
            return ((try? imageData?.write(to: URL(fileURLWithPath: saveName), options: [.atomic])) != nil)
        }
    }
    
    func LoadImage(_ name:String, path:String, isSmall:Bool) -> UIImage? {
        if UserInfoModel.isLoggedIn() {
            let saveFilePath = isSmall ? self.getCachesDirectoryUserInfoSmallDocumetPathDocument(UserInfoModel.shareInstance().mobile, document: path) : self.getCachesDirectoryUserInfoDocumetPathDocument(UserInfoModel.shareInstance().mobile, document: path)
            if saveFilePath == nil {
                return nil
            }
            let saveName = saveFilePath?.appendingFormat("/\(name)")
            do {
                let data = try Data.init(contentsOf: URL.init(fileURLWithPath: saveName!), options: Data.ReadingOptions.dataReadingMapped)
                return UIImage.init(data: data)
            } catch  {
                return nil
            }
        }else{
            let saveFilePath = self.getCachesDirectoryUserInfoDocumetPathDocument("Public", document: path)
            if saveFilePath == nil {
                return nil
            }
            let saveName = (saveFilePath)! + "/\(name)"
            let data = try? Data.init(contentsOf: URL(fileURLWithPath: saveName))
            if data == nil {
                return nil
            }
            return UIImage.init(data: data!)
        }
    }
    
    func getCachesDirectory(_ name:String, path:String, isSmall:Bool) -> String {
        if UserInfoModel.isLoggedIn() {
            let saveFilePath = isSmall ? self.getCachesDirectoryUserInfoSmallDocumetPathDocument(UserInfoModel.shareInstance().mobile, document: path) : self.getCachesDirectoryUserInfoDocumetPathDocument(UserInfoModel.shareInstance().mobile, document: path)
            if saveFilePath == nil {
                return ""
            }
            let saveName = saveFilePath?.appendingFormat("/\(name)")
            return saveName!
        }else{
            let saveFilePath = self.getCachesDirectoryUserInfoDocumetPathDocument("Public", document: path)
            if saveFilePath == nil {
                return ""
            }
            let saveName = (saveFilePath)! + "/\(name)"
            return saveName
        }
    }
}
