//
//  TopBooksTableViewCell.swift
//  WeiBook
//
//  Created by Zhang on 2017/6/30.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit
import SDWebImage

class TopBooksTableViewCell: UITableViewCell {

    var bookPost:UIImageView!
    var bookTitle:UILabel!
    var bookDesc:UILabel!
    
    var bookDynamicLabel:UILabel!
    
    var didMakeConstraints = false
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){
        bookPost = UIImageView.init()
        bookPost.sd_setImage(with: URL.init(string: "https://img3.doubanio.com/lpic/s29436963.jpg"), placeholderImage: nil, options: SDWebImageOptions.retryFailed) { (image, error, cacheType, url) in
            
        }
        self.contentView.addSubview(bookPost)
        
        bookTitle = UILabel.init()
        bookTitle.text = "杂草记"
        bookTitle.numberOfLines = 0
        bookTitle.font = App_Theme_PinFan_M_15_Font
        bookTitle.textColor = UIColor.init(hexString: App_Theme_384249_Color)
        self.contentView.addSubview(bookTitle)
        
        bookDesc = UILabel.init()
        bookDesc.text = "“只要认真观察，再不起眼、再无趣的植物都蕴蓄着生命的坚韧与美好。”\n展现一草一木的坚韧与智慧，\n探索微小生命的独特与不凡。\n120幅精美手绘插图，带你走进草的世界。\n人们总是习惯将不知道名字、长得也不够漂亮的草统统归为杂草。它们生长在田间、路边、河畔，因太过寻常而被熟视无睹。\n著名园艺家柳宗民却没有忘记这些不起眼的小草。他以专业的眼光去观察、去体悟，娓娓道来每一株普通杂草的独特与不凡。在他笔下，每一棵小草都有自己的美丽与功用，都蕴蓄着生命的坚韧与美好。它们或可食、可用、可赏玩、可入药，亦可默默无闻自在洒落。没有一种草，该被叫做“杂草”。\n正如《昆虫记》是科学诗人法布尔为自然界平凡子民书写的不朽篇章，《杂草记》亦将专业知识与人文关怀熔于一炉，是一部严谨翔实的自然笔记，亦是一曲洋溢着爱与尊重的生命礼赞。"
        bookDesc.numberOfLines = 0
        bookDesc.textColor = UIColor.init(hexString: App_Theme_DDE0E5_Color)
        bookDesc.font = App_Theme_PinFan_R_13_Font
        self.contentView.addSubview(bookDesc)
        
        bookDynamicLabel = UILabel.init()
        bookDynamicLabel.text = "藏书人数 100 评论人数 3000"
        bookDynamicLabel.textColor = UIColor.init(hexString: App_Theme_8A96A2_Color)
        bookDynamicLabel.font = App_Theme_PinFan_R_11_Font
        self.contentView.addSubview(bookDynamicLabel)
        
        self.updateConstraints()
    }
    
    func cellSetData(model:ServerBookModel){
        bookPost.sd_setImage(with: URL.init(string: model.bookImg), placeholderImage: nil, options: SDWebImageOptions.retryFailed) { (image, error, cacheType, url) in
            
        }
        bookTitle.text = model.title
        bookDesc.text = model.descriptionField
    }
    
    override func updateConstraints() {
        if !didMakeConstraints {
            
            bookPost.snp.makeConstraints({ (make) in
                make.centerY.equalTo(self.contentView.snp.centerY).offset(0)
                make.left.equalTo(self.contentView.snp.left).offset(15)
                make.size.equalTo(CGSize.init(width: 104, height: 144))
            })
            
            bookTitle.snp.makeConstraints({ (make) in
                make.top.equalTo(self.contentView.snp.top).offset(10)
                make.left.equalTo(self.bookPost.snp.right).offset(10)
                make.right.equalTo(self.contentView.snp.right).offset(-15)
            })
            
            bookDesc.snp.makeConstraints({ (make) in
                make.top.equalTo(self.bookTitle.snp.bottom).offset(1)
                make.left.equalTo(self.bookPost.snp.right).offset(10)
                make.bottom.lessThanOrEqualTo(self.contentView.snp.bottom).offset(-45)
                make.right.equalTo(self.contentView.snp.right).offset(-15)
            })
            
            
            bookDynamicLabel.snp.makeConstraints({ (make) in
                make.bottom.equalTo(self.contentView.snp.bottom).offset(-10)
                make.left.equalTo(self.bookPost.snp.right).offset(10)
                make.right.equalTo(self.contentView.snp.right).offset(-15)
            })
            
            didMakeConstraints = true
        }
        super.updateConstraints()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }


}
