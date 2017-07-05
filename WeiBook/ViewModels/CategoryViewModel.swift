//
//  CategoryViewModel.swift
//  WeiBook
//
//  Created by Zhang on 2017/6/29.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit

class CategoryViewModel: BaseViewModel {

    var cellTitles = [[["中国当代小说","中国近代小说"],["中国古典小说","四大名著"],["港澳台小说","外国小说"]],[["散文","诗歌词曲"],["中国文学","外国文学"],["散文","诗歌词曲"]],[["古代言情","叛逆成长"],["校园","都市"],["爱情","悬疑"]],[["MBA于公商管理","人力资源管理"],["管理信息系统","供应链管理"],["企业管理与培训","市场营销"]],[["编程语言与程序设计","专用软件"],["考试认证","计算机安全"],["移动互联","人工智能"]]]
    override init() {
        
    }
    
    func tableViewCategoryTableViewCellSetData(_ indexPath:IndexPath, cell:CategoryTableViewCell) {
        cell.cellSetData(titles: cellTitles[indexPath.section][indexPath.row], indexPath: indexPath)
        cell.categoryTableViewCellClouse = { tag, indexPath in
            let title = self.cellTitles[indexPath.section][indexPath.row][tag - 1]
            let bookListController = BookListViewController()
            bookListController.navigationItem.title = title
            let controller = self.controller?.parent as! HomePageViewController
            controller.viewModel.pushViewController(bookListController)
        }
    }
}

extension CategoryViewModel : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
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
extension CategoryViewModel : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return cellTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTitles[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.description() , for: indexPath)
        self.tableViewCategoryTableViewCellSetData(indexPath,cell: cell as! CategoryTableViewCell)
        return cell
    }
}

