//
//  CreateBookListViewModel.swift
//  WeiBook
//
//  Created by Zhang on 08/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class CreateBookListViewModel: BaseViewModel {

    var bookList = [ServerBookModel]()
    var form = BookListForm.init()
    var categoryModel:CategoryModel!
    var selectArray = NSMutableArray.init()
    
    override init() {
        super.init()
    }
    
    func rightBarItemPress(){
        self.createBookList()
    }
    
    //MARK: TableViewCellSetData
    func tableViewGloableTextFieldCellSetData(_ indexPath:IndexPath, cell:GloableTextFieldCell) {
        cell.textField.reactive.continuousTextValues.observeValues { (str) in
            self.form.listName = str
        }
        cell.textFieldSetplaceholderText(placeholder: "书单标题")
    }
    
    func tableViewGloableTextViewCellSetData(_ indexPath:IndexPath, cell:GloableTextViewCell) {
        cell.textView.reactive.continuousTextValues.observeValues { (str) in
            self.form.descriptionStr = str
        }
        cell.textViewSetplaceholderText(placeholder: "书单简介")
    }
    
    func tableViewGloableLableDetailLabelImageCellSetData(_ indexPath:IndexPath, cell:GloableLableDetailLabelImageCell) {
        cell.setCellData(text: indexPath.row == 2 ? "添加图书" : "书单分类", detailText: nil)
    }
    
    func tableViewBookInfoTableViewCellSetData(_ indexPath:IndexPath, cell:BookInfoTableViewCell) {
        cell.cellSetData(model: bookList.item(at: indexPath.row)!)
    }
    
    func tableViewDidSelect(_ indexPath:IndexPath) {
        if indexPath.section == 0 && indexPath.row == 2 {
            let toControllerVC = BooksViewController()
            toControllerVC.createBookList = true
            toControllerVC.viewModle.bookSelectClouse = { model in
                self.bookList.append(model.tails.bookInfo)
                self.controller?.tableView.reloadData()
            }
            NavigationPushView(self.controller!, toConroller: toControllerVC)
        }else if indexPath.section == 0 && indexPath.row == 3 {
            let toController = CategoryListViewController()
            if selectArray.count != 0 {
                (toController.viewModel as! CategoryListViewModel).selectArray = self.selectArray
            }
            toController.cateGotyListClouse = { selectArray, content, categoryId in
                let cell = self.controller?.tableView.cellForRow(at: IndexPath.init(row: 3, section: 0)) as! GloableLableDetailLabelImageCell
                cell.setCellData(text: "书单分类", detailText: content)
                self.form.categoryId = categoryId
                self.selectArray = selectArray
            }
            NavigationPushView(self.controller!, toConroller: toController)
        }
    }
    
    //MARK: NetWorkRequest
    func createBookList(){
        let url = "\(BaseUrl)\(CreateBookList)"
        self.form.userId = UserInfoModel.shareInstance().tails.userInfo.userId
        if bookList.count > 0 {
            var bookStr = ""
            for book in bookList {
                bookStr = bookStr.appending("\((book.id)!),")
            }
            self.form.addBooks = bookStr
            let categoryId = self.form.categoryId.substringStr(index: 1)
            let addBooks = self.form.addBooks.substringStr(index: 1)
            let parameters = ["userId":self.form.userId,
                              "listName":self.form.listName,
                              "description":self.form.descriptionStr,
                              "addBooks":addBooks,
                              "categoryId":categoryId,
            "bookRecs":"eee"] as [String : Any]
            BaseNetWorke.sharedInstance.postUrlWithString(url, parameters: parameters as AnyObject).observe { (resultDic) in
                if !resultDic.isCompleted {
                    _ = Tools.shareInstance.showMessage((self.controller?.view)!, msg: "创建书单成功", autoHidder: true)
                    self.controller?.pop(animated: true)
                }
            }
        }else{
            _ = Tools.shareInstance.showMessage((self.controller?.view)!, msg: "请添加图书", autoHidder: true)
        }
        
    }
    
    
}

//MARK: -UITableViewDelegate&DataSource
extension CreateBookListViewModel : UITableViewDelegate {
    
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
                return 50
            case 1:
                return 100
            default:
                return 50
            }
        default:
            return 92
        }
    }
}
extension CreateBookListViewModel : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 4
        default:
            return self.bookList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: GloableTextFieldCell .description() , for: indexPath)
                self.tableViewGloableTextFieldCellSetData(indexPath, cell: cell as! GloableTextFieldCell)
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: GloableTextViewCell .description() , for: indexPath)
                self.tableViewGloableTextViewCellSetData(indexPath, cell: cell as! GloableTextViewCell)
                return cell
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: GloableLableDetailLabelImageCell .description() , for: indexPath)
                if indexPath.row == 3 {
                    cell.accessoryType = .disclosureIndicator
                }
                self.tableViewGloableLableDetailLabelImageCellSetData(indexPath, cell: cell as! GloableLableDetailLabelImageCell)
                return cell
            }
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: BookInfoTableViewCell .description() , for: indexPath)
            self.tableViewBookInfoTableViewCellSetData(indexPath, cell: cell as! BookInfoTableViewCell)
            return cell
        }
    }
}
