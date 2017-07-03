//
//  SearchViewController.swift
//  WeiBook
//
//  Created by Zhang on 2017/6/26.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit

class SearchViewController: BaseViewController {

    var searchNavigationBar = GloableNavigationBarSearchView(frame: CGRect(x: 0,y: 0,width: SCREENWIDTH, height: 64),font:App_Theme_PinFan_L_12_Font)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.bindViewModel(viewModel: SearchViewModel(), controller: self)
        self.setUpView()
        // Do any additional setup after loading the view.
    }
    
    func setUpView(){
        searchNavigationBar.updataFrame()
        searchNavigationBar.searchField.becomeFirstResponder()
        searchNavigationBar.QRCodeButton.reactive.controlEvents(.touchUpInside).observe { (action) in
            self.searchNavigationBar.searchField.resignFirstResponder()
            self.dismiss(animated: true, completion: { 
                
            })
        }
        searchNavigationBar.searchNavigationBarCancelClouse = { _ in
            self.searchNavigationBar.searchField.resignFirstResponder()
            self.dismiss(animated: true, completion: {
                
            })
        }
        self.view.addSubview(searchNavigationBar)
        
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