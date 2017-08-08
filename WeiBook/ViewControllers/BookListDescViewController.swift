//
//  BookListDescViewController.swift
//  WeiBook
//
//  Created by Zhang on 08/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class BookListDescViewController: BaseViewController {

    var collectionModel:CollectionModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindViewModel(viewModel: BookListDescViewModel(), controller: self)
        self.setUpTableView(style: .plain, cells: [BookListDescInfoTableViewCell.self, BookInfoTableViewCell.self], controller: self)
        self.bindLogicViewModel()
        // Do any additional setup after loading the view.
    }
    
    func bindLogicViewModel(){
        (self.viewModel as! BookListDescViewModel).collectionModel = self.collectionModel
        (self.viewModel as! BookListDescViewModel).requestBookListDesc()
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
