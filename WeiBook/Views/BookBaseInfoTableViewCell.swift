//
//  BookBaseInfoTableViewCell.swift
//  WeiBook
//
//  Created by Zhang on 2017/7/3.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit
import Cosmos
import SDWebImage

class BookBaseInfoTableViewCell: UITableViewCell {

    var bookImage:UIImageView!
    var ratingView:CosmosView!
    var bookTitle:UILabel!
    var bookSubTitle:UILabel!
    var bookAutho:UILabel!
    var bookPublisher:UILabel!
    var bookPages:UILabel!
    var bookBinding:UILabel!
    var bookPubdate:UILabel!
    var ratingNumber:UILabel!
    var bookTranslator:UILabel!
    
    var didMakeConstraints = false

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){
        bookImage = UIImageView.init()
        self.contentView.addSubview(bookImage)
        
        bookTitle = UILabel.init()
        bookTitle.textAlignment = .left
        bookTitle.font = App_Theme_PinFan_M_18_Font
        bookTitle.textColor = UIColor.init(hexString: App_Theme_384249_Color)
        self.contentView.addSubview(bookTitle)
        
        bookSubTitle = UILabel.init()
        bookSubTitle.textAlignment = .left
        bookSubTitle.font = App_Theme_PinFan_R_14_Font
        bookSubTitle.textColor = UIColor.init(hexString: App_Theme_556169_Color)
        self.contentView.addSubview(bookSubTitle)
        
        bookAutho = UILabel.init()
        bookAutho.textAlignment = .left
        bookAutho.font = App_Theme_PinFan_L_12_Font
        bookAutho.textColor = UIColor.init(hexString: App_Theme_8A96A2_Color)
        self.contentView.addSubview(bookAutho)
        
        bookTranslator  = UILabel.init()
        bookTranslator.textAlignment = .left
        bookTranslator.font = App_Theme_PinFan_L_12_Font
        bookTranslator.textColor = UIColor.init(hexString: App_Theme_8A96A2_Color)
        self.contentView.addSubview(bookTranslator)
        
        bookPublisher = UILabel.init()
        bookPublisher.textAlignment = .left
        bookPublisher.font = App_Theme_PinFan_L_12_Font
        bookPublisher.textColor = UIColor.init(hexString: App_Theme_8A96A2_Color)
        self.contentView.addSubview(bookPublisher)
        
        bookPages = UILabel.init()
        bookPages.textAlignment = .left
        bookPages.font = App_Theme_PinFan_L_12_Font
        bookPages.textColor = UIColor.init(hexString: App_Theme_8A96A2_Color)
        self.contentView.addSubview(bookPages)
        
        bookBinding = UILabel.init()
        bookBinding.textAlignment = .left
        bookBinding.font = App_Theme_PinFan_L_12_Font
        bookBinding.textColor = UIColor.init(hexString: App_Theme_8A96A2_Color)
        self.contentView.addSubview(bookBinding)
        
        ratingNumber = UILabel.init()
        ratingNumber.textAlignment = .left
        ratingNumber.font = App_Theme_PinFan_L_12_Font
        ratingNumber.textColor = UIColor.init(hexString: App_Theme_8A96A2_Color)
        self.contentView.addSubview(ratingNumber)
        
        bookPubdate = UILabel.init()
        bookPubdate.textAlignment = .left
        bookPubdate.font = App_Theme_PinFan_L_12_Font
        bookPubdate.textColor = UIColor.init(hexString: App_Theme_8A96A2_Color)
        self.contentView.addSubview(bookPubdate)
        
        self.setRatingView()
        self.updateConstraints()
        
    }
    
    func setRatingView(){
        ratingView = CosmosView.init()
        ratingView.settings.starSize = 14
        ratingView.settings.starMargin = 3
        ratingView.settings.filledColor = UIColor.init(hexString: App_Theme_594CA8_Color)
        ratingView.settings.filledBorderColor = UIColor.init(hexString: App_Theme_594CA8_Color)
        ratingView.settings.emptyBorderColor = UIColor.init(hexString: App_Theme_DDE0E5_Color)
        ratingView.settings.textColor = UIColor.init(hexString: App_Theme_8A96A2_Color)
        ratingView.settings.textFont = App_Theme_PinFan_L_12_Font!
        self.contentView.addSubview(ratingView)
    }
    
    func cellSetData(model:SBNBookModel){
        ImageViewManager.shareInstance.doubanDanDanImageViewTools(url: model.images.large, imageView: bookImage) { (image, error, url) in
            
        }
        bookTitle.text = model.title
        var author = ""
        for str in model.author {
            author = "\(author) \(str)"
        }
        bookAutho.text = author.substring(from: author.index(author.startIndex, offsetBy: 1))
        bookTitle.text = model.title
        if model.translator.count > 0 {
            var translator = ""
            for str in model.translator {
                translator = "\(translator) \(str)"
            }
            bookTranslator.text = "\(translator.substring(from: translator.index(translator.startIndex, offsetBy: 1)))(译)"
        }
        bookPublisher.text = "\((model.publisher)!) \\ "
        bookPages.text = model.pages == "" ? "" :"\((model.pages)!) 页"
        bookPubdate.text = model.pubdate
        bookBinding.text = "\((model.binding)!) \\ "
        bookSubTitle.text = model.subtitle == "" ? "" : model.subtitle
        ratingView.text = model.rating.average
        ratingView.rating = Double(model.rating.average)!
        ratingNumber.text = "(\((model.rating.numRaters)!)人评价)"
        self.updateConstraintsIfNeeded()
    }
    
    func cellSetDataSnbModel(model:ServerBookModel) {
        ImageViewManager.shareInstance.doubanDanDanImageViewTools(url: model.bookImg, imageView: bookImage) { (image, error, url) in
            
        }
        
        bookTitle.text = model.title
        bookAutho.text = model.author
        bookTitle.text = model.title
        
        bookPublisher.text = model.oress
        if model.rating as? String != nil {
            ratingView.text = model.rating as? String
            let str = (model.rating as? String)?.replacingOccurrences(of: " ", with: "")
            ratingView.rating = Double(str!)!
        }else{
            ratingView.text = "10.0"
            ratingView.rating = 10.0
        }
        self.updateConstraintsIfNeeded()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    override func updateConstraints() {
        if !didMakeConstraints {
            bookImage.snp.makeConstraints({ (make) in
                make.top.equalTo(self.contentView.snp.top).offset(10)
                make.left.equalTo(self.contentView.snp.left).offset(10)
                make.size.equalTo(BookLargerSize)
            })
            bookTitle.snp.makeConstraints({ (make) in
                make.top.equalTo(self.contentView.snp.top).offset(10)
                make.left.equalTo(self.bookImage.snp.right).offset(10)
                make.right.equalTo(self.contentView.snp.right).offset(-10)
            })
            
            bookSubTitle.snp.makeConstraints({ (make) in
                make.top.equalTo(self.bookTitle.snp.bottom).offset(5)
                make.left.equalTo(self.bookImage.snp.right).offset(10)
                make.right.equalTo(self.contentView.snp.right).offset(-10)
            })
            
            ratingView.snp.makeConstraints({ (make) in
                make.top.equalTo(self.bookSubTitle.snp.bottom).offset(5)
                make.left.equalTo(self.bookImage.snp.right).offset(10)
            })
            
            ratingNumber.snp.makeConstraints({ (make) in
                make.top.equalTo(self.bookSubTitle.snp.bottom).offset(5)
                make.left.equalTo(self.ratingView.snp.right).offset(10)
//                make.right.equalTo(self.contentView.snp.right).offset(-10)
            })
            
            bookAutho.snp.makeConstraints({ (make) in
                make.top.equalTo(self.ratingView.snp.bottom).offset(15)
                make.left.equalTo(self.bookImage.snp.right).offset(10)
            })
            
            bookTranslator.snp.makeConstraints({ (make) in
                make.top.equalTo(self.ratingView.snp.bottom).offset(15)
                make.left.equalTo(self.bookAutho.snp.right).offset(4)
            })
            
            bookPublisher.snp.makeConstraints({ (make) in
                make.top.equalTo(self.bookAutho.snp.bottom).offset(1)
                make.left.equalTo(self.bookImage.snp.right).offset(10)
            })
            
            bookPubdate.snp.makeConstraints({ (make) in
                make.top.equalTo(self.bookAutho.snp.bottom).offset(1)
                make.left.equalTo(self.bookPublisher.snp.right).offset(0)
            })
            
            bookBinding.snp.makeConstraints({ (make) in
                make.top.equalTo(self.bookPublisher.snp.bottom).offset(1)
                make.left.equalTo(self.bookImage.snp.right).offset(10)
            })
            
            bookPages.snp.makeConstraints({ (make) in
                make.top.equalTo(self.bookPublisher.snp.bottom).offset(1)
                make.left.equalTo(self.bookBinding.snp.right).offset(0)
            })
            
            didMakeConstraints = true
        }
        super.updateConstraints()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
