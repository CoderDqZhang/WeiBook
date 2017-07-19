//
//  Define.swift
//  LiangPiao
//
//  Created by Zhang on 28/10/2016.
//  Copyright © 2016 Zhang. All rights reserved.
//

import Foundation
import UIKit
import SwifterSwift

let IPHONE_VERSION = UIDevice.current.systemVersion.floatValue
let IPHONE_VERSION_LAST9 = UIDevice.current.systemVersion.floatValue >= 9 ? 1:0
let IPHONE_VERSION_LAST10 = UIDevice.current.systemVersion.floatValue >= 10 ? 1:0


let IPHONE4 = SwifterSwift.screenHeight == 480 ? true:false
let IPHONE5 = SwifterSwift.screenHeight == 568 ? true:false
let IPHONE6 = SwifterSwift.screenWidth == 344 ? true:false
let IPHONE6P = SwifterSwift.screenWidth == 344 ? true:false

let SCREENWIDTH = SwifterSwift.screenWidth
let SCREENHEIGHT = SwifterSwift.screenHeight

let AnimationTime = 0.3

let TitleLineSpace:Float = 3.0

let BookLargerSize = CGSize.init(width: 102, height: 144)

let BookLargerMidSize = CGSize.init(width: 51, height: 72)

let BookLargerSmaSize = CGSize.init(width: 17, height: 24)


enum FollowAndFancsType {
    case Following
    case Followed
    case Follow
}

//搜索历史保存文件地址
let SearchHistoryDataPath = "SearchHistory.data"

let WeiXinPayStatues = "WeiXinPayStatuesChange"
let AliPayStatues = "AliPayStatuesChange"

let DidRegisterRemoteNotification = "DidRegisterRemoteNotification"
let DidRegisterRemoteURLNotification = "DidRegisterRemoteURLNotification"
let DidRegisterRemoteDiviceToken = "DidRegisterRemoteDiviceToken"


let QiniuAccessKey = "xX-kcCyk_b1TmufkALFCKVXP53cPMVrF_TgErxx7"
let QiniuSecretKey = "7xMrZ-kt2D-BJOmoPGulHF47I4yQyjBgAm2myFIw"
let QiniuBucket = "topveda"
let QiniuDomain = "http://cdn.topveda.cn"

let WeiXinAppID = "wx6c6b940e660449a2"
let QQAppID = "1105914312"
let QQAppKey = "13YjjEEnKWGQ5IJl"

let WeiboApiKey   =    "3220687526"
let WeiboApiSecret =   "97f3d51f3a1017cf54268accf9b83391"
let WeiboRedirectUrl = "http://sns.whalecloud.com/sina2/callback"

let JPushApiKey = "35d49a6e7dd7d1e678d1f7a6"

let GaoDeApiKey = "36cf817a65c10eff954c24c3a9edcb3d"


let ToolViewNotifacationName = "ToolsViewNotification"
let LoginStatuesChange = "LoginStatuesChange"

let OrderStatuesChange = "OrderStatusChange"

let UserTopUpWall = "UserTopUpWall"

let BlanceNumberChange = "BlanceNumberChange"

let SellTicketNumberChange = "SellTicketNumberChange"

let UserConfimNewOrder = "UserConfimNewOrder"

let TalkingDataKey = "AC559E27399F4ECEA0D9880E0C6977FB"

let ExpressDelivierKey = "a72a6d2f-019f-463f-8d20-a99bef74f1ce"
let ExpressDelivierEBusinessID = "1281351"

let deverliyDic:NSDictionary = ["顺丰":"SF","EMS":"EMS","圆通":"YTO","中通":"ZTO","申通":"STO","宅急送":"ZJS","韵达":"YD"]


func KWINDOWDS() -> UIWindow{
    let window = UIApplication.shared.keyWindow
    return window!
}

let SHARE_APPLICATION = UIApplication.shared


func AppCallViewShow(_ view:UIView, phone:String) {
    UIAlertController.shwoAlertControl(view.findViewController()!, style: .alert, title: nil, message: phone, titles: nil, cancel: "取消", doneTitle: "确定", cancelAction: {
        
        }, doneAction: {_ in 
           UIApplication.shared.openURL(URL.init(string: "tel:\(phone)")!)
    })
}

func UserDefaultsSetSynchronize(_ value:AnyObject,key:String) {
    UserDefaults.standard.set(value, forKey: key)
    UserDefaults.standard.synchronize()
}

func UserDefaultsGetSynchronize(_ key:String) -> AnyObject{
    if UserDefaults.standard.object(forKey: key) == nil {
        return "nil" as AnyObject
    }
    return UserDefaults.standard.object(forKey: key)! as AnyObject
}

func Storyboard(_ name:String,controllerid:String) -> UIViewController{
    return UIStoryboard.init(name: name, bundle: nil).instantiateViewController(withIdentifier: controllerid)
}

func Notification(_ name:String,value:String?) {
    NotificationCenter.default.post(name: Foundation.Notification.Name(rawValue: name), object: value)
}


func NavigationPushView(_ formviewController:UIViewController, toConroller:UIViewController) {
    toConroller.hidesBottomBarWhenPushed = true
    formviewController.navigationController?.pushViewController(toConroller, animated: true)
}

func NavigaiontPresentView(_ formViewController:UIViewController, toController:UIViewController) {
    formViewController.present(toController, animated: true) { 
        
    }
}

func MainThreadAlertShow(_ msg:String,view:UIView){
    DispatchQueue.main.async(execute: {
        _ = Tools.shareInstance.showMessage(view, msg: msg, autoHidder: true)
    })
}

func MainThreanShowErrorMessage(_ error:AnyObject){
    if error is NSDictionary {
        DispatchQueue.main.async(execute: {
            _ = Tools.shareInstance.showErrorMessage(error)
        })
    }
}

func MainThreanShowNetWorkError(_ error:AnyObject){
    DispatchQueue.main.async(execute: {
        _ = Tools.shareInstance.showNetWorkError(error)
    })
}

func GloableSetEvent(_ trackEvent:String, lable:String?, parameters:NSDictionary?) {
    if lable == nil {
        TalkingData.trackEvent(trackEvent)
    }else if parameters == nil {
        TalkingData.trackEvent(trackEvent, label: lable)
    }else{
        TalkingData.trackEvent(trackEvent, label: lable, parameters: parameters as! [AnyHashable: Any])
    }
}

func MainThreseanShowAliPayError(_ error:String) {
    var aliPayError = ""
    switch error {
    case "4000":
        aliPayError = "订单支付失败"
    case "5000":
        aliPayError = "重复请求"
    case "6001":
        aliPayError = "用户中途取消"
    case "6002":
        aliPayError = "网络连接出错"
    case "8000":
        aliPayError = "正在处理中"
    default:
        break
    }
    DispatchQueue.main.async(execute: {
        _ = Tools.shareInstance.showAliPathError(aliPayError)
    })
}



