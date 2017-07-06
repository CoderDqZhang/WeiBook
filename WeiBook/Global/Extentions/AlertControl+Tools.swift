//
//  AlertControl+Tools.swift
//  AlertActionShow
//
//  Created by Zhang on 9/7/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

import Foundation
import UIKit

typealias CancelAction = () -> Void
typealias DoneAction = (_ str:String) -> Void

extension UIAlertController {
    
    convenience init(message: String?) {
        self.init(title: nil, message: message, preferredStyle: .alert)
        self.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
    }
    
    class func shwoAlertControl(_ controller:UIViewController,style:UIAlertControllerStyle,title:String?,message:String?,titles:[String]?, cancel:String?, doneTitle:String?, cancelAction: @escaping CancelAction, doneAction:@escaping DoneAction){
        var alertControl = UIAlertController()
        if title == nil {
            alertControl = UIAlertController(title: nil, message: message, preferredStyle: style)
        }else if message == nil{
            alertControl = UIAlertController(title: title, message: nil, preferredStyle: style)
            
        }else{
            alertControl = UIAlertController(title: title, message: message, preferredStyle: style)
        }
        if cancel != nil {
            let leftAction = UIAlertAction(title: cancel, style: .cancel) { (action) in
                cancelAction()
            }
            alertControl.addAction(leftAction)
        }
        if doneTitle != nil {
            let rightAction = UIAlertAction(title: doneTitle, style: .default) { (action) in
                doneAction(action.title!)
            }
            alertControl.addAction(rightAction)
        }
        if style == .actionSheet {
            for str in titles! {
                let rightAction = UIAlertAction(title: str, style: .default) { (action) in
                    doneAction(action.title!)
                }
                alertControl.addAction(rightAction)
            }
            
        }
        controller.present(alertControl, animated: true) {
            
        }
    }
}
