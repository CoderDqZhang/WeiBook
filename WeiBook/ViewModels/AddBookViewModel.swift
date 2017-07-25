//
//  AddBookViewModel.swift
//  WeiBook
//
//  Created by Zhang on 2017/7/3.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit
import SwifterSwift
import MBProgressHUD

class AddBookViewModel: BaseViewModel {

    var isbnStr:String!
    var snbBookModel:SBNBookModel!
    var serverBookModel:NSMutableArray!
    
    var sectionsNumber = [3]
    var iFluSpeechSynthesizer:IFlySpeechSynthesizer!
    
    var loadingView:MBProgressHUD!
    
    override init() {
        super.init()
        self.xfYunManger()
    }
    
    
    
    func addBook(){
        if UserInfoModel.isLoggedIn() {
            let controller = AddBookCommentViewController()
            controller.bookModel = ServerBookModel.init(fromDictionary: (serverBookModel[0] as! NSDictionary))
            NavigationPushView(self.controller!, toConroller: controller)
        }else{
            NavigationPushView(self.controller!, toConroller: LoginViewController())
        }
    }
    
    func tableViewTagCellHeight() ->CGFloat {
        var originX:CGFloat = OriginX
        var originY:CGFloat = OriginY
        let labelHeight:CGFloat = LabelHeight
        for i in 0...snbBookModel.tags.count - 1 {
            let width = snbBookModel.tags[i].title.widthWithConstrainedHeight(snbBookModel.tags[i].title, font: App_Theme_PinFan_R_13_Font!, height: labelHeight) + 20
            if originX + width > SwifterSwift.screenWidth - 20 {
                originY = originY + LabelHeight + 10
                originX = OriginX
            }
        }
        return originY
    }
    
    func tableViewBookAdvanceTableViewCellSetData(_ indexPath:IndexPath, cell:BookAdvanceTableViewCell){
        if self.snbBookModel != nil {
            cell.cellSetData(model: self.snbBookModel)
        }
    }
    
    func tableViewBookBaseInfoTableViewCellSetData(_ indexPath:IndexPath, cell:BookBaseInfoTableViewCell) {
        if self.snbBookModel != nil {
            cell.cellSetData(model: self.snbBookModel)
        }
    }
    
    func tableViewBookTagTableViewCellSetData(_ indexPath:IndexPath, cell:BookTagTableViewCell){
        if self.snbBookModel != nil {
            cell.cellSetData(model: self.snbBookModel)
        }
    }
    
    //MARK: TableViewDidSelect
    func tableViewDidSelect(_ indexPath:IndexPath) {
        if indexPath.row == 1 {
            var array:[String]!
            let language = self.snbBookModel.summary.languageDetectByFirstCharacter(str: self.snbBookModel.summary)
            switch language {
            case .Chinese:
                array = ["xiaoyan","vinn","vils","aisjying","aisduck"]
            default:
                array = ["aiscatherine","aistom","abha","gabriela","mariane"]
            }
            UIAlertController.shwoAlertControl(self.controller!, style: .actionSheet, title: nil, message: nil, titles: array, cancel: "取消", doneTitle: nil, cancelAction: { 
                
            }, doneAction: { (str) in
                self.iFluSpeechSynthesizer?.setParameter(str, forKey: IFlySpeechConstant.voice_NAME())
            })
//            loadingView = Tools.shareInstance.showLoading((self.controller?.view)!, msg: "正在合成语音")
            iFluSpeechSynthesizer.startSpeaking(self.snbBookModel.summary)
        }
    }
    
    //MARK: XFyunManager
    func xfYunManger(){
        iFluSpeechSynthesizer = IFlySpeechSynthesizer.sharedInstance()
        iFluSpeechSynthesizer?.delegate = self
        iFluSpeechSynthesizer?.setParameter(IFlySpeechConstant.type_CLOUD(), forKey: IFlySpeechConstant.text_ENCODING())
        iFluSpeechSynthesizer?.setParameter("50", forKey: IFlySpeechConstant.voice_NAME())
    }
    
    //MARK: NetWorking
    func requestGetBook(isbn:String){
        let url = "\(SBNCodeApi)\(isbn)"
        BaseNetWorke.sharedInstance.getUrlWithString(url, parameters: nil).observe { (resultDic) in
            print(resultDic)
            if (!resultDic.isCompleted){
                self.snbBookModel = SBNBookModel.init(fromDictionary: resultDic.value as! NSDictionary)
                self.controller?.tableView.reloadData()
            }
        }
        let serverUrl = "\(BaseUrl)\(QRCodeServer)"
        let parameters = ["searchKey":isbn]
        BaseNetWorke.sharedInstance.getUrlWithString(serverUrl, parameters:parameters as AnyObject).observe { (resultDic) in
            if (!resultDic.isCompleted){
                self.serverBookModel = NSMutableArray.mj_keyValuesArray(withObjectArray: resultDic.value as! [Any])
//                print(self.serverBookModel)
            }
        }
    }
}

//MARK: TableViewDelegate&DataSource
extension AddBookViewModel : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.tableViewDidSelect(indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0001
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0001
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 164
        case 1:
            return (self.controller?.tableView.fd_heightForCell(withIdentifier: BookAdvanceTableViewCell.description(), configuration: { (cell) in
                if self.snbBookModel != nil {
                    (cell as! BookAdvanceTableViewCell).cellSetData(model: self.snbBookModel)
                }
            }))!
        default:
            return self.snbBookModel == nil ? 60 : self.tableViewTagCellHeight() + 100
        }
    }
}
extension AddBookViewModel : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionsNumber[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: BookBaseInfoTableViewCell.description() , for: indexPath)
            self.tableViewBookBaseInfoTableViewCellSetData(indexPath,cell: cell as! BookBaseInfoTableViewCell)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: BookAdvanceTableViewCell.description() , for: indexPath)
            cell.backgroundColor = UIColor.init(hexString: App_Theme_F8F9F9_Color)
            self.tableViewBookAdvanceTableViewCellSetData(indexPath,cell: cell as! BookAdvanceTableViewCell)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: BookTagTableViewCell.description() , for: indexPath)
            cell.backgroundColor = UIColor.init(hexString: App_Theme_F8F9F9_Color)
            self.tableViewBookTagTableViewCellSetData(indexPath,cell: cell as! BookTagTableViewCell)
            return cell
        }
    }
}

extension AddBookViewModel : IFlySpeechSynthesizerDelegate {
    func onCompleted(_ error: IFlySpeechError!) {
        Tools.shareInstance.hiddenLoading(hud: loadingView)
    }
    
    func onSpeakBegin() {
    }
    
    func onBufferProgress(_ progress: Int32, message msg: String!) {
        
    }
    
    func onSpeakProgress(_ progress: Int32, beginPos: Int32, endPos: Int32) {
        
    }
}

