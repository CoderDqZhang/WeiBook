//
//  BookTagTableViewCell.swift
//  WeiBook
//
//  Created by Zhang on 2017/7/3.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit
import SwifterSwift

let OriginX:CGFloat = 15
let OriginY:CGFloat = 50
let LabelHeight:CGFloat = 30

class BookTagTableViewCell: UITableViewCell {

    var titleLable:UILabel!
    
    var linLabel:GloabLineView!
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
        titleLable.text = "标签"
        titleLable.font = App_Theme_PinFan_M_18_Font
        titleLable.textColor = UIColor.init(hexString: App_Theme_384249_Color)
        self.contentView.addSubview(titleLable)
        
        linLabel = GloabLineView.init(frame: CGRect.init(x: 0, y: 0, width: SwifterSwift.screenWidth, height: 0.5))
        self.contentView.addSubview(linLabel)
        
        self.updateConstraints()
    }
    
    func cellSetData(model:SBNBookModel){
        var originX:CGFloat = OriginX
        var originY:CGFloat = OriginY
        let labelHeight:CGFloat = LabelHeight
        if model.tags.count > 0 {
            for i in 0...model.tags.count - 1 {
                let width = model.tags[i].title.widthWithConstrainedHeight(model.tags[i].title, font: App_Theme_PinFan_R_13_Font!, height: labelHeight) + 20
                if originX + width > SwifterSwift.screenWidth - 20 {
                    originY = originY + LabelHeight + 10
                    originX = OriginX
                }
                let frame = CGRect.init(x: originX, y: originY, width: width, height: labelHeight)
                let label = self.createLabel(frame: frame, title: model.tags[i].title)
                originX = originX + width + 10
                
                label.tag = i
                
                self.contentView.addSubview(label)
            }
        }
    }
    
    func createLabel(frame:CGRect, title:String) -> UILabel {
        let label = UILabel.init(frame: frame)
        label.text = title
        label.backgroundColor = UIColor.init(hexString: App_Theme_594CA8_Color)
        label.textAlignment = .center
        label.textColor = UIColor.init(hexString: App_Theme_FFFFFF_Color)
        label.font = App_Theme_PinFan_R_13_Font
        return label
    }
    
    override func updateConstraints() {
        if !didMakeConstraints{
            titleLable.snp.makeConstraints({ (make) in
                make.top.equalTo(self.contentView.snp.top).offset(20)
                make.left.equalTo(self.contentView.snp.left).offset(15)
                make.right.equalTo(self.contentView.snp.right).offset(-20)
            })
            
            linLabel.snp.makeConstraints({ (make) in
                make.bottom.equalTo(self.contentView.snp.bottom).offset(-0.5)
                make.left.equalTo(self.contentView.snp.left).offset(0)
                make.right.equalTo(self.contentView.snp.right).offset(0)
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
