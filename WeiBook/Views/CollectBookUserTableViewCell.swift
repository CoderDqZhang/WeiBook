//
//  CollectBookUserTableViewCell.swift
//  WeiBook
//
//  Created by Zhang on 05/09/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit
import SwifterSwift

class CollectBookUserTableViewCell: UITableViewCell {

    var titleLable:UILabel!
    var descLabel:UILabel!
    
    var linLabel:GloabLineView!
    
    var didMakeConstraints = false
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpView()
    }
    
    func setUpView(){
        titleLable = UILabel.init()
        titleLable.text = "藏书用户"
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
        
        self.updateConstraints()
    }
    
    
    func cellSetData(users:[UserInfoSwiftModel]){
        if users.count > 0 {
            for i in 0...users.count - 1 {
                let frame = CGRect.init(x: i * 35 + 15, y: 60, width: 30, height: 30)
                let imageView = UIImageView.init()
                imageView.layer.masksToBounds = true
                imageView.layer.cornerRadius = 15
                imageView.frame = frame
                ImageViewManager.shareInstance.sd_imageView(url: users[i].tails.userInfo.photo, imageView: imageView, completedBlock: { (image, error, cacheType, url) in
                    
                })
                self.contentView.addSubview(imageView)
            }
        }
        self.updateConstraintsIfNeeded()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        if !didMakeConstraints {
            titleLable.snp.makeConstraints({ (make) in
                make.top.equalTo(self.contentView.snp.top).offset(20)
                make.left.equalTo(self.contentView.snp.left).offset(15)
                make.right.equalTo(self.contentView.snp.right).offset(-20)
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
