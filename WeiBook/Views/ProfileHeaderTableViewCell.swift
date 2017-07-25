//
//  ProfileHeaderTableViewCell.swift
//  WeiBook
//
//  Created by Zhang on 2017/6/22.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit
import SDWebImage

class ProfileHeaderTableViewCell: UITableViewCell {

    var photoImageView:UIImageView!
    var userName:UILabel!
    var signature:UILabel!
    
    var didMakeConstraints = false
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        photoImageView = UIImageView.init()
        photoImageView.image = UIImage.init(color: UIColor.init(hexString: App_Theme_8A96A2_Color), size: CGSize.init(width: 60, height: 60))
        photoImageView.layer.cornerRadius = 30
        photoImageView.layer.masksToBounds = true
        self.contentView.addSubview(photoImageView)
        
        userName = UILabel.init()
        userName.text = "一元钱的价值"
        userName.font = App_Theme_PinFan_M_20_Font
        self.contentView.addSubview(userName)
        
        signature = UILabel.init()
        signature.text = "个性签名"
        signature.font = App_Theme_PinFan_M_15_Font
        signature.textColor = UIColor.init(hexString: App_Theme_8A96A2_Color)
        self.contentView.addSubview(signature)
        
        self.updateConstraints()
    }
    
    func cellSetData(model:UserInfoModel?, isLogin:Bool){
        if isLogin {
//            ImageViewManager.shareInstance.sd_imageView(url: (model?.tails.userInfo.photo)!, imageView: photoImageView, completedBlock: { (image, error, cacheType, url) in
//                
//            })
            photoImageView.sd_setImage(with: URL.init(string: (model?.tails.userInfo.photo)!), placeholderImage: nil, options: SDWebImageOptions.retryFailed, completed: { (image, error, cacheType, url) in
                
            })
            self.userName.text = model?.username
            self.signature.text = model?.tails.userInfo.introduction
        }else{
            self.userName.text = "未登录"
        }
        
    }
    
    override func updateConstraints() {
        if !didMakeConstraints {
            photoImageView.snp.makeConstraints { (make) in
                make.left.equalTo(self.contentView.snp.left).offset(15)
                make.centerY.equalTo(self.contentView.snp.centerY).offset(0)
                make.size.equalTo(CGSize.init(width: 60, height: 60))
            }
            
            userName.snp.makeConstraints { (make) in
                make.left.equalTo(self.photoImageView.snp.right).offset(15)
                make.right.equalTo(self.contentView.snp.right).offset(-15)
                make.top.equalTo(self.contentView.snp.top).offset(18)
            }
            
            signature.snp.makeConstraints({ (make) in
                make.left.equalTo(self.photoImageView.snp.right).offset(18)
                make.right.equalTo(self.contentView.snp.right).offset(-15)
                make.top.equalTo(self.userName.snp.bottom).offset(3)
//                make.bottom.equalTo(self.contentView.snp.bottom).offset(-18)
            })
            
            didMakeConstraints = true
        }
        super.updateConstraints()
    }

}
