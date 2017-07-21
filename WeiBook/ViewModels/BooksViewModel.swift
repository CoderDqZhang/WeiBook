//
//  BooksViewModel.swift
//  WeiBook
//
//  Created by Zhang on 2017/6/30.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit
import SwifterSwift

class BooksViewModel: BaseViewModel {

    var myBooksModel = NSMutableArray()
    override init() {
        super.init()
        self.requestMyBooks()
    }
    
    func collectViewMyBooksCollectionViewCellSetData(_ indexPath:IndexPath, cell:MyBooksCollectionViewCell) {
        var status:BookStatusType!
        if indexPath.row % 3 == 0 {
            status = .Borrow
        }else if indexPath.row % 4 == 0 {
            status = .Give
        }else if indexPath.row % 5 == 3 {
            status = .Entertain
        }else if indexPath.row % 7 == 4 {
            status = .Receive
        }else{
            status = .None
        }
        cell.cellSetData(status: status, model:MyBooksModel.init(fromDictionary: myBooksModel[indexPath.row] as! NSDictionary))
    }
    
    //MARK: -RequestNetWorking
    func requestMyBooks(){
        let url = "\(BaseUrl)\(MyBookList)"
        let parameters = ["userId":UserInfoModel.shareInstance().tails.userInfo.userId]
        BaseNetWorke.sharedInstance.getUrlWithString(url, parameters: parameters as AnyObject).observe { (resulDic) in
            if !resulDic.isCompleted {
                self.myBooksModel = NSMutableArray.mj_keyValuesArray(withObjectArray: resulDic.value as! [Any])
                (self.controller as! BooksViewController).collectView.reloadData()
            }
        }
    }
}

extension BooksViewModel : UICollectionViewDelegate {
   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        NavigationPushView(self.controller!, toConroller: BookDescViewController())
    }
}

extension BooksViewModel : UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.myBooksModel.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    @available(iOS 6.0, *)
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: MyBooksCollectionViewCell.description(), for: indexPath)
        self.collectViewMyBooksCollectionViewCellSetData(indexPath, cell: collectViewCell as! MyBooksCollectionViewCell)
        return collectViewCell
    }
}

extension BooksViewModel : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize.init(width: (SwifterSwift.screenWidth - 10) / 3, height: BookLargerSize.height + 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize
    {
        return CGSize.init(width: 0.0001, height: 0.0001)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize.init(width: 0.001, height: 0.001)
    }
}
