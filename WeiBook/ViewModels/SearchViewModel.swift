//
//  SearchViewModel.swift
//  WeiBook
//
//  Created by Zhang on 2017/6/29.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit

class SearchViewModel: BaseViewModel {

    var searchModels = NSMutableArray.init()
    override init() {
        super.init()
    }
    
    //MARK : CellSetData
    func tableViewTopBooksTableViewCellSetData(_ indexPath:IndexPath, cell:TopBooksTableViewCell) {
        cell.cellSetData(model: ServerBookModel.init(fromDictionary: self.searchModels[indexPath.row] as! NSDictionary))
    }
    
    //MARK : RequestNetWorking
    func requestSearchUrl(serchKey:String){
        let url = "\(BaseUrl)\(SearchBook)"
        let parameters = ["searchKey":serchKey,
                          "type":"2",
                          "curPage":"1"]
        BaseNetWorke.sharedInstance.getUrlWithString(url, parameters: parameters as AnyObject).observe { (resultDic) in
            if !resultDic.isCompleted {
                self.searchModels = NSMutableArray.mj_keyValuesArray(withObjectArray: (resultDic.value as! NSDictionary).object(forKey: "books") as! [Any])
                self.controller?.tableView.reloadData()
            }
        }
    }
}

extension SearchViewModel : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let bookDescViewController = BookDescViewController()
        let controller = (self.controller as! SearchViewController).toController!
        (controller.viewModel as! HomeViewModel).pushViewController(controller: bookDescViewController)
        self.controller?.dismiss(animated: true, completion: {
        })
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0001
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0001
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SCREENWIDTH / 4 * 24 / 17 + 20
    }
}

extension SearchViewModel : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TopBooksTableViewCell.description() , for: indexPath)
        self.tableViewTopBooksTableViewCellSetData(indexPath,cell: cell as! TopBooksTableViewCell)
        return cell
        
    }
}


