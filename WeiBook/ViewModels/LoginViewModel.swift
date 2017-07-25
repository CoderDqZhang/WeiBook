//
//  LoginViewModel.swift
//  WeiBook
//
//  Created by Zhang on 2017/6/29.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit
import MJExtension
import SDWebImage

class LoginForm: NSObject {
    var phone:String = ""
    var code:String = ""
}

class LoginViewModel: BaseViewModel {
    
    override init() {
        
    }
    
    func requestLoginCode(_ number:String, controller:LoginViewController){
        let dic = ["mobile":number]
        let url = "\(BaseUrl)\(LoginCode)"
        BaseNetWorke.sharedInstance.getUrlWithString(url, parameters: dic as AnyObject).observe { (resultDic) in
            if !resultDic.isCompleted {
                let aMinutes:TimeInterval = 60
                controller.startWithStartDate(NSDate() as Date, finishDate: NSDate.init(timeIntervalSinceNow: aMinutes) as Date)
            }
        }
    }
    
    func requestLogin(_ form:LoginForm,controller:LoginViewController) {
        let dic = ["mobile":form.phone, "password":form.code]
        let url = "\(BaseUrl)\(LoginPasswrodUrl)"
        BaseNetWorke.sharedInstance.postUrlWithString(url, parameters: dic as AnyObject).observe { (resultDic) in
            if !resultDic.isCompleted {
                let userInfo = UserInfoModel.init(dictionary: resultDic.value as! [AnyHashable : Any])
                userInfo?.tails.saveOrUpdate()
                userInfo?.tails.userInfo.saveOrUpdate()
                userInfo?.saveOrUpdate()
                UserInfoModel.toUserInstance(userInfo)
                Notification(LoginStatuesChange, value: nil)
                controller.navigationController?.popViewController(animated: true)
                
            }
        }
    }
    
    func savePhotoImage(){
        if UserInfoModel.shareInstance().tails.userInfo.photo != "" {
            SDWebImageManager.shared().loadImage(with: URL.init(string: UserInfoModel.shareInstance().tails.userInfo.photo), options: .retryFailed, progress: { (star, end, url) in
                
            }) { (image, data, error, cache, finish, url) in
                if error == nil {
                    _ = SaveImageTools.sharedInstance.saveImage("photoImage.png", image: image!, path: "headerImage")
                }
            }
        }
    }
    
    func requestAddress(){
        BaseNetWorke.sharedInstance.getUrlWithString(AddAddress, parameters: nil).observe { (resultDic) in
//            if !resultDic.isCompleted {
//                let resultModels =  NSMutableArray.mj_objectArray(withKeyValuesArray: resultDic.value)
//                var addressModels:[AddressModel] = []
//                for model in resultModels! {
//                    addressModels.append(AddressModel.init(fromDictionary: model as! NSDictionary))
//                }
//                AddressModel.archiveRootObject(addressModels)
//            }
        }
    }
}
