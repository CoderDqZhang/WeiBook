//
//  UserProtocolViewController.swift
//  LiangPiao
//
//  Created by Zhang on 02/12/2016.
//  Copyright © 2016 Zhang. All rights reserved.
//

import UIKit
import WebKit

class UserProtocolViewController: UIViewController {

    var webView:WKWebView!
    var url:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title =  "用户协议"
        self.setNavigationItemBack()
        self.view.backgroundColor = UIColor.white
        webView = WKWebView(frame: CGRect.init(x: 0, y: 0, width: SwifterSwift.screenWidth, height: SwifterSwift.screenHeight - 64))
        webView.load(URLRequest.init(url: URL.init(string: url)!))
        self.view.addSubview(webView)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
