//
//  BookListDescInfoTableViewCell.swift
//  WeiBook
//
//  Created by Zhang on 08/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class BookListDescInfoTableViewCell: UITableViewCell {

    var photoImage:UIImageView!
    var titleLabel:UILabel!
    var descLabel:UILabel!
    
    var didMakeConstraints = false
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpView()
    }
    
    func setUpView(){
        photoImage = UIImageView.init()
        photoImage.layer.masksToBounds = true
        photoImage.layer.cornerRadius = 40
        photoImage.backgroundColor = UIColor.init(hexString: App_Theme_F6F7FA_Color)
        self.contentView.addSubview(photoImage)
        
        titleLabel = UILabel.init()
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.font = App_Theme_PinFan_R_15_Font
        titleLabel.textColor = UIColor.init(hexString: App_Theme_384249_Color)
        self.contentView.addSubview(titleLabel)
        
        descLabel = UILabel.init()
        descLabel.numberOfLines = 0
        descLabel.textAlignment = .center
        descLabel.font = App_Theme_PinFan_R_12_Font
        descLabel.textColor = UIColor.init(hexString: App_Theme_8A96A2_Color)
        self.contentView.addSubview(descLabel)
        
        self.updateConstraints()
    }
    
    func cellSetData(model:BookListDescModel){
        ImageViewManager.shareInstance.sd_imageView(url: model.bookListDesctails.user.tails.userInfo.photo, imageView: photoImage) { (image, error, cacheType, url) in
            
        }
        titleLabel.text = model.listName
        descLabel.text = model.descriptionField
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func updateConstraints() {
        if !didMakeConstraints {
            photoImage.snp.makeConstraints({ (make) in
                make.centerX.equalTo(self.contentView.snp.centerX).offset(0)
                make.top.equalTo(self.contentView.snp.top).offset(5)
                make.size.equalTo(CGSize.init(width: 80, height: 80))
            })
            
            titleLabel.snp.makeConstraints({ (make) in
                make.centerX.equalTo(self.contentView.snp.centerX).offset(0)
                make.top.equalTo(self.photoImage.snp.bottom).offset(5)
                make.left.equalTo(self.contentView.snp.left).offset(15)
                make.right.equalTo(self.contentView.snp.right).offset(-15)
            })
            
            descLabel.snp.makeConstraints({ (make) in
                make.centerX.equalTo(self.contentView.snp.centerX).offset(0)
                make.top.equalTo(self.titleLabel.snp.bottom).offset(1)
                make.left.equalTo(self.contentView.snp.left).offset(15)
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
