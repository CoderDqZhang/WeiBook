//
//  BooksViewModel.swift
//  WeiBook
//
//  Created by Zhang on 2017/6/30.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit
import SwifterSwift

typealias BookSelectClouse = (_ model:MyBooksModel) ->Void

class BooksViewModel: BaseViewModel {

    var myBooksModel = NSMutableArray()
    var createComment:Bool!
    var bookSelectClouse:BookSelectClouse!
    var createBookList:Bool!
    var bookController:BooksViewController!
    
    override init() {
        super.init()
    }
    
    func rightBarItemPress(){
        self.requestCollectUser()
    }
    
    func rightBarItemFilter(){
        
    }
    
    //MARK: CollectViewDidSelect
    func collectDidSelect(_ indexPath:IndexPath) {
        
        if self.createBookList{
            if self.bookSelectClouse != nil {
                self.bookSelectClouse(MyBooksModel.init(fromDictionary: myBooksModel[indexPath.row]  as! NSDictionary))
                self.controller?.pop(animated: true)
                
            }
        }
        
        if self.createComment {
            if self.bookSelectClouse != nil {
                self.bookSelectClouse(MyBooksModel.init(fromDictionary: myBooksModel[indexPath.row]  as! NSDictionary))
                self.controller?.pop(animated: true)
                return
            }
        }
        if !self.createComment && !self.createBookList {
            let bookDesc = BookDescViewController()
            bookDesc.myBookModel = MyBooksModel.init(fromDictionary: myBooksModel[indexPath.row]  as! NSDictionary)
            bookDesc.otherBookDesc = (self.controller as! BooksViewController).otherBooks
            NavigationPushView(self.controller!, toConroller: bookDesc)
            return
        }
    }
    
    //MARK: CollectViewCell
    func collectViewMyBooksCollectionViewCellSetData(_ indexPath:IndexPath, cell:MyBooksCollectionViewCell) {
        cell.cellSetData(model:MyBooksModel.init(fromDictionary: myBooksModel[indexPath.row] as! NSDictionary))
    }
    
    //MARK: -RequestNetWorking
    func requestMyBooks(uid:String){
        let url = "\(BaseUrl)\(MyBookList)"
        let parameters = ["userId":uid]
        BaseNetWorke.sharedInstance.getUrlWithString(url, parameters: parameters as AnyObject).observe { (resulDic) in
            if !resulDic.isCompleted {
                self.myBooksModel = NSMutableArray.mj_keyValuesArray(withObjectArray: resulDic.value as! [Any])
                (self.controller as! BooksViewController).collectView.reloadData()
            }
        }
    }
    
    func requestCollectUser(){
        let url = "\(BaseUrl)\(AttentionUpdate)"
        let parameters = ["attentionType":"2",
                          "objectId":self.bookController.otherUserModel.tails.userInfo.userId,
                          "userId":UserInfoModel.shareInstance().tails.userInfo.userId,
                          "attentionAtion":"attention"]
        BaseNetWorke.sharedInstance.getUrlWithString(url, parameters: parameters as AnyObject).observe { (resultDic) in
            if !resultDic.isCompleted {
                
            }
        }
    }
    
}

extension BooksViewModel : UICollectionViewDelegate {
   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.collectDidSelect(indexPath)
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
        return CGSize.init(width: (SwifterSwift.screenWidth - 10) / 3, height: imageSize(type: .CollectView).height + 40)
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
