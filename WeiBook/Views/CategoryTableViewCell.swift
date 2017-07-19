//
//  CategoryTableViewCell.swift
//  WeiBook
//
//  Created by Zhang on 2017/6/29.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit
import SwifterSwift

class CategoryTableView : UIView {
    var titleLabel:UIButton!
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUpView()
    }
    
    func setUpView(){
        titleLabel = UIButton.init(type: .custom)
        titleLabel.titleLabel?.font = App_Theme_PinFan_R_15_Font
        titleLabel.setTitleColor(UIColor.init(hexString: App_Theme_384249_Color), for: .normal)
        titleLabel.frame = CGRect.init(x: 0, y: 0, width: SwifterSwift.screenWidth/2, height: 44)
        self.addSubview(titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

typealias CategoryTableViewCellClouse = (_ tag:Int, _ indexPath:IndexPath) ->Void
class CategoryTableViewCell: UITableViewCell {

    var didMakeConstraints = false
    var categoryLView:CategoryTableView!
    var categoryRView:CategoryTableView!
    var indexPath:IndexPath!
    var linLabel:GloabLineView!
    
    var categoryTableViewCellClouse:CategoryTableViewCellClouse!
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){
        categoryLView = CategoryTableView.init(frame: CGRect.init(x: 0, y: 0, width: SwifterSwift.screenWidth / 2, height: 44))
        categoryLView.tag = 1
        categoryLView.titleLabel.reactive.controlEvents(.touchUpInside).observe { (action) in
            if self.categoryTableViewCellClouse != nil {
                self.categoryTableViewCellClouse(1,self.indexPath)
            }
        }
        self.contentView.addSubview(categoryLView)
        
        categoryRView = CategoryTableView.init(frame: CGRect.init(x: SwifterSwift.screenWidth / 2, y: 0, width: SwifterSwift.screenWidth / 2, height: 44))
        categoryRView.tag = 2
        categoryRView.titleLabel.reactive.controlEvents(.touchUpInside).observe { (action) in
            if self.categoryTableViewCellClouse != nil {
                self.categoryTableViewCellClouse(2,self.indexPath)
            }
        }
        self.contentView.addSubview(categoryRView)
        
        linLabel = GloabLineView.init(frame: CGRect.init(x: 0, y: 43.5, width: SwifterSwift.screenWidth, height: 0.5))
        self.contentView.addSubview(linLabel)
        self.updateConstraintsIfNeeded()
        
    }
    
    func cellSetData(titles:[String], indexPath:IndexPath){
        self.indexPath = indexPath
        categoryLView.titleLabel.setTitle(titles[0], for: .normal)
        categoryRView.titleLabel.setTitle(titles[1], for: .normal)
    }
    
    override func updateConstraints() {
        if !didMakeConstraints {
            
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
