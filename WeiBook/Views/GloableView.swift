//
//  GloableView.swift
//  WeiBook
//
//  Created by Zhang on 2017/6/22.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit

class GloableView: NSObject {

}

class GloabLineView: UIView {
    
    let lineLabel:UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        lineLabel.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        lineLabel.backgroundColor = UIColor.init(hexString: App_Theme_E9EBF2_Color)
        self.addSubview(lineLabel)
    }
    
    func setLineColor(_ color:UIColor){
        lineLabel.backgroundColor = color
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


enum CustomButtonType {
    case withNoBoarder
    case withBoarder
    case withBackBoarder
    case widthDisbale
    
}
typealias CustomButtonClouse = (_ tag:NSInteger) -> Void
class CustomButton: UIButton {
    
    init(frame:CGRect, title:String, tag:NSInteger?, titleFont:UIFont, type:CustomButtonType, pressClouse:@escaping CustomButtonClouse) {
        super.init(frame: frame)
        self.setTitle(title, for: UIControlState())
        self.titleLabel?.font = titleFont
        self.layer.masksToBounds = true
        self.frame = frame
        if tag != nil {
            self.tag = tag!
        }
        switch type {
        case .withNoBoarder:
            self.setWithNoBoarderButton()
        case .withBoarder:
            self.layer.cornerRadius = 2.0
            self.setWithBoarderButton()
        case .withBackBoarder:
            self.layer.cornerRadius = 2.0
            self.setwithonBoarderButton()
        default:
            self.layer.cornerRadius = 2.0
            self.setWithDisbleBoarderButton()
        }
        self.reactive.controlEvents(.touchUpInside).observe { (action) in
            if tag != nil {
                self.tag = 1000
            }
            pressClouse(tag!)
        }
    }
    
    func setWithNoBoarderButton(){
        self.buttonSetTitleColor(App_Theme_594CA8_Color, sTitleColor: App_Theme_40C6B7_Color)
    }
    
    func setWithBoarderButton(){
        self.layer.borderColor = UIColor.init(hexString: App_Theme_594CA8_Color).cgColor
        self.layer.borderWidth = 1.0
        self.buttonSetTitleColor(App_Theme_594CA8_Color, sTitleColor: App_Theme_40C6B7_Color)
    }
    
    func setWithDisbleBoarderButton(){
        self.layer.borderColor = UIColor.init(hexString: App_Theme_BBC1CB_Color).cgColor
        self.layer.borderWidth = 1.0
        self.buttonSetTitleColor(App_Theme_BBC1CB_Color, sTitleColor: App_Theme_BBC1CB_Color)
    }
    
    func setwithonBoarderButton(){
        self.setTitleColor(UIColor.white, for: UIControlState())
        self.buttonSetThemColor(App_Theme_594CA8_Color, selectColor: App_Theme_40C6B7_Color, size: CGSize.init(width: self.frame.size.width, height: self.frame.size.height))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

typealias GloableBottomButtonViewClouse = (_ tag:NSInteger?) -> Void

class GloableBottomButtonView: UIView {
    
    var button:UIButton!
    init(frame:CGRect?, title:String, tag:NSInteger?, action:GloableBottomButtonViewClouse?) {
        if frame == nil {
            super.init(frame: CGRect.init(x: 0, y: SCREENHEIGHT - 49 - 64, width: SCREENWIDTH, height: 49))
        }else{
            super.init(frame: frame!)
        }
        self.isUserInteractionEnabled = true
        self.setUpButton(title)
        button.reactive.controlEvents(.touchUpInside).observe { (button) in
            if action != nil {
                action!(self.button.tag)
                //self.button.enabled = false
            }
        }
        
        button.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(0, 0, 0, 0))
        }
    }
    
    func setUpButton(_ title:String) {
        button = UIButton(type: .custom)
        button.setTitle(title, for: UIControlState())
        button.buttonSetThemColor(App_Theme_594CA8_Color, selectColor: App_Theme_40C6B7_Color, size: CGSize.init(width: SCREENWIDTH, height: 49))
        button.titleLabel?.font = App_Theme_PinFan_R_15_Font
        button.setTitleColor(UIColor.init(hexString: App_Theme_FFFFFF_Color), for: UIControlState())
        button.titleLabel?.textAlignment = .center
        button.tag = 1
        self.addSubview(button)
        self.updateConstraintsIfNeeded()
    }
    
    func updateButtonTitle(_ title:String) {
        button.setTitle(title, for: UIControlState())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}




