//
//  UIViewController+TalkingData.swift
//  LiangPiao
//
//  Created by Zhang on 26/11/2016.
//  Copyright © 2016 Zhang. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    
//    var talkingDataPageName:String = ""
    
    func getMethonFromeClass(_ cls:AnyClass?){
        print("methods \n");
        var methodNum : UInt32 = 0
        let methods = class_copyMethodList(cls, &methodNum)
        for index in 0..<numericCast(methodNum) {
            let met:Method = methods![index]!
            print("m_name:\(method_getName(met))");
            print("m_returnType:\(String(describing: method_copyReturnType(met)))")
            print("m_type:\(String(describing: method_getTypeEncoding(met)))")
        }
        print("properties \n")
        var proNum:UInt32 = 0
        let properties = class_copyPropertyList(cls, &proNum)
        for index in 0..<numericCast(proNum) {
            let pro:objc_property_t = properties![index]!
            print("p_name:\(String(describing: property_getName(pro)))")
            print("p_attributes:\(String(describing: property_getAttributes(pro)))")
        }
    }
    
    
    func setTalkingDataPageName(_ name:String,cls:AnyClass?) {
        self.getMethonFromeClass(cls)
//        TalkingData.trackPageBegin(name)
//        self.talKingDataPageName = cls.ge
        
    }
    
    class func ViewWillAdappter(){
        
    }
}
