//
//  BookInfoTableViewCell.swift
//  WeiBook
//
//  Created by Zhang on 2017/7/4.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit

class BookInfoTableViewCell: UITableViewCell {
    
    var bookPost:UIImageView!
    var bookTitle:UILabel!
    var bookDesc:UILabel!
    var commentNumber:UILabel!
    var collectNumber:UILabel!
    
    var didMakeConstraints = false
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpView()
    }
    
    func setUpView(){
        
        bookPost = UIImageView.init()
        bookPost.sd_setImage(with: URL.init(string: "https://img1.doubanio.com/lpic/s29487688.jpg"), placeholderImage: nil, options: .retryFailed, progress: { (start, end, url) in
            
        }) { (image, error, cacheType, url) in
            
        }
        self.contentView.addSubview(self.bookPost)
        
        bookTitle = UILabel.init()
        bookTitle.text = "汽车理论"
        bookTitle.numberOfLines = 1
        bookTitle.font = App_Theme_PinFan_R_15_Font
        bookTitle.textColor = UIColor.init(hexString: App_Theme_384249_Color)
        self.contentView.addSubview(self.bookTitle)
        
        bookDesc = UILabel.init()
        bookDesc.text = "《汽车理论(第5版)》为全国高等学校机电类专业教学指导委员会汽车与拖拉机专业小组制订的规划教材，并于“九五”期间被教育部立项为“普通高等教育‘九五’部级重点教材”和“面向21世纪课程教材”，于“十五”期间被教育部立项为“普通高等教育‘十五’国家级规划教材”。 《汽车理论(第5版)》根据作用于汽车上的外力特性，分析了与汽车动力学有关的汽车各主要使用性能：动力性、燃油经济性、制动性、操纵稳定性、行驶平顺性及通过性。各章分别介绍了各使用性能的评价指标与评价方法，建立了有关的动力学方程，分析了汽车及其部件的结构形式与结构参数对各使用性能的影响，阐述了进行性能预测的基本计算方法。各章还对性能试验方法作了简要介绍。另外，还介绍了近年来高效节能汽车技术方面的新发展。《汽车理论(第5版)》为学生提供了进行汽车设计、试验及使用所必需的专业基础知识。"
        bookDesc.numberOfLines = 0
        bookDesc.font = App_Theme_PinFan_R_13_Font
        bookDesc.textColor = UIColor.init(hexString: App_Theme_8A96A2_Color)
        self.contentView.addSubview(self.bookDesc)
        
        commentNumber = UILabel.init()
        commentNumber.text = "评论人数 1000"
        commentNumber.numberOfLines = 1
        commentNumber.font = App_Theme_PinFan_L_12_Font
        commentNumber.textColor = UIColor.init(hexString: App_Theme_DDE0E5_Color)
        self.contentView.addSubview(self.commentNumber)
        
        collectNumber = UILabel.init()
        collectNumber.text = "收藏人数 235"
        collectNumber.numberOfLines = 1
        collectNumber.font = App_Theme_PinFan_L_12_Font
        collectNumber.textColor = UIColor.init(hexString: App_Theme_DDE0E5_Color)
        self.contentView.addSubview(self.collectNumber)
        
        self.updateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func updateConstraints() {
        if !didMakeConstraints {
            didMakeConstraints = true
            
            bookPost.snp.makeConstraints({ (make) in
                make.top.equalTo(self.contentView.snp.top).offset(5)
                make.left.equalTo(self.contentView.snp.left).offset(15)
                make.size.equalTo(BookLargerMidSize)
            })
            
            bookTitle.snp.makeConstraints({ (make) in
                make.top.equalTo(self.contentView.snp.top).offset(5)
                make.left.equalTo(self.bookPost.snp.right).offset(10)
                make.right.equalTo(self.contentView.snp.right).offset(-15)
            })
            
            bookDesc.snp.makeConstraints({ (make) in
                make.top.equalTo(self.bookTitle.snp.bottom).offset(0)
                make.left.equalTo(self.bookPost.snp.right).offset(10)
                make.right.equalTo(self.contentView.snp.right).offset(-15)
                make.height.lessThanOrEqualTo(40)
            })
            
            commentNumber.snp.makeConstraints({ (make) in
                make.bottom.equalTo(self.contentView.snp.bottom).offset(-5)
                make.left.equalTo(self.bookPost.snp.right).offset(10)
            })
            
            collectNumber.snp.makeConstraints({ (make) in
                make.bottom.equalTo(self.contentView.snp.bottom).offset(-5)
                make.left.equalTo(self.commentNumber.snp.right).offset(10)
            })
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
