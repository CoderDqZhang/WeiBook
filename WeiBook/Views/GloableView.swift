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


