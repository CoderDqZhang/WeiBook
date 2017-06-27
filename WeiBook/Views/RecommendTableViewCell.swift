//
//  RecommendTableViewCell.swift
//  WeiBook
//
//  Created by Zhang on 2017/6/27.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit


typealias CyCleScrollerViewClouse = (_ index:Int) -> Void

class RecommendTableViewCell: UITableViewCell {
    
    var cycleScrollView:SDCycleScrollView!
    var cyCleScrollerViewClouse:CyCleScrollerViewClouse!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.clear
        self.setUpView()
    }
    
    func setUpView() {
        if cycleScrollView == nil {
            cycleScrollView = SDCycleScrollView(frame: CGRect(x: 0, y: 0, width: SCREENWIDTH, height: SCREENWIDTH * 7 / 15), delegate: self, placeholderImage: UIImage.init(named: "Banner_Default_Cover"))
            cycleScrollView.pageDotImage = UIImage.init(named: "banner_normal")
            cycleScrollView.currentPageDotImage = UIImage.init(named: "banner_select")
            cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
            cycleScrollView.pageControlDotSize = CGSize(width: 8, height: 8)
            self.contentView.addSubview(cycleScrollView)
            //         --- 轮播时间间隔，默认1.0秒，可自定义
            cycleScrollView.autoScroll = true
            
        }
    }
    
    func setcycleScrollerViewData(_ imageArray:NSArray){
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now(), execute: {
            self.cycleScrollView.imageURLStringsGroup = imageArray as [AnyObject]
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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

extension RecommendTableViewCell : SDCycleScrollViewDelegate {
    func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didScrollTo index: Int) {
        
    }
    
    func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didSelectItemAt index: Int) {
        if self.cyCleScrollerViewClouse != nil {
            self.cyCleScrollerViewClouse(index)
        }
    }
}
