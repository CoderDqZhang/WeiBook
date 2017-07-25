//
//  ProfileViewModel.swift
//  WeiBook
//
//  Created by Zhang on 2017/6/21.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit


class ProfileViewModel: BaseViewModel {

    var sectionsNumber = [2,3,2,1,1]
    var cellImageDatas = [[UIImage.init(named: "Borrow"),UIImage.init(named: "ic_fun_appraise"),UIImage.init(named: "give")],[UIImage.init(named: "books"),UIImage.init(named: "book_list")],[UIImage.init(named: "achievement")],[UIImage.init(named: "seting")]]
    var cellStrDatas = [["我的借阅","我的评价","我的赠送"],["我的书库","我的书单"],["我的成就"],["系统设置"]]
    override init() {
        super.init()
        NotificationCenter.default.addObserver(self, selector: #selector(ProfileViewModel.reloadTaleView), name: NSNotification.Name(rawValue: LoginStatuesChange), object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func reloadTaleView(){
        self.controller?.tableView.reloadData()
    }
    
    //MARK: TableViewDidSelect
    func tableViewDidSelect(_ indexPath:IndexPath) {
        switch indexPath.section {
        case 0:
            if indexPath.row == 0 {
                let controller = ProfileInfoViewController()
                NavigationPushView(self.controller!, toConroller: controller)
//                if UserInfoModel.isLoggedIn() {
//                    let controller = ProfileInfoViewController()
//                    NavigationPushView(self.controller!, toConroller: controller)
//                    
//                }else{
//                    NavigationPushView(self.controller!, toConroller: LoginViewController())
//                }
            }
        case 1:
            switch indexPath.row {
            case 0:
                NavigationPushView(self.controller!, toConroller: MyBorrowViewController())
            case 1:
                NavigationPushView(self.controller!, toConroller: MyCommonViewController())
            default:
                NavigationPushView(self.controller!, toConroller: MyGivePresentViewController())
                
            }
        case 2:
            switch indexPath.row {
            case 0:
                NavigationPushView(self.controller!, toConroller: BooksViewController())
            default:
                NavigationPushView(self.controller!, toConroller: MyBookListViewController())
            }
        case 3:
            NavigationPushView(self.controller!, toConroller: AchievementViewController())
        default:
            NavigationPushView(self.controller!, toConroller: SetingViewController())
        }
    }
    
    //MARK: - TableViewCellSetData
    func tableViewProfileInfoTableViewCellCellData(_ indexPath:IndexPath, cell:ProfileInfoTableViewCell){
        cell.profileInfoTableViewCellClouse = { tag in
            switch tag {
            case 0:
                NavigationPushView(self.controller!, toConroller: FansViewController())
            case 1:
                NavigationPushView(self.controller!, toConroller: FlowersViewController())
            default:
                break;
            }
        }
    }
    
    
    func tableViewGloableImageLableDetailImageCellSetData(_ indexPath:IndexPath, cell:GloableImageLableDetailImageCell){
        let image = cellImageDatas[indexPath.section - 1][indexPath.row]!
        cell.cellSetData(image: image, lableStr: cellStrDatas[indexPath.section - 1][indexPath.row], detailStr: nil)
    }
    
    func tableViewProfileHeaderTableViewCellSetData(_ indexPath:IndexPath, cell:ProfileHeaderTableViewCell) {
        cell.cellSetData(model: UserInfoModel.shareInstance(), isLogin: UserInfoModel.isLoggedIn())
    }
}

extension ProfileViewModel : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.tableViewDidSelect(indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0001
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
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

extension ProfileViewModel : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionsNumber[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: ProfileHeaderTableViewCell.description() , for: indexPath)
                self.tableViewProfileHeaderTableViewCellSetData(indexPath,cell: cell as! ProfileHeaderTableViewCell)
                cell.accessoryType = .disclosureIndicator
                return cell
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: ProfileInfoTableViewCell.description() , for: indexPath)
                self.tableViewProfileInfoTableViewCellCellData(indexPath, cell: cell as! ProfileInfoTableViewCell)
                return cell
            }
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: GloableImageLableDetailImageCell.description(), for:indexPath) as! GloableImageLableDetailImageCell
            cell.accessoryType = .disclosureIndicator
            cell.selectionStyle = .gray
            self.tableViewGloableImageLableDetailImageCellSetData(indexPath,cell: cell)
            return cell
        }
    }
}

