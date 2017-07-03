//
//  AddBookViewController.swift
//  WeiBook
//
//  Created by Zhang on 2017/7/3.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit

class AddBookViewController: BaseViewController {

    var isbn:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpNavigaitonItem()
        self.bindViewModel(viewModel: AddBookViewModel(), controller: self)
        self.logicViewModel()
        // Do any additional setup after loading the view.
    }
    
    func setUpNavigaitonItem(){
        self.navigationController?.navigationBar.barTintColor = UIColor.init(hexString: App_Theme_594CA8_Color, andAlpha: 1)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage.init(color: UIColor.init(hexString: App_Theme_594CA8_Color, andAlpha: 1), size: CGSize(width: SCREENWIDTH, height: 64)), for: .default)
        self.navigationController?.navigationBar.isTranslucent  = false
    }
    
    func logicViewModel(){
        (self.viewModel as! AddBookViewModel).isbnStr = self.isbn
        (self.viewModel as! AddBookViewModel).requestGetBook(isbn: self.isbn)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.fd_interactivePopDisabled = true
        self.navigationController?.fd_prefersNavigationBarHidden = false
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func backBtnPress(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
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
