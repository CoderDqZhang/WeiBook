//
//  ScanMaskView.swift
//  WeiBook
//
//  Created by Zhang on 2017/6/26.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit

let kMaskViewBorderWidth = 0.2

class ScanView: UIView {

    var cropRect:CGRect!
    var label:UILabel!
    var lightButton:UIButton!
    
    init(frame:CGRect, cropRect:CGRect) {
        super.init(frame: frame)
        self.cropRect = cropRect
        self.setUpMaskView(frame: frame)
        
        self.setUpView(cropRect: cropRect)
    }
    
    func setUpMaskView(frame:CGRect){
        let markLayer = CAShapeLayer();
        markLayer.frame = frame// layer的位置
        markLayer.fillColor = UIColor(colorLiteralRed: 0, green: 0, blue: 0, alpha: 0.7).cgColor;// layer的填充颜色，这里设置了透明度
        markLayer.fillRule = kCAFillRuleEvenOdd; //填充规则，稍后会解释
        
        let path = CGMutablePath();
        path.addRect(frame)
        path.addRoundedRect(in: cropRect, cornerWidth: 1, cornerHeight: 1)
        //        path.addEllipse(in: )
        markLayer.path = path; //设置要渲染的Path
        self.layer.addSublayer(markLayer)
    }
    
    func setUpView(cropRect:CGRect) {
        lightButton = UIButton.init(type: .custom)
        lightButton.frame = CGRect.init(x: (SwifterSwift.screenWidth - 74)/2, y: SwifterSwift.screenHeight - 64 - 74, width: 74, height: 74)
        lightButton.setImage(UIImage.init(named: "light"), for: .normal)
        self.addSubview(lightButton)
        
        label = UILabel.init()
        label.text = "将条码/二维码放入框内"
        label.frame = CGRect.init(x: 0, y: cropRect.origin.y - 60, width: SwifterSwift.screenWidth, height: 20)
        label.textColor = UIColor.white
        label.font = App_Theme_PinFan_R_13_Font
        label.textAlignment = .center
        self.addSubview(label)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
