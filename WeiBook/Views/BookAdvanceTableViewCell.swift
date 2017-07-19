//
//  BookAdvanceTableViewCell.swift
//  WeiBook
//
//  Created by Zhang on 2017/7/3.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit
import SwifterSwift

class BookAdvanceTableViewCell: UITableViewCell {

    var titleLable:UILabel!
    var descLabel:UILabel!
    
    var linLabel:GloabLineView!
    var didMakeConstraints = false
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){
        titleLable = UILabel.init()
        titleLable.text = "简介"
        titleLable.font = App_Theme_PinFan_M_18_Font
        titleLable.textColor = UIColor.init(hexString: App_Theme_384249_Color)
        self.contentView.addSubview(titleLable)
        
        descLabel = UILabel.init()
        descLabel.font = App_Theme_PinFan_R_15_Font
        descLabel.textAlignment = .left
        descLabel.numberOfLines = 0
        descLabel.textColor = UIColor.init(hexString: App_Theme_556169_Color)
        
        linLabel = GloabLineView.init(frame: CGRect.init(x: 0, y: 0, width: SwifterSwift.screenWidth, height: 0.5))
        self.contentView.addSubview(linLabel)
        
        self.contentView.addSubview(descLabel)
    }
    
    func cellSetData(model:SBNBookModel){
        descLabel.text = model.summary
    }
    
    override func updateConstraints() {
        if !didMakeConstraints{
            titleLable.snp.makeConstraints({ (make) in
                make.top.equalTo(self.contentView.snp.top).offset(20)
                make.left.equalTo(self.contentView.snp.left).offset(15)
                make.right.equalTo(self.contentView.snp.right).offset(-20)
            })
            descLabel.snp.makeConstraints({ (make) in
                make.top.equalTo(self.titleLable.snp.bottom).offset(10)
                make.left.equalTo(self.contentView.snp.left).offset(15)
                make.right.equalTo(self.contentView.snp.right).offset(-20)
                make.bottom.equalTo(self.contentView.snp.bottom).offset(-20)
            })
            
            linLabel.snp.makeConstraints({ (make) in
                make.bottom.equalTo(self.contentView.snp.bottom).offset(-0.5)
                make.left.equalTo(self.contentView.snp.left).offset(0)
                make.right.equalTo(self.contentView.snp.right).offset(0)
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
