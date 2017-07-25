//
//  IFyunManager.swift
//  WeiBook
//
//  Created by Zhang on 2017/7/24.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit 

class IFyunManager: NSObject {

    override init() {
        
    }
    static let shareInstance = IFyunManager()
    
    func setIFyunInstance(){
        IFlySpeechUtility.createUtility("appid=\(XFYunAPPKeyID)")
    }
}
