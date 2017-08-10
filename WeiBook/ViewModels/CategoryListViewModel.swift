//
//  CategoryListViewModel.swift
//  WeiBook
//
//  Created by Zhang on 09/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit


class CategoryListViewModel: BaseViewModel {

    var models = NSMutableArray.init()
    var selectArray = NSMutableArray.init()
    var categoryContent:String!
    override init() {
        super.init()
        self.createBookCategory()
    }
    
    func rightBarItemPress() {
        var content = ""
        var categoryId = ""
        for i in 0...self.models.count - 1 {
            if selectArray[i] as! Bool == true {
                let model = CategoryModel.init(fromDictionary: models[i] as! NSDictionary)
                content = content.appending("\((model.dictName)!),")
                categoryId = categoryId.appending("\((model.id)!),")
            }
        }
        if (self.controller as! CategoryListViewController).cateGotyListClouse != nil {
            (self.controller as! CategoryListViewController).cateGotyListClouse(selectArray,content,categoryId)
            self.controller?.navigationController?.popViewController()
        }
    }
    
    //MARK: CellSetData
    func tableViewGloableImageLableDetailImageCellSetData(_ indexPath:IndexPath, cell:GloableImageLableDetailImageCell) {
        cell.cellSetData(image: nil, lableStr: CategoryModel.init(fromDictionary: models[indexPath.row] as! NSDictionary).dictName, detailStr: nil)
        if selectArray[indexPath.row] as! Bool == false {
            cell.accessoryType = .none
        }else{
            cell.accessoryType = .checkmark
        }
    }
    
    //MARK: NetReqest
    func createBookCategory(){
        let url = "\(BaseUrl)\(BookListCategory)"
        BaseNetWorke.sharedInstance.getUrlWithString(url, parameters: nil).observe { (resultDic) in
            if !resultDic.isCompleted {
                self.models = NSMutableArray.mj_objectArray(withKeyValuesArray: resultDic.value)
                for _ in self.models {
                    self.selectArray.add(false)
                }
                self.controller?.tableView.reloadData()
            }
        }
    }
}

//MARK: TableViewDelegate&DataSource

extension CategoryListViewModel : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 0 {
            let cell = tableView.cellForRow(at: indexPath)
            if (cell?.accessoryType == .checkmark) {
                cell?.accessoryType = .none
                self.selectArray.replaceObject(at: indexPath.row, with: false)
            }else{
                cell?.accessoryType = .checkmark
                self.selectArray.replaceObject(at: indexPath.row, with: true)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.00001
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0001
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
extension CategoryListViewModel : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GloableImageLableDetailImageCell.description() , for: indexPath)
        self.tableViewGloableImageLableDetailImageCellSetData(indexPath,cell: cell as! GloableImageLableDetailImageCell)
        
        return cell
    }
}

