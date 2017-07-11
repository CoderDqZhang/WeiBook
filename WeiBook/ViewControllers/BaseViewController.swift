//
//  BaseViewController.swift
//  WeiBook
//
//  Created by Zhang on 2017/6/19.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit
import SnapKit


class BaseViewController: UIViewController{

    var tableView:UITableView!
    var viewModel:BaseViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(hexString: App_Theme_FFFFFF_Color)
        self.setNavigationItemBack()
        // Do any additional setup after loading the view.
    }

    
    func setUpTableView(style:UITableViewStyle, cells:[AnyClass], controller:UIViewController?){
        tableView = UITableView.init(frame: CGRect.zero, style: style)
        print(cells[0])
        for cell in cells{
            tableView.register(cell.self, forCellReuseIdentifier: "\(cell.description())")
        }
        controller?.view.addSubview(tableView)
        tableView.delegate = viewModel as? UITableViewDelegate
        tableView.dataSource = viewModel as? UITableViewDataSource
        tableView.keyboardDismissMode = .onDrag
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo((controller?.view.snp.top)!).offset(0)
            make.left.equalTo((controller?.view.snp.left)!).offset(0)
            make.right.equalTo((controller?.view.snp.right)!).offset(0)
            make.bottom.equalTo((controller?.view.snp.bottom)!).offset(0)
        }
    }
    
    func bindViewModel(viewModel:BaseViewModel?, controller: BaseViewController?){
        
        self.viewModel = viewModel
        viewModel?.controller = controller
    }
    
    func changeTableViewFrame(frame:CGRect) {
        tableView.snp.remakeConstraints { (make) in
        }
    }
    
    func getViewModel(){
        
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

//extension BaseViewController : UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        viewModel.tableViewCell(indexPath)
//    }
//}
//
//extension BaseViewController : UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        return viewModel.tableViewCell(indexPath)
//    }
//}


