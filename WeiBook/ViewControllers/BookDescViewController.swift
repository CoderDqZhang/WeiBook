//
//  BookDescViewController.swift
//  WeiBook
//
//  Created by Zhang on 2017/7/5.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit

class BookDescViewController: BaseViewController {

    var enTimePickerView:ZHPickView!
    var model:ServerBookModel!
    var myBookModel:MyBooksModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindViewModel(viewModel: BookDescViewModel.init(), controller: self)
        self.view.backgroundColor = UIColor.init(hexString: App_Theme_F8F9F9_Color)
        self.setUpTableView(style: .plain, cells: [BookBaseInfoTableViewCell.self,BookAdvanceTableViewCell.self, UserInfoTableViewCell.self, CommentInfoTableViewCell.self], controller: self)
        self.setUpNavigaiotionItem()
        self.bindBookDescLogic()
        // Do any additional setup after loading the view.
    }
    
    func setUpNavigaiotionItem() {
        self.navigationItem.title = "图示详情"
        if self.myBookModel != nil {
            self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "生成二维码", style: .plain, target: self, action: #selector(BookDescViewController.rightBarItemPress))
        }
    }

    func rightBarItemPress() {
        if (self.viewModel as! BookDescViewModel).bookDescModel != nil {
            if self.myBookModel.borrowState == 1 {
                UIAlertController.shwoAlertControl(self, style: .actionSheet, title: nil, message: nil, titles: ["借阅二维码","赠送二维码"], cancel: "取消", doneTitle: nil, cancelAction: {
                    
                }) { (str) in
                    if str == "借阅二维码" {
                        UIAlertController.shwoAlertControl(self, style: .alert, title: "请选择还书时间", message: nil, titles: nil, cancel: "取消", doneTitle: "确定", cancelAction: {
                            
                        }, doneAction: { (str) in
                            self.showSexPickerView()
                        })
                    }else {
                        (self.viewModel as! BookDescViewModel).giveButtonPress(time: Int64(Int(Date.init().unixTimestamp)))
                    }
                }
            }else if self.myBookModel.borrowState == 3 {
                UIAlertController.shwoAlertControl(self, style: .actionSheet, title: nil, message: nil, titles: ["还书二维码"], cancel: "取消", doneTitle: nil, cancelAction: {
                    
                }) { (str) in
                    (self.viewModel as! BookDescViewModel).borrowedButtonPress()
                }
            }
        }
    }
    
    func bindBookDescLogic(){
        if self.myBookModel != nil {
            (self.viewModel as! BookDescViewModel).myBookModel = self.myBookModel
            (self.viewModel as! BookDescViewModel).model = self.myBookModel.tails.bookInfo
        }else{
            (self.viewModel as! BookDescViewModel).model = self.model
        }
        (self.viewModel as! BookDescViewModel).requstBookDesc()
        (self.viewModel as! BookDescViewModel).requestBookComment()
    }
    
    func showSexPickerView(){
        if enTimePickerView == nil {
            enTimePickerView = ZHPickView(pickviewWith: ["15天","1个月","2个月","3个月"], isHaveNavControler: false)
            enTimePickerView.setPickViewColer(UIColor.white)
            enTimePickerView.setPickViewColer(UIColor.white)
            enTimePickerView.setTintColor(UIColor.white)
            enTimePickerView.tag = 5
            enTimePickerView.setToolbarTintColor(UIColor.white)
            enTimePickerView.setTintFont(App_Theme_PinFan_R_13_Font, color: UIColor.init(hexString: App_Theme_384249_Color))
            enTimePickerView.delegate = self
        }
        
        enTimePickerView.show()
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

extension BookDescViewController: ZHPickViewDelegate {
    func toobarDonBtnHaveClick(_ pickView: ZHPickView!, resultString: String!) {
        let date = Int(Date.init().unixTimestamp)
        var resultData:Int
        switch resultString {
        case "15天":
            resultData = 15 * 24 * 60 * 60
            break;
        case "1个月":
            resultData = 20 * 24 * 60 * 60
            break;
        case "2个月":
            resultData = 30 * 2 * 24 * 60 * 60
            break;
        default:
            resultData = 30 * 3 * 24 * 60 * 60
            break;
        }
        (self.viewModel as! BookDescViewModel).borrowButtonPress(time: Int64(date + resultData))
    }
}
