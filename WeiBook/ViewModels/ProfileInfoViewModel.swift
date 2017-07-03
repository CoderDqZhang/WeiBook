//
//  ProfileInfoViewModel.swift
//  WeiBook
//
//  Created by Zhang on 2017/6/23.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit
import MJExtension
import ReactiveSwift

class ProfileInfoViewModel: BaseViewModel {

    var navigationTitle = "个人信息"
    var sectionsNumber = [1,4,3]
    var sectionsStrs = ["基本信息","高级信息"]
    var textLabelTexts = [["昵称","电话","位置","性别"],["微信号","公司","QQ"]]
    var detailLabelTexts:[NSMutableArray] = []
    var textPlachTexts = [["用户昵称","电话","位置","性别"],["微信号","公司","QQ"]]
    var userInfo:UserInfoModel!
    
    override init() {
        super.init()
        self.requestUserInfo()
    }
    
    func saveUserInfo(){
        
    }
    
    func genderTextField(){
        let baseArray:NSMutableArray = []
        baseArray.add(UserInfoModel.shareInstance().username)
        baseArray.add(UserInfoModel.shareInstance().mobile)
        if (UserInfoModel.shareInstance().tails.userInfo.city == nil || UserInfoModel.shareInstance().tails.userInfo.city as! NSNumber == 0) {
            baseArray.add("未选择")
        }else{
            baseArray.add(UserInfoModel.shareInstance().tails.userInfo.city)
        }
        baseArray.add(UserInfoModel.shareInstance().tails.userInfo.sex == "" ? "未选择" : UserInfoModel.shareInstance().tails.userInfo.sex ?? "男")
        
        let adArray:NSMutableArray = []
        adArray.add("")
        adArray.add("")
        adArray.add("")
        detailLabelTexts.append(baseArray)
        detailLabelTexts.append(adArray)
    }
    
    func tableViewGloableLableDetailLabelImageCellSetData(_ indexPath:IndexPath, cell:GloableLableDetailLabelImageCell) {
        cell.setCellData(text: textLabelTexts[indexPath.section - 1][indexPath.row], detailText: self.detailLabelTexts[indexPath.section - 1][indexPath.row] as? String)
    }
    
    func tableViewGloableImageLableTextFieldImageCellSetData(_ indexPath:IndexPath, cell:GloableImageLableTextFieldImageCell) {
        self.genderTextField()
        cell.setCellData(text: textLabelTexts[indexPath.section - 1][indexPath.row], detailText: self.detailLabelTexts[indexPath.section - 1][indexPath.row] as? String, plachText: textPlachTexts[indexPath.section - 1][indexPath.row])
        if indexPath.section == 1 && indexPath.row == 0 {
            cell.textField.reactive.continuousTextValues.observeValues({ (str) in
                UserInfoModel.shareInstance().username = str
            })
        }else if indexPath.section == 1 && indexPath.row == 1{
            cell.textField.reactive.continuousTextValues.observeValues({ (str) in
                UserInfoModel.shareInstance().mobile = str
            })
        }
    }
    
    func tableViewProfileInfoHeaderTableViewCellSetData(_ indexPath:IndexPath, cell:ProfileInfoHeaderTableViewCell){
        cell.cellSetData(model: UserInfoModel.shareInstance())
    }
    
    func tableViewDidSelectRowAtIndexPath(_ indexPath:IndexPath) {
        if indexPath.section == 0 {
            (self.controller as! ProfileInfoViewController).presentImagePickerView()
        }else if indexPath.section == 1 && indexPath.row == 2 {
            (self.controller as! ProfileInfoViewController).showCityPickerView()
        }else if indexPath.section == 1 && indexPath.row == 3 {
            (self.controller as! ProfileInfoViewController).showSexPickerView()
        }
    }
    
    //MARK: NetWorking
    func requestUserInfo(){
        if UserInfoModel.isExistInTable() {
            userInfo = UserInfoModel.shareInstance()
            print(userInfo)
        }else{
            let url = "\(BaseUrl)\(LoginUrl)"
            let parameters = ["mobile":"18363899723","password":"123"]
            BaseNetWorke.sharedInstance.postUrlWithString(url, parameters: parameters as AnyObject).observe { (resultDic) in
                if (!resultDic.isCompleted){
                    self.userInfo = UserInfoModel.mj_object(withKeyValues: resultDic.value)
                    self.userInfo?.saveOrUpdate()
                    self.userInfo.tails.saveOrUpdate()
                    self.userInfo.tails.userInfo.saveOrUpdate()
                }
            }
        }
    }
    
}

extension ProfileInfoViewModel : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.tableViewDidSelectRowAtIndexPath(indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (section > 0 ){
            return sectionsStrs[section - 1]
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                return 90
            default:
                return 80
            }
        default:
            return 44
        }
    }
}
extension ProfileInfoViewModel : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionsNumber[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: ProfileInfoHeaderTableViewCell.description() , for: indexPath)
            cell.accessoryType = .disclosureIndicator
            self.tableViewProfileInfoHeaderTableViewCellSetData(indexPath, cell: cell as! ProfileInfoHeaderTableViewCell)
            return cell
        default:
            if (indexPath.section == 1 && (indexPath.row == 2 || indexPath.row == 3)){
                let cell = tableView.dequeueReusableCell(withIdentifier: GloableLableDetailLabelImageCell.description(), for:indexPath) as! GloableLableDetailLabelImageCell
                cell.accessoryType = .disclosureIndicator
                self.tableViewGloableLableDetailLabelImageCellSetData(indexPath,cell: cell)
                return cell
            }
            let cell = tableView.dequeueReusableCell(withIdentifier: GloableImageLableTextFieldImageCell.description(), for:indexPath) as! GloableImageLableTextFieldImageCell
            cell.accessoryType = .disclosureIndicator
            self.tableViewGloableImageLableTextFieldImageCellSetData(indexPath,cell: cell)
            return cell
        }
    }
}