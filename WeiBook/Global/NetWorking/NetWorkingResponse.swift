//
//  NetWorkingResponse.swift
//  LiangPiao
//
//  Created by Zhang on 2017/6/1.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit

class NetWorkingResponse: NSObject {
    
    override init() {
        
    }

    static let  sharedInstance = NetWorkingResponse()
    func showNetWorkingResPonse(_ obj:AnyObject){
        print(obj)
    }
}
