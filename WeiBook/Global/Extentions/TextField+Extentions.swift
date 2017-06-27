//
//  TextField+Extentions.swift
//  WeiBook
//
//  Created by Zhang on 2017/6/23.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit

extension UITextField {
    func setPlachTextColorAndFont(_ color:UIColor, font:UIFont, plachText:String) {
        let attributedString = NSAttributedString.init(string: plachText, attributes: [NSForegroundColorAttributeName:color, NSFontAttributeName:font])
        self.attributedPlaceholder = attributedString
    }
}
