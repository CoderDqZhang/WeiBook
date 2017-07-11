//
//  BookDescViewController.swift
//  WeiBook
//
//  Created by Zhang on 2017/7/5.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit

class BookDescViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUpNavigaiotionItem()
        // Do any additional setup after loading the view.
    }
    
    func setUpNavigaiotionItem() {
        self.navigationItem.title = "图示详情"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "生成二维码", style: .plain, target: self, action: #selector(BookDescViewController.rightBarItemPress))
    }

    func rightBarItemPress() {
        UIAlertController.shwoAlertControl(self, style: .actionSheet, title: nil, message: nil, titles: ["借阅二维码","赠送二维码"], cancel: "取消", doneTitle: nil, cancelAction: { 
            
        }) { (str) in
            let toController = BaseWebViewController()
            toController.url = "\(QRCodeUrl)'dsfd':'fsdfs'"
            NavigationPushView(self, toConroller: toController)
        }
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
