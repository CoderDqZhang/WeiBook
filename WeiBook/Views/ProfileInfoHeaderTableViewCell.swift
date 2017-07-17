//
//  ProfileInfoHeaderTableViewCell.swift
//  WeiBook
//
//  Created by Zhang on 2017/6/23.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit
import SDWebImage
class ProfileInfoHeaderTableViewCell: UITableViewCell {

    var photoImageView:UIImageView!
    
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
        
        self.textLabel?.text = "头像"

        
        self.updateConstraints()
    }
    
    func cellSetData(model:UserInfoModel){
        photoImageView.sd_setImage(with: URL.init(string: model.tails.userInfo.photo == nil ? "" : model.tails.userInfo.photo), placeholderImage: nil, options: SDWebImageOptions.retryFailed) { (image, error, cacheType, url) in
        }
    }
    
    func updateImage(image:UIImage) {
        photoImageView.image = image
    }
    
    override func updateConstraints() {
        if !didMakeConstraints {
            photoImageView.snp.makeConstraints { (make) in
                make.right.equalTo(self.contentView.snp.right).offset(-15)
                make.centerY.equalTo(self.contentView.snp.centerY).offset(0)
                make.size.equalTo(CGSize.init(width: 60, height: 60))
            }
            
            didMakeConstraints = true
        }
        super.updateConstraints()
    }
    
}
