////
////  ShareTools.swift
////  LiangPiao
////
////  Created by Zhang on 23/12/2016.
////  Copyright © 2016 Zhang. All rights reserved.
////
//
//import UIKit
//
//class ShareTools: NSObject, TencentSessionDelegate, TencentLoginDelegate {
//    
//    var tencentOAuth:TencentOAuth!
//    
//    fileprivate override init() {
//        
//    }
//    
//    static let shareInstance = ShareTools()
//    
//    func shareWeChatSession(_ title:String, description:String, image:UIImage, url:String?){
//        let req = self.setUpSendMessageToWXReq(title, description: description, image: image, url: url, type: 0)
//        WXApi.send(req)
//    }
//    
//    func shareWeChatScreenShotImage(_ image:UIImage, type:Int32){
//        let message = WXMediaMessage.init()
//        let img = image.compressImage(image, maxLength: 32)
//        message.setThumbImage(UIImage.init(data:img!))
//        let imgObj = WXImageObject.init()
//        imgObj.imageData = UIImagePNGRepresentation(image)
//        message.mediaObject = imgObj
//        let req = SendMessageToWXReq.init()
//        req.bText = false
//        req.message = message
//        req.scene = type
//        WXApi.send(req)
//    }
//    
//    func shareWeChatTimeLine(_ title:String, description:String, image:UIImage, url:String?){
//        let req = self.setUpSendMessageToWXReq(title, description: description, image: image, url: url, type: 1)
//        WXApi.send(req)
//    }
//
//    
//    func setUpSendMessageToWXReq(_ title:String, description:String, image:UIImage, url:String?, type:Int32) ->SendMessageToWXReq {
//        let message = WXMediaMessage.init()
//        message.title = title
//        message.description = description
//        message.setThumbImage(image)
//        if url != nil {
//            let webPageObject = WXWebpageObject.init()
//            webPageObject.webpageUrl = url
//            message.mediaObject = webPageObject
//        }
//        let req = SendMessageToWXReq.init()
//        req.bText = false
//        req.message = message
//        req.scene = type
//        return req
//    }
//    
//    func shareWBScreenShotImag(_ image:UIImage,text:String) {
//        let authRequest = WBAuthorizeRequest.request() as! WBAuthorizeRequest
//        let message = WBMessageObject.init()
//        message.text = text
//        let imgObj = WBImageObject.init()
//        imgObj.imageData = UIImagePNGRepresentation(image)
//        message.imageObject = imgObj
//        let request = WBSendMessageToWeiboRequest.request(withMessage: message, authInfo: authRequest, access_token: nil) as! WBSendMessageToWeiboRequest
//        WeiboSDK.send(request)
//    }
//    
//    func shareWeiboWebUrl(_ text:String, webTitle:String, image:UIImage ,webDescription:String, webUrl:String){
//        let authRequest = WBAuthorizeRequest.request() as! WBAuthorizeRequest
//        authRequest.redirectURI = WeiboRedirectUrl
//        authRequest.scope = "all"
//        let message = WBMessageObject.init() 
//        message.text = text
//        let imgObj = WBImageObject.init()
//        imgObj.imageData = UIImagePNGRepresentation(image)
//        message.imageObject = imgObj
//        let request = WBSendMessageToWeiboRequest.request(withMessage: message, authInfo: authRequest, access_token: nil) as! WBSendMessageToWeiboRequest
//        WeiboSDK.send(request)
//    }
//    
//    func shareQQScreenShotImage(_ image:UIImage,type:Int){
//        self.tencentOAuth =  TencentOAuth.init(appId: QQAppID, andDelegate: nil)
//        
//        if type == 0 {
//            let imageData = UIImagePNGRepresentation(image)
//            let compress = image.compressImage(image, maxLength: 32)
//            let imgObj = QQApiImageObject.object(with: compress, previewImageData: imageData, title: "", description: "")
//            let req = SendMessageToQQReq.init(content: imgObj as! QQApiImageObject)
//            QQApiInterface.send(req)
//        }else{
//            let imageData = UIImagePNGRepresentation(image)
//            let imgObj = QQApiImageArrayForQZoneObject.init(imageArrayData: [imageData!], title: "")
//            let req = SendMessageToQQReq.init(content: imgObj!)
//            QQApiInterface.sendReq(toQZone: req)
//        }
//    }
//    
//    
//    func shareQQSessionWebUrl(_ text:String, webTitle:String, imageUrl:String,  webDescription:String, webUrl:String){
//        self.tencentOAuth =  TencentOAuth.init(appId: QQAppID, andDelegate: nil)
//        let newsObj = QQApiNewsObject.init(url: URL.init(string: webUrl), title: webTitle, description: webDescription, previewImageURL: URL.init(string: imageUrl), targetContentType: QQApiURLTargetType.init(3))
//        let req = SendMessageToQQReq.init(content: newsObj)
//        print(QQApiInterface.send(req))
//    }
//    
//    func shareQQTimeLineUrl(_ text:String, webTitle:String,imageUrl:String,   webDescription:String, webUrl:String){
//        let newsObj = QQApiNewsObject.init(url: URL.init(string: webUrl), title: webTitle, description: webDescription, previewImageURL: URL.init(string: imageUrl), targetContentType: QQApiURLTargetType.init(3))
//        let req = SendMessageToQQReq.init(content: newsObj)
//        print(QQApiInterface.sendReq(toQZone: req))
//    }
//    
//    //MARK: TencentSessionDelegate
//    func tencentDidLogout() {
//        
//    }
//    
//    func responseDidReceived(_ response: APIResponse!, forMessage message: String!) {
//        
//    }
//    
//    //MARK: TencentLoginDelegate
//    func tencentDidLogin() {
//        
//    }
//    
//    func tencentDidNotLogin(_ cancelled: Bool) {
//        
//    }
//    
//    func tencentDidNotNetWork() {
//        
//    }
//}
