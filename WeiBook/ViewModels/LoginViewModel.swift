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
        let dic = ["phone":number]
        BaseNetWorke.sharedInstance.postUrlWithString(LoginCode, parameters: dic as AnyObject).observe { (resultDic) in
            if !resultDic.isCompleted {
                let aMinutes:TimeInterval = 60
                controller.startWithStartDate(NSDate() as Date, finishDate: NSDate.init(timeIntervalSinceNow: aMinutes) as Date)
            }
        }
    }
    
    func requestLogin(_ form:LoginForm,controller:LoginViewController) {
        let dic = ["mobile_num":form.phone, "code":form.code]
        BaseNetWorke.sharedInstance.postUrlWithString(LoginUrl, parameters: dic as AnyObject).observe { (resultDic) in
            if !resultDic.isCompleted {
//                let model = UserInfoModel.mj_object(withKeyValues: resultDic.value)
//                model?.phone = form.phone
//                UserInfoModel.shareInstance().avatar = model?.avatar
//                UserInfoModel.shareInstance().username = model?.username
//                UserInfoModel.shareInstance().id = model?.id
//                UserInfoModel.shareInstance().gender = (model?.gender)!
//                UserInfoModel.shareInstance().phone = model?.phone
//                UserInfoModel.shareInstance().role = model?.role
//                model?.saveOrUpdate()
//                self.savePhotoImage()
//                Notification(LoginStatuesChange, value: nil)
//                controller.navigationController?.popViewController(animated: true)
                
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
