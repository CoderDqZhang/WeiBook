//
//  GloableNavigationBarView.swift
//  WeiBook
//
//  Created by Zhang on 2017/6/26.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit

typealias SearchNavigationBarQRCodeButtonClouse = () -> Void
typealias SearchTextFieldBecomFirstRespoder = () -> Void
class GloableNavigationBarView: UIView {

    var searchField:UITextField!
    var QRCodeButton:UIButton!
    
    var searchNavigationBarQRCodeButtonClouse:SearchNavigationBarQRCodeButtonClouse!
    var searchTextFieldBecomFirstRespoder:SearchTextFieldBecomFirstRespoder!
    
    init(frame:CGRect, font:UIFont?) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.init(hexString: App_Theme_594CA8_Color)
        self.setUpView(font)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(_ font:UIFont?) {
        let searchImage = UIImage.init(named: "Icon_Search")
        let leftImage = UIImageView(image: searchImage)
        leftImage.frame  = CGRect(x: 15, y: 15, width: (searchImage?.size.width)!, height: (searchImage?.size.height)!)
        
        searchField = HomeBandSearchField(frame:CGRect(x: 20, y: 27,width: SwifterSwift.screenWidth - 84, height: 30))
        searchField.tag = 200
        searchField.layer.cornerRadius = 4.0
        searchField.drawPlaceholder(in: CGRect(x: 20, y: 0, width: searchField.frame.size.width, height: searchField.frame.size.height))
        if font == nil {
            searchField.attributedPlaceholder = NSAttributedString.init(string: "搜索书名、作者...", attributes: [NSFontAttributeName:App_Theme_PinFan_L_14_Font!,NSForegroundColorAttributeName:UIColor.init(hexString: App_Theme_BBC1CB_Color)])
        }else{
            searchField.attributedPlaceholder = NSAttributedString.init(string: "搜索书名、作者...", attributes: [NSFontAttributeName:font!,NSForegroundColorAttributeName:UIColor.init(hexString: App_Theme_BBC1CB_Color)])
        }
        searchField.delegate = self
        searchField.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        searchField.leftView = leftImage
        searchField.tintColor = UIColor.init(hexString: App_Theme_594CA8_Color)
        searchField.backgroundColor = UIColor.white
        searchField.leftViewMode = .always
        searchField.returnKeyType = .search
        searchField.font = App_Theme_PinFan_R_14_Font
        searchField.attributedPlaceholder = NSAttributedString.init(string: "搜索书名、作者...", attributes: [NSFontAttributeName:App_Theme_PinFan_L_14_Font!,NSForegroundColorAttributeName:UIColor.init(hexString: App_Theme_BBC1CB_Color)])
        searchField.textColor = UIColor.init(hexString: App_Theme_384249_Color)
        searchField.clearButtonMode = .always
        self.addSubview(searchField)
        
        QRCodeButton = UIButton(type: .custom)
        QRCodeButton.frame = CGRect(x: SwifterSwift.screenWidth - 64, y: 10,width: 64, height: 64)
        QRCodeButton.setImage(UIImage.init(named: "qrcode"), for: .normal)
        QRCodeButton.reactive.controlEvents(.touchUpInside).observe { (action) in
            if self.searchNavigationBarQRCodeButtonClouse != nil{
                self.searchNavigationBarQRCodeButtonClouse()
            }
        }
        self.addSubview(QRCodeButton)
        
        self.updateConstraintsIfNeeded()
    }

}

typealias SearchNavigationBarCancelClouse = () ->Void
class GloableNavigationBarSearchView: GloableNavigationBarView {
    
    var searchNavigationBarCancelClouse:SearchNavigationBarCancelClouse!
    func updataFrame(){
        searchField.delegate = self
        searchField.tag = 100
        searchField.frame = CGRect.init(x: 54, y: 27, width: SwifterSwift.screenWidth - 120, height: 30)
        QRCodeButton.setImage(UIImage.init(named: "Icon_Back_Normal"), for: .normal)
        QRCodeButton.frame = CGRect(x: 10, y: 20,width: 40, height: 40)
        
        var cancelButton:UIButton!
        cancelButton = UIButton(type: .custom)
        cancelButton.frame = CGRect(x: SwifterSwift.screenWidth - 64, y: 27,width: 64, height: 30)
        cancelButton.setTitle("取消", for: UIControlState())
        cancelButton.titleLabel?.font = App_Theme_PinFan_L_17_Font
        cancelButton.isHidden = false
        cancelButton.reactive.controlEvents(.touchUpInside).observe { (action) in
            if self.searchNavigationBarCancelClouse != nil{
                self.searchNavigationBarCancelClouse()
            }
        }
        self.addSubview(cancelButton)
        
        self.updateConstraintsIfNeeded()

    }
}


class HomeBandSearchField: UITextField {
    
    override func drawPlaceholder(in rect: CGRect) {
        super.drawPlaceholder(in: CGRect(x: 0, y: self.frame.height * 0.5 + 0.5, width: 0, height: 0))
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: CGRect(x: 0, y: self.frame.height * 0.5 + 0.5, width: 0, height: 0))
    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        return super.leftViewRect(forBounds: CGRect(x: 20, y: self.frame.height * 0.5 + 0.5, width: 0, height: 0))
    }
}

extension GloableNavigationBarView : UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if self.searchTextFieldBecomFirstRespoder != nil {
            self.searchTextFieldBecomFirstRespoder()
        }
        return textField.tag == 100 ? true : false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        return true
    }
}

