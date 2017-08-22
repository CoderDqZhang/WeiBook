//
//  BaseWebViewController.swift
//  WeiBook
//
//  Created by Zhang on 2017/7/11.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit
import NJKWebViewProgress

class BaseWebViewController: BaseViewController {

    var webView:UIWebView! = nil
    var url:String! = ""
    var progressProxy:NJKWebViewProgress!
    var progressView:NJKWebViewProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
        self.setUpNavigationItem()
        // Do any additional setup after loading the view.
    }
    
    func setUpView(){
        progressProxy = NJKWebViewProgress.init()
        
        progressProxy.webViewProxyDelegate = self
        progressProxy.progressDelegate = self
        let progressBarHeight:CGFloat = 2;
        let frame = CGRect.init(x: 0, y: (navigationBar?.frame.size.height)! + 20, width: SCREENWIDTH, height: progressBarHeight)
        progressView = NJKWebViewProgressView.init(frame: frame)
        progressView.autoresizingMask = [UIViewAutoresizing.flexibleWidth,UIViewAutoresizing.flexibleTopMargin]
        
        
        webView = UIWebView.init()
        webView.delegate = progressProxy
        webView.loadRequest(URLRequest.init(url: URL.init(string: self.url)!))
        self.view.addSubview(webView)
        webView.snp.makeConstraints { (make) in
            make.left.equalTo(self.view.snp.left).offset(0)
            make.right.equalTo(self.view.snp.right).offset(0)
            make.top.equalTo(self.view.snp.top).offset(0)
            make.bottom.equalTo(self.view.snp.bottom).offset(0)
        }
        self.view.addSubview(progressView)
    }
    
    func setUpNavigationItem(){
        self.navigationItem.title = "二维码"
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

extension BaseWebViewController : NJKWebViewProgressDelegate {
    func webViewProgress(_ webViewProgress: NJKWebViewProgress!, updateProgress progress: Float) {
        progressView.setProgress(progress, animated: true)
    }
}

extension BaseWebViewController: UIWebViewDelegate {
    
}
