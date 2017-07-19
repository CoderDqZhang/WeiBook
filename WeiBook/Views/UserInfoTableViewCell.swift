//
//  UserInfoTableViewCell.swift
//  WeiBook
//
//  Created by Zhang on 2017/7/4.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit
import SDWebImage
import SwifterSwift

class UserInfoTableViewCell: UITableViewCell {

    var userPhoto:UIImageView!
    var userName:UILabel!
    var userBooksNumber:UILabel!
    var userConmmentNumber:UILabel!
    
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
        userName.font = App_Theme_PinFan_R_15_Font
        userName.textColor = UIColor.init(hexString: App_Theme_384249_Color)
        self.contentView.addSubview(userName)
        
        userBooksNumber = UILabel.init()
        userBooksNumber.text = "收藏图书 345 册"
        userBooksNumber.font = App_Theme_PinFan_L_12_Font
        userBooksNumber.textColor = UIColor.init(hexString: App_Theme_8A96A2_Color)
        self.contentView.addSubview(userBooksNumber)
        
        userConmmentNumber = UILabel.init()
        userConmmentNumber.text = "评论数 130 "
        userConmmentNumber.font = App_Theme_PinFan_L_12_Font
        userConmmentNumber.textColor = UIColor.init(hexString: App_Theme_8A96A2_Color)
        self.contentView.addSubview(userConmmentNumber)
        
        lineLabel = GloabLineView.init(frame: CGRect.init(x: 0, y: 59.5, width: SwifterSwift.screenWidth, height: 0.5))
        self.contentView.addSubview(lineLabel)
        
        self.updateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
            
            userBooksNumber.snp.makeConstraints({ (make) in
                make.left.equalTo(self.userPhoto.snp.right).offset(5)
                make.top.equalTo(self.userName.snp.bottom).offset(5)
            })
            
            userConmmentNumber.snp.makeConstraints({ (make) in
                make.left.equalTo(self.userBooksNumber.snp.right).offset(5)
                make.top.equalTo(self.userName.snp.bottom).offset(5)
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
