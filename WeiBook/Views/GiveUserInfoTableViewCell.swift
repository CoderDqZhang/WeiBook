//
//  GiveUserInfoTableViewCell.swift
//  WeiBook
//
//  Created by Zhang on 2017/7/6.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit
import SwifterSwift

enum GiveBookStatus {
    case GiveIn
    case GiveOut
}

class GiveUserInfoTableViewCell: UITableViewCell {

    var userPhoto:UIImageView!
    var userName:UILabel!
    var startTime:UILabel!
    var endTime:UILabel!
    
    var statusButton:UIButton!
    
    var lineLabel:GloabLineView!
    
    var didMakeConstraints = false
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpView()
    }
    
    func setUpView(){
        userPhoto = UIImageView.init()
        userPhoto.sd_setImage(with: URL.init(string: "http://7xsatk.com1.z0.glb.clouddn.com/c0e4c08b1dd123bbe5ab61d116f55943.png?imageMogr/v2/format/png/thumbnail/750x750"), placeholderImage: nil, options: .retryFailed) { (image, error, cacheType, url) in
            
        }
        
        self.contentView.addSubview(userPhoto)
        
        userName = UILabel.init()
        userName.text = "一元钱的价值"
        userName.font = App_Theme_PinFan_R_14_Font
        userName.textColor = UIColor.init(hexString: App_Theme_384249_Color)
        self.contentView.addSubview(userName)
        
        startTime = UILabel.init()
        startTime.text = "2017-07-10"
        startTime.font = App_Theme_PinFan_R_15_Font
        startTime.textColor = UIColor.init(hexString: App_Theme_EE5028_Color)
        self.contentView.addSubview(startTime)
        
        statusButton = UIButton.init(type:.custom)
        statusButton.layer.cornerRadius = 3.0
        statusButton.layer.borderWidth = 1.0
        statusButton.titleLabel?.font = App_Theme_PinFan_R_13_Font
        self.contentView.addSubview(statusButton)
        
        lineLabel = GloabLineView.init(frame: CGRect.init(x: 0, y: 59.5, width: SwifterSwift.screenWidth, height: 0.5))
        self.contentView.addSubview(lineLabel)
        
        self.updateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func cellSetData(model:GiveBookModel){
        if model.useUserId != UserInfoModel.shareInstance().tails.userInfo.userId {
            self.updataStatusButton(status: model.isAccept)
        }else{
            self.updataStatusButton(status: 3)
        }
        ImageViewManager.shareInstance.sd_imageView(url: model.tails.userInfo.tails.userInfo.photo, imageView: userPhoto) { (image, error, cacheType, url) in
            self.userPhoto.image = image
        }
        userName.text = model.tails.userInfo.username
        startTime.text = Date.init(unixTimestamp: Double(model.giveEnd) / 1000).dateString()
    }
    
    func updataStatusButton(status:Int){
        switch status {
        case 3:
            statusButton.setTitle("领受", for: .normal)
            statusButton.setTitleColor(UIColor.init(hexString: App_Theme_EE5028_Color), for: .normal)
            statusButton.layer.borderColor = UIColor.init(hexString: App_Theme_EE5028_Color).cgColor
        default:
            statusButton.setTitle("赠送", for: .normal)
            statusButton.setTitleColor(UIColor.init(hexString: App_Theme_594CA8_Color), for: .normal)
            statusButton.layer.borderColor = UIColor.init(hexString: App_Theme_594CA8_Color).cgColor
        }
    }
    
    override func updateConstraints() {
        if !didMakeConstraints {
            userPhoto.snp.makeConstraints({ (make) in
                make.left.equalTo(self.contentView.snp.left).offset(15)
                make.top.equalTo(self.contentView.snp.top).offset(10)
                make.size.equalTo(CGSize.init(width: 40, height: 40))
            })
            
            userName.snp.makeConstraints({ (make) in
                make.left.equalTo(self.userPhoto.snp.right).offset(5)
                make.top.equalTo(self.contentView.snp.top).offset(10)
            })
            
            startTime.snp.makeConstraints({ (make) in
                make.left.equalTo(self.userPhoto.snp.right).offset(5)
                make.top.equalTo(self.userName.snp.bottom).offset(5)
            })
            
            statusButton.snp.makeConstraints({ (make) in
                make.centerY.equalTo(self.contentView.snp.centerY).offset(0)
                make.right.equalTo(self.contentView.snp.right).offset(-15)
                make.size.equalTo(CGSize.init(width: 50, height: 30))
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
