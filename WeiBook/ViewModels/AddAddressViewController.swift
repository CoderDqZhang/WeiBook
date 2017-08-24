
//
//  AddAddressViewController.swift
//  WeiBook
//
//  Created by Zhang on 24/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

typealias AddAddressClouse = (_ str:String) ->Void

class AddAddressViewController: BaseViewController {

    var addAddressClouse:AddAddressClouse!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindViewModel(viewModel: AddAddressViewModel(), controller: self)
        self.setUpTableView(style: .plain, cells: [DetailAddressTableViewCell.self], controller: self)
        self.setUpView()
        // Do any additional setup after loading the view.
    }

    func setUpView(){
        let addAddress = GloableBottomButtonView.init(frame: nil, title: "添加", tag: 1, action: { (tag) in
            if self.addAddressClouse != nil {
                self.addAddressClouse((self.viewModel as! AddAddressViewModel).address)
                self.navigationController?.popViewController()
            }
        })
        self.view.addSubview(addAddress)
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
