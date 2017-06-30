//
//  GloableTableViewCell.swift
//  WeiBook
//
//  Created by Zhang on 2017/6/22.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit
import SnapKit

class GloableTableViewCell: NSObject {

}

//图片文字图片cell
class GloableImageLableDetailImageCell : UITableViewCell {
    
    var didMakeConstraints = false
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        self.updateConstraintsIfNeeded()
    }
    
    func cellSetData(image:UIImage, lableStr:String, detailStr:String?){
        self.imageView?.image = image

        self.textLabel?.text = lableStr
        self.detailTextLabel?.text = detailStr
        self.contentView.updateConstraintsIfNeeded()
    }
    
    override func updateConstraints() {
        if !didMakeConstraints {
            didMakeConstraints = true
        }
        super.updateConstraints()
    }
}

class GloableImageLableTextFieldImageCell : UITableViewCell {
    
    var textField:UITextField!
    var titleLable:UILabel!
    
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
        self.contentView.addSubview(titleLable)
        
        textField = UITextField.init()
        textField.textAlignment = .right
        self.contentView.addSubview(textField)
        
        self.updateConstraints()
    }
    
    func setCellData(text:String, detailText:String?, plachText:String){
        titleLable.text = text
        textField.text = detailText == nil ? "" : detailText
        textField.placeholder = plachText
        textField.setPlachTextColorAndFont(UIColor.init(hexString: App_Theme_DDE0E5_Color), font: App_Theme_PinFan_M_15_Font!, plachText:plachText)
        self.contentView.updateConstraintsIfNeeded()
    }
    
    
    
    override func updateConstraints() {
        if !didMakeConstraints {
            titleLable.snp.makeConstraints({ (make) in
                make.left.equalTo(self.contentView.snp.left).offset(15)
                make.width.equalTo(100)
                make.centerY.equalTo(self.contentView.snp.centerY).offset(0)
            })
            textField.snp.makeConstraints { (make) in
                make.left.equalTo(self.titleLable.snp.right).offset(15)
                make.centerY.equalTo(self.contentView.snp.centerY).offset(0)
                make.height.equalTo(15)
                make.right.equalTo(self.contentView.snp.right).offset(0)
            }
            didMakeConstraints = true
        }
        super.updateConstraints()
    }
}

class GloableLableDetailLabelImageCell : UITableViewCell {
    
    var detailLabel:UILabel!
    var titleLable:UILabel!
    
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
        self.contentView.addSubview(titleLable)
        
        detailLabel = UILabel.init()
        detailLabel.textAlignment = .right
        self.contentView.addSubview(detailLabel)
        
        self.updateConstraints()
    }
    
    func setCellData(text:String, detailText:String?){
        titleLable.text = text
        detailLabel.text = detailText
        
        self.contentView.updateConstraintsIfNeeded()
    }
    
    func updateDetailText(upStr:String){
        detailLabel.text = upStr
    }
    
    override func updateConstraints() {
        if !didMakeConstraints {
            titleLable.snp.makeConstraints({ (make) in
                make.left.equalTo(self.contentView.snp.left).offset(15)
                make.width.equalTo(100)
                make.centerY.equalTo(self.contentView.snp.centerY).offset(0)
            })
            
            detailLabel.snp.makeConstraints { (make) in
                make.left.equalTo(self.titleLable.snp.right).offset(15)
                make.centerY.equalTo(self.contentView.snp.centerY).offset(0)
                make.height.equalTo(15)
                make.right.equalTo(self.contentView.snp.right).offset(0)
            }
            didMakeConstraints = true
        }
        super.updateConstraints()
    }
}

class GloableInfoTextCell : UITableViewCell {
    
    var detailButton:UIButton!
    var titleLable:UILabel!
    var detailImage:UIImageView!
    
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
        titleLable.textAlignment = .left
        titleLable.font = App_Theme_PinFan_M_15_Font
        self.contentView.addSubview(titleLable)
        
        detailButton = UIButton.init(type: .custom)
        detailButton.titleLabel?.font = App_Theme_PinFan_L_11_Font
        detailButton.titleLabel?.textColor = UIColor.init(hexString: App_Theme_8A96A2_Color)
        self.contentView.addSubview(detailButton)
        
        detailImage = UIImageView.init()
        detailImage.image = UIImage.init(named: "detail")
        self.contentView.addSubview(detailImage)
        
        self.updateConstraints()
    }
    
    func setCellData(text:String, detailButtonTitle:String?){
        titleLable.text = text
        detailButton.setTitle(detailButtonTitle, for: .normal)
        
        self.contentView.updateConstraintsIfNeeded()
    }
    
    func updateDetailText(upStr:String){
        detailButton.setTitle(upStr, for: .normal)
    }
    
    override func updateConstraints() {
        if !didMakeConstraints {
            titleLable.snp.makeConstraints({ (make) in
                make.left.equalTo(self.contentView.snp.left).offset(15)
                make.width.equalTo(100)
                make.centerY.equalTo(self.contentView.snp.centerY).offset(0)
            })
            
            detailButton.snp.makeConstraints { (make) in
                make.left.equalTo(self.titleLable.snp.right).offset(15)
                make.centerY.equalTo(self.contentView.snp.centerY).offset(0)
                make.height.equalTo(15)
                make.right.equalTo(self.contentView.snp.right).offset(0)
            }
            
            detailImage.snp.makeConstraints({ (make) in
                make.right.equalTo(self.contentView.snp.right).offset(-15)
                make.centerY.equalTo(self.contentView.snp.centerY).offset(0)
                make.size.equalTo(CGSize.init(width: 12, height: 12))
            })
            
            didMakeConstraints = true
        }
        super.updateConstraints()
    }
}



