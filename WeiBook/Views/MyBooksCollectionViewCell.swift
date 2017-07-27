//
//  MyBooksCollectionViewCell.swift
//  WeiBook
//
//  Created by Zhang on 2017/6/30.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit
import SDWebImage

enum BookStatusType {
    case Borrow //借出
    case Entertain //待还
    case Borrowed //已借
    case Done //待还
    case Give   //赠送
    case Receive //领受
    case None //领受
}



class MyBooksCollectionViewCell: UICollectionViewCell {
 
    var bookPost:UIImageView!
    var booksTitle:UILabel!
    var booksStatus:UILabel!
    
    var didMakeConstraints = false
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){
        bookPost = UIImageView.init()
        self.contentView.addSubview(bookPost)
        
        booksTitle = UILabel.init()
        booksTitle.textAlignment = .center
        booksTitle.text = "佰草乌"
        booksTitle.font = App_Theme_PinFan_R_14_Font
        booksTitle.textColor = UIColor.init(hexString: App_Theme_384249_Color)
        self.contentView.addSubview(booksTitle)
        
        
        booksStatus = UILabel.init()
        booksStatus.layer.cornerRadius = 5.0
        booksStatus.layer.masksToBounds = true
        booksStatus.textAlignment = .center
        booksStatus.font = App_Theme_PinFan_L_11_Font
        booksStatus.textColor = UIColor.init(hexString: App_Theme_FFFFFF_Color)
        self.contentView.addSubview(booksStatus)
        
        self.updateConstraints()
    }
    
    func cellSetData(model:MyBooksModel){
        self.changeBookStatus(status: model.borrowState)
        ImageViewManager.shareInstance.doubanDanDanImageViewTools(url: model.tails.bookInfo.bookImg, imageView: bookPost) { (image, error,url) in
            self.bookPost.image = image
        }

        booksTitle.text = model.tails.bookInfo.title
        self.updateConstraintsIfNeeded()
    }
    
    func changeBookStatus(status:Int) {
        switch status {
        case 1:
            booksStatus.isHidden = false
            booksStatus.text = ""
            booksStatus.backgroundColor = UIColor.init(hexString: App_Theme_594CA8_Color)
            
        case 2:
            booksStatus.isHidden = false
            booksStatus.text = "借出"
            booksStatus.backgroundColor = UIColor.init(hexString: App_Theme_594CA8_Color)
        case 3:
            booksStatus.isHidden = false
            booksStatus.text = "待还"
            booksStatus.backgroundColor = UIColor.init(hexString: App_Theme_594CA8_Color)
        case 4:
            booksStatus.isHidden = false
            booksStatus.text = "已还"
            booksStatus.backgroundColor = UIColor.init(hexString: App_Theme_594CA8_Color)
        default:
            booksStatus.isHidden = true
        }
    }
    
    override func updateConstraints() {
        if !didMakeConstraints {
            bookPost.snp.makeConstraints({ (make) in
                make.centerX.equalTo(self.contentView.snp.centerX).offset(0)
                make.top.equalTo(self.contentView.snp.top).offset(10)
                make.size.equalTo(imageSize(type: .CollectView))
            })
            
            booksTitle.snp.makeConstraints({ (make) in
                make.centerX.equalTo(self.contentView.snp.centerX).offset(0)
                make.top.equalTo(self.bookPost.snp.bottom).offset(5)
                make.width.equalTo(80)
            })
            
            booksStatus.snp.makeConstraints({ (make) in
                make.left.equalTo(self.bookPost.snp.right).offset(-15)
                make.top.equalTo(self.bookPost.snp.top).offset(-5)
                make.size.equalTo(CGSize.init(width: 30, height: 15))
            })
            
            didMakeConstraints = true
        }
        super.updateConstraints()
    }
    
}
