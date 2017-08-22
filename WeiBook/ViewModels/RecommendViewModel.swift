//
//  RecommendViewModel.swift
//  WeiBook
//
//  Created by Zhang on 2017/6/27.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit
import SwifterSwift

class RecommendViewModel: BaseViewModel {

    var sectionsNumber = [1,2,2,2,2]
    var bannerModel:NSMutableArray = NSMutableArray()
    var newBook = NSMutableArray.init()
    var hotBook = NSMutableArray.init()
    
    override init() {
        super.init()
        self.requestBanner()
        self.requestRecommendBook(type: "1")
        self.requestRecommendBook(type: "2")
    }
    
    //MARK: -TableViewCellData
    func tableViewRecommendTableViewCellSetData(_ indexPath:IndexPath, cell:RecommendTableViewCell){
        let imageUrls = NSMutableArray()
        for banner in self.bannerModel {
            imageUrls.add((banner as! BannerModel).img)
        }
        cell.setcycleScrollerViewData(imageUrls.mutableCopy() as! NSArray)
        cell.cyCleScrollerViewClouse = { index in
//            let banner = self.bannerModel[index]
//            let bookDesc = BookDescViewController()
//            bookDesc.model = (banner as! BannerModel).
//            let pageController = self.controller?.parent
//            (pageController as! HomePageViewController).viewModel.pushViewController(bookDesc)
        }
    }
    
    func tableViewBooksInfoTableViewCellSetData(_ indexPath:IndexPath, cell:BooksInfoTableViewCell) {
        if indexPath.section == 1 {
            cell.cellSetData(model: self.newBook)
        }else{
            cell.cellSetData(model: self.hotBook)
        }
        cell.booksInfoTableViewCellClouse = { tag in
            let model:ServerBookModel!
            if indexPath.section == 1 {
                model = HomeRecommentModel.init(fromDictionary: self.newBook[tag] as! NSDictionary).tails.bookInfo
            }else{
                model = HomeRecommentModel.init(fromDictionary: self.hotBook[tag] as! NSDictionary).tails.bookInfo
            }
            if UserInfoModel.isLoggedIn() {
                let bookDesc = BookDescViewController()
                bookDesc.model = model
                let pageController = self.controller?.parent
                (pageController as! HomePageViewController).viewModel.pushViewController(bookDesc)
            }else{
                let loginView = LoginViewController()
                let pageController = self.controller?.parent
                (pageController as! HomePageViewController).viewModel.pushViewController(loginView)
            }
        }
    }
    
    func tableViewGloableInfoTextCellSetData(_ indexPath:IndexPath, cell:GloableInfoTextCell) {
        switch indexPath.section {
        case 1:
            cell.setCellData(text: "猜你喜欢", detailButtonTitle: "更多")
        default:
            cell.setCellData(text: "精品推荐", detailButtonTitle: "更多")
        }
    }
    
    //MARK: -NetWorking
    func requestBanner(){
        let url = "\(BaseUrl)\(HomeBanner)"
        let parameters = ["type":"1","bannerNum":"4"]
        BaseNetWorke.sharedInstance.getUrlWithString(url, parameters: parameters as AnyObject).observe { (resultDic) in
            print(resultDic)
            if (!resultDic.isCompleted){
                    let models = NSMutableArray.mj_keyValuesArray(withObjectArray: resultDic.value as! [Any])
                for model in models! {
                    self.bannerModel.add(BannerModel.init(fromDictionary: model as! NSDictionary))
                }
                (self.controller as! RecommendViewController).tableView.reloadData()
            }
        }
    }
    
    func requestRecommendBook(type:String){
         let url = "\(BaseUrl)\(HomeRecommnetList)"
         let parameters = ["type":type]
        BaseNetWorke.sharedInstance.getUrlWithString(url, parameters: parameters as AnyObject).observe { (resultDic) in
            print(resultDic)
            if (!resultDic.isCompleted){
                if type == "1" {
                    self.newBook = NSMutableArray.mj_keyValuesArray(withObjectArray: resultDic.value as! [Any])
                }else{
                     self.hotBook = NSMutableArray.mj_keyValuesArray(withObjectArray: resultDic.value as! [Any])
                }
                (self.controller as! RecommendViewController).tableView.reloadData()
            }
        }
    }
}

extension RecommendViewModel : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat
    {
        return 0.0001
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return SwifterSwift.screenWidth * 7 / 15
        default:
            switch indexPath.row {
            case 0:
                return 40
            default:
                if indexPath.section == 1 {
                    return CGFloat(((self.newBook.count / 3) + (self.newBook.count % 3 == 0 ? 0 : 1)) * 150)
                }else{
                    return CGFloat(((self.hotBook.count / 3) + (self.hotBook.count % 3 == 0 ? 0 : 1)) * 150)
                }
            }
        }
    }
}

extension RecommendViewModel : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return self.newBook.count / 3 + self.newBook.count % 3 == 0 ? 0 : 1 + 1
        default:
            return self.hotBook.count / 3 + self.hotBook.count % 3 == 0 ? 0 : 1 + 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: RecommendTableViewCell.description() , for: indexPath)
            self.tableViewRecommendTableViewCellSetData(indexPath,cell: cell as! RecommendTableViewCell)
            return cell
        default:
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: GloableInfoTextCell.description() , for: indexPath)
                self.tableViewGloableInfoTextCellSetData(indexPath,cell: cell as! GloableInfoTextCell)
                return cell
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: BooksInfoTableViewCell.description() , for: indexPath)
                    self.tableViewBooksInfoTableViewCellSetData(indexPath,cell: cell as! BooksInfoTableViewCell)
                return cell
            }
            
        }
    }
}
