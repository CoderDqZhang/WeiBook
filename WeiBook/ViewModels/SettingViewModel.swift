//
//  SettingViewModel.swift
//  WeiBook
//
//  Created by Zhang on 2017/6/29.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit
import MessageUI

class SettingViewModel: BaseViewModel {

    var sectionsNumber = [3,1]
    var titleLabelTexts = ["关于我们","意见反馈","赏个好评"]
    override init() {
        
    }
    
//    func presentEmailViewController(_ controller:SettingViewController){
//        guard MFMailComposeViewController.canSendMail() else {
//            MainThreadAlertShow("不能发送邮箱，请设置邮箱账号", view: KWINDOWDS())
//            return
//        }
//        let mailVC = MFMailComposeViewController()
//        mailVC.mailComposeDelegate = self // 代理
//        mailVC.setSubject("意见反馈") // 主题
//        mailVC.setToRecipients(["feedback@liangpiao.me"]) // 收件人
//        mailVC.setMessageBody("相关内容", isHTML: false) // 内容，允许使用html内容
//        
//        controller.present(mailVC, animated: true, completion: nil)
//    }
//    
//    @nonobjc func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?){
//        controller.dismiss(animated: true) {
//            
//        }
//    }
    
    func tableViewGloableLableDetailLabelImageCellSetData(_ indexPaht:IndexPath, cell:GloableLableDetailLabelImageCell){
        cell.setCellData(text: titleLabelTexts[indexPaht.row], detailText: nil)
    }
}

extension SettingViewModel : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 1 {
            if UserInfoModel.shareInstance().deleteObject() {
                Notification(LoginStatuesChange, value: nil)
                self.controller?.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0001
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}
extension SettingViewModel : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionsNumber[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: GloableLableDetailLabelImageCell .description() , for: indexPath)
            cell.accessoryType = .disclosureIndicator
            self.tableViewGloableLableDetailLabelImageCellSetData(indexPath, cell: cell as! GloableLableDetailLabelImageCell)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: GloableLableDetailLabelImageCell.description(), for:indexPath) as! GloableLableDetailLabelImageCell
            cell.accessoryType = .none
            cell.setCellData(text: "退出登录", detailText: nil)
            return cell
        }
    }
}


