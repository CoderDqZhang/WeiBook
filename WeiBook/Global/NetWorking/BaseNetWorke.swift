//
//  BaseNetWorke.swift
//  LiangPiao
//
//  Created by Zhang on 28/10/2016.
//  Copyright © 2016 Zhang. All rights reserved.
//

import UIKit
import Alamofire
import Result
import ReactiveSwift
import MBProgressHUD

typealias SuccessClouse = (_ responseObject:AnyObject) -> Void
typealias FailureClouse = (_ responseError:AnyObject) -> Void

enum HttpRequestType {
    case post
    case get
    case delete
    case put
}

class BaseNetWorke {
    fileprivate init() {
    
    }
    
    static let sharedInstance = BaseNetWorke()
    //加一个特使标识，首页请求失败
    /// getRequest
    /// - parameter url:        输入URL
    /// - parameter parameters: 参数
    ///
    /// - returns: 一个信号

    func getUrlWithString(_ url:String, parameters:AnyObject?) -> Signal<Any, NSError> {
        return Signal.init({ (subscriber) -> Disposable? in
            self.httpRequest(.get, url: url, parameters: parameters, success: { (responseObject) in
                subscriber.send(value: responseObject)
                subscriber.sendCompleted()
            }, failure: { (responseError) in
                if responseError is NSDictionary {
                    MainThreanShowErrorMessage(responseError)
                }else{
                    MainThreanShowNetWorkError(responseError)
                    if url == "http://api.niceticket.cc/show/hot/"{
                        subscriber.send(value: ["error":"似乎已断开与互联网的连接"])
                    }else{
                        subscriber.sendCompleted()
//                        subscriber.send(error: responseError as! NSError)
                    }
                }
                subscriber.sendCompleted()
            })
            return nil
        })
    }
    /// postRequest
    /// - parameter url:        输入URL
    /// - parameter parameters: 参数
    ///
    /// - returns: 一个信号
    func postUrlWithString(_ url:String, parameters:AnyObject?) -> Signal<Any, NSError> {
        return Signal.init({ (subscriber) -> Disposable? in
            self.httpRequest(.post, url: url, parameters: parameters, success: { (responseObject) in
                subscriber.send(value: responseObject)
                subscriber.sendCompleted()
                }, failure: { (responseError) in
                    if responseError is NSDictionary {
                        MainThreanShowErrorMessage(responseError)
                    }else{
                        print(responseError)
                        MainThreanShowNetWorkError(responseError)
//                        subscriber.send(error: responseError as! NSError)
                    }
                subscriber.sendCompleted()
            })
            return nil
        })
        
    }
    
    /// Putrequest
    /// - parameter url:        输入URL
    /// - parameter parameters: 参数
    ///
    /// - returns: 一个信号
    func putUrlWithString(_ url:String, parameters:AnyObject?) -> Signal<Any, NSError> {
        return Signal.init({ (subscriber) -> Disposable? in
            self.httpRequest(.put, url: url, parameters: parameters, success: { (responseObject) in
                subscriber.send(value: responseObject)
                subscriber.sendCompleted()
                }, failure: { (responseError) in
                    if responseError is NSDictionary {
                        MainThreanShowErrorMessage(responseError)
                    }else{
                        MainThreanShowNetWorkError(responseError)
//                        subscriber.send(error: responseError as! NSError)
                    }
                subscriber.sendCompleted()
            })
            return nil
        })
    }
    
    /// 删除request
    ///
    /// - parameter url:        输入URL
    /// - parameter parameters: 参数
    ///
    /// - returns: 一个信号
    func deleteUrlWithString(_ url:String, parameters:AnyObject?) -> Signal<Any, NSError> {
        return Signal.init({ (subscriber) -> Disposable? in
            self.httpRequest(.delete, url: url, parameters: parameters, success: { (responseObject) in
                subscriber.send(value: responseObject)
                subscriber.sendCompleted()
                }, failure: { (responseError) in
                    if responseError is NSDictionary {
                        MainThreanShowErrorMessage(responseError)
                    }else{
                        MainThreanShowNetWorkError(responseError)
//                        subscriber.send(error: responseError as! NSError)
                    }
                subscriber.sendCompleted()
            })
            return nil
        })
    }
    
    func uploadDevilyPushFile(_ url:String, paratemates:NSDictionary) ->Signal<Any, NSError> {
        var allKey = paratemates.allKeys
        var allValue = paratemates.allValues
        return Signal.init({ (subscriber) -> Disposable? in
            Alamofire.upload(multipartFormData: { (multipartFormData) in
                for i in 0...allKey.count - 1 {
                    multipartFormData.append(URL.init(fileURLWithPath: allValue[i] as! String), withName: allKey[i] as! String)
                }
            }, usingThreshold: 1, to: url, method: .post, headers: [
                "content-type": "multipart/form-data",
                "cache-control": "no-cache"
            ]) { (encodingResult) in
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.responseJSON { response in
                        if response.response?.statusCode == 200 || response.response?.statusCode == 201 {
                            subscriber.send(value: response.result.value!)
                        }else{
                            subscriber.send(value: ["fail":"error"])
                        }
                        //                            debugPrint(response)
                        subscriber.sendCompleted()
                    }
                case .failure(let encodingError):
                    subscriber.send(value: ["fail":"服务器请求失败"])
                    print(encodingError)
                    subscriber.sendCompleted()
                }
                subscriber.sendCompleted()
            }
            return nil
        })
    
        // Alamofire 4
        
        //        Alamofire.upload(multipartFormData: <#T##(MultipartFormData) -> Void#>, usingThreshold: <#T##UInt64#>, to: <#T##URLConvertible#>, method: <#T##HTTPMethod#>, headers: <#T##HTTPHeaders?#>, encodingCompletion: { (SessionManager,.MultipartFormDataEncodingResult) in
        //            <#code#>
        //        })
    }
    
    
    func uploadDataFile(_ url:String, parameters:NSDictionary?, images:NSDictionary?, hud:MBProgressHUD?) ->Signal<Any, NSError> {
        return Signal.init({ (subscriber) -> Disposable? in
            
            Alamofire.upload(multipartFormData: { (multipartFormData) in
                if parameters != nil {
                    for i in 0...(parameters!).allValues.count - 1 {
                        multipartFormData.append((parameters!.allValues[i] as! String).data(using: String.Encoding.utf8, allowLossyConversion: true)!, withName: parameters!.allKeys[i] as! String)
                    }
                }
                
                if images != nil {
                    for j in 0...(images!).allValues.count - 1 {
                        multipartFormData.append(URL.init(fileURLWithPath: images!.allValues[j]  as! String), withName: images!.allKeys[j] as! String)
                    }
                }
                
            }, usingThreshold: 1, to: url, method: .post, headers: [
                "content-type": "multipart/form-data",
                "cache-control": "no-cache"
            ]) { (encodingResult) in
                print(encodingResult)
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.responseString(completionHandler: { (response) in
                        if response.response?.statusCode == 200 || response.response?.statusCode == 201 {
                            let value = self.jsonStringToDic(response.result.value!)
                            subscriber.send(value: value)
//                            subscriber.send(value: self.jsonStringToDic(response.result.value!))
                        }else{
                            _ = Tools.shareInstance.showMessage(KWINDOWDS(), msg: "上传失败", autoHidder: true)
                        }
                        if hud != nil {
                            Tools.shareInstance.hiddenLoading(hud: hud!)
                        }
                        //                            debugPrint(response)
//                        subscriber.sendCompleted()
                    })
//                    upload.responseJSON { response in
//                        if response.response?.statusCode == 200 || response.response?.statusCode == 201 {
//                            subscriber.send(value: response.result.value!)
//                        }else{
//                            _ = Tools.shareInstance.showMessage(KWINDOWDS(), msg: "上传失败", autoHidder: true)
//                        }
//                        //                            debugPrint(response)
//                        subscriber.sendCompleted()
//                    }
                case .failure(let encodingError):
                    print(encodingError)
                    if hud != nil {
                        Tools.shareInstance.hiddenLoading(hud: hud!)
                    }
                    _ = Tools.shareInstance.showMessage(KWINDOWDS(), msg: "上传失败", autoHidder: true)
                    subscriber.sendCompleted()
                }
//                subscriber.sendCompleted()
            }
            return nil
        })
    }
    
    ///
    /// - parameter url:        输入URL
    /// - parameter parameters: 参数
    ///
    /// - returns: 一个信号
    func httpRequest(_ type:HttpRequestType,url:String, parameters:AnyObject?, success:@escaping SuccessClouse, failure:@escaping FailureClouse) {
        var methods:HTTPMethod
        switch type {
            case .post:
                methods = HTTPMethod.post
            case .get:
                methods = HTTPMethod.get
            case .delete:
                methods = HTTPMethod.delete
            default:
                methods = HTTPMethod.put
        }
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        Alamofire.request(url, method: methods, parameters: parameters as? [String: Any], encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            
            NetWorkingResponse.sharedInstance.showNetWorkingResPonse(response as AnyObject)
            if response.result.error != nil{
                failure(response.result.error! as AnyObject)
            }else{
                if response.response?.statusCode == 200 || response.response?.statusCode == 201 {
                    success(response.result.value! as AnyObject)
                }else{
                    failure(response.result.value! as AnyObject)
                }
            }
        }
    }
    //这个请求方法有问题
//    func expressDelivery(url:String, parameters:NSMutableDictionary) -> RACSignal{
//        return RACSignal.createSignal({ (subscriber) -> RACDisposable! in
//            let headers = [
//                "content-type": "application/x-www-form-urlencoded",
//                "cache-control": "no-cache",
//                "postman-token": "25f805ac-ede1-fba6-42c7-088ff700bd7d"
//            ]
//            
//            parameters.setObject("NWUxNzljYTY1ZDQwYmNlY2UzODUzZjI3ZTI1MDEyODQ%3d", forKey: "DataSign")
//            
////            parameters.setValue("NmFiZDc1NTFlODI4YmZjZjY1MWVlZDQyZGFmOGFlZjM%3d", forKey: "DataSign")
//            
//            parameters.setObject("%7b%22CallBack%22%3a%22%22%2c%22IsNotice%22%3a%220%22%2c%22LogisticCode%22%3a%223241232435122%22%2c%22MemberID%22%3a%22%22%2c%22OrderCode%22%3a%2212345678%22%2c%22Receiver%22%3a%7b%22Address%22%3a%22%e4%b8%bd%e6%b0%b4%e5%98%89%e5%9b%ad6%e5%8f%b7%e6%a5%bc%22%2c%22CityName%22%3a%22%e5%8c%97%e4%ba%ac%e5%b8%82%22%2c%22ExpAreaName%22%3a%22%e6%9c%9d%e9%98%b3%e5%8c%ba%22%2c%22Mobile%22%3a%2213225023002%22%2c%22Name%22%3a%22%e6%9d%8e%e5%9b%9b%22%2c%22ProvinceName%22%3a%22%e5%8c%97%e4%ba%ac%e5%b8%82%22%7d%2c%22Sender%22%3a%7b%22Address%22%3a%22%e5%9d%82%e9%9d%a2%e9%95%87%22%2c%22CityName%22%3a%22%e4%b8%89%e6%98%8e%e5%b8%82%22%2c%22ExpAreaName%22%3a%22%e5%b0%a4%e6%ba%aa%e5%8e%bf%22%2c%22Mobile%22%3a%2218363899723%22%2c%22Name%22%3a%22%e5%bc%a0%e5%be%b7%e5%85%a8%22%2c%22ProvinceName%22%3a%22%e7%a6%8f%e5%bb%ba%e7%9c%81%22%7d%2c%22ShipperCode%22%3a%22YTO%22%7d", forKey: "RequestData")
//            
//            let postData = NSMutableData.init(data: "RequestType=\((parameters )["RequestType"])".dataUsingEncoding(NSUTF8StringEncoding)!)
//            postData.appendData("&DataType=\((parameters["DataType"])!)".dataUsingEncoding(NSUTF8StringEncoding)!)
//            postData.appendData("&EBusinessID=\((parameters["EBusinessID"])!)".dataUsingEncoding(NSUTF8StringEncoding)!)
//            postData.appendData("&DataSign=\((parameters["DataSign"])!)".dataUsingEncoding(NSUTF8StringEncoding)!)
//            postData.appendData("&RequestData=\((parameters["RequestData"])!)".dataUsingEncoding(NSUTF8StringEncoding)!)
//            
//            
//            let request = NSMutableURLRequest.init(URL: NSURL.init(string: url)!, cachePolicy: NSURLRequestCachePolicy.UseProtocolCachePolicy, timeoutInterval: 10.0)
//            
//            request.HTTPMethod = "POST"
//            request.allHTTPHeaderFields = headers
//            request.HTTPBody = postData
//            
//            let session = NSURLSession.sharedSession()
//            let dataTask = session.dataTaskWithRequest(request as NSURLRequest) { (data, response, error) in
//                if (error != nil) {
//                    print(error)
//                    subscriber.sendNext(["fail":"error"])
//                } else {
//                    let httpResponse = response as? NSHTTPURLResponse
//                    if (httpResponse?.statusCode == 200) {
//                        let str = String.init(data: data!, encoding: NSUTF8StringEncoding)
//                        subscriber.sendNext(data)
//                    }else{
//                        subscriber.sendNext(["fail":"error"])
//                    }
//                    print(httpResponse)
//                }
//            }
//            
//            dataTask.resume()
//            return nil
//        })
//    }
    
    func jsonStringToDic(_ dictionary_temp:String) ->NSDictionary {
        let data = dictionary_temp.data(using: String.Encoding.utf8)! as NSData
        let dictionary_temp_temp = try? JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.mutableContainers)
        return dictionary_temp_temp as! NSDictionary
        
    }
}
