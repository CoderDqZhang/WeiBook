//
//  BorrowTableViewCell.swift
//  WeiBook
//
//  Created by Zhang on 2017/7/6.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit

enum BorrowStatus {
    case BorrowIn
    case BorrowOut
    case BorrowDone
    case BorrowTimeEnd
}


class BorrowUserInfoTableViewCell: UITableViewCell {

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
        startTime.text = "2017-07-10 ~"
        startTime.font = App_Theme_PinFan_R_15_Font
        startTime.textColor = UIColor.init(hexString: App_Theme_EE5028_Color)
        self.contentView.addSubview(startTime)
        
        endTime = UILabel.init()
        endTime.text = "2017-09-10"
        endTime.font = App_Theme_PinFan_R_15_Font
        endTime.textColor = UIColor.init(hexString: App_Theme_EE5028_Color)
        self.contentView.addSubview(endTime)
        
        statusButton = UIButton.init(type:.custom)
        statusButton.layer.cornerRadius = 3.0
        statusButton.layer.borderWidth = 1.0
        statusButton.titleLabel?.font = App_Theme_PinFan_R_13_Font
        self.updataStatusButton(status: .BorrowDone)
        self.contentView.addSubview(statusButton)
        
        lineLabel = GloabLineView.init(frame: CGRect.init(x: 0, y: 59.5, width: SCREENWIDTH, height: 0.5))
        self.contentView.addSubview(lineLabel)
        
        self.updateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func updataStatusButton(status:BorrowStatus){
        switch status {
        case .BorrowIn:
            statusButton.setTitle("待还", for: .normal)
            statusButton.setTitleColor(UIColor.init(hexString: App_Theme_EE5028_Color), for: .normal)
            statusButton.layer.borderColor = UIColor.init(hexString: App_Theme_EE5028_Color).cgColor
        case .BorrowOut:
            statusButton.setTitle("借出", for: .normal)
            statusButton.setTitleColor(UIColor.init(hexString: App_Theme_594CA8_Color), for: .normal)
            statusButton.layer.borderColor = UIColor.init(hexString: App_Theme_594CA8_Color).cgColor
        case .BorrowTimeEnd:
            statusButton.setTitle("提醒还书", for: .normal)
            statusButton.setTitleColor(UIColor.init(hexString: App_Theme_EE5028_Color), for: .normal)
            statusButton.layer.borderColor = UIColor.init(hexString: App_Theme_EE5028_Color).cgColor
        default:
            statusButton.setTitle("已还", for: .normal)
            statusButton.setTitleColor(UIColor.init(hexString: App_Theme_594CA8_Color), for: .normal)
            statusButton.layer.borderColor = UIColor.init(hexString: App_Theme_594CA8_Color).cgColor
        }
    }
    
    func cellSetData(bookStatus:BorrowStatus){
        self.updataStatusButton(status: bookStatus)
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
            
            endTime.snp.makeConstraints({ (make) in
                make.left.equalTo(self.startTime.snp.right).offset(5)
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
