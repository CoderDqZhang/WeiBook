//
//  ProfileInfoTableViewCell.swift
//  WeiBook
//
//  Created by Zhang on 2017/6/22.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit
import SnapKit

class CustomInfoView: UIView {
    var titleLabel:UILabel!
    var subLabel:UILabel!
    
    init(title:String, subTitle:String, frame:CGRect) {
        super.init(frame: frame)
        titleLabel = UILabel.init()
        titleLabel.text = title
        titleLabel.textAlignment = .center
        titleLabel.font = App_Theme_PinFan_M_20_Font
        self.addSubview(titleLabel)
        
        subLabel = UILabel.init()
        subLabel.text = subTitle
        subLabel.textAlignment = .center
        subLabel.font = App_Theme_PinFan_M_13_Font
        subLabel.textColor = UIColor.init(hexString: App_Theme_DDE0E5_Color)
        self.addSubview(subLabel)
        
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX).offset(0)
            make.top.equalTo(self.snp.top).offset(19)
        }
        subLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX).offset(0)
            make.bottom.equalTo(self.snp.bottom).offset(-15)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

typealias ProfileInfoTableViewCellClouse = (_ tag:Int) -> Void

class ProfileInfoTableViewCell: UITableViewCell {

    var titles = ["0","0","0"]
    var subTitles = ["关注","粉丝","动态"]
    var cellContentViewHeight:CGFloat = 80
    var profileInfoTableViewCellClouse:ProfileInfoTableViewCellClouse!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){
        for index in 0...2{
            let frame = CGRect.init(x: CGFloat((SwifterSwift.screenWidth / 3) * CGFloat(index)), y: 0, width: SwifterSwift.screenWidth / 3, height: cellContentViewHeight)
            let customInfoView = CustomInfoView.init(title: titles[index], subTitle: subTitles[index], frame: frame)
            customInfoView.tag = index
            
            let sigleTapGesture = UITapGestureRecognizer.init(target: self, action: #selector(ProfileInfoTableViewCell.singleTap(tap:)))
            sigleTapGesture.numberOfTapsRequired = 1
            sigleTapGesture.numberOfTouchesRequired = 1
            customInfoView.addGestureRecognizer(sigleTapGesture)
            
            if index != 2 {
                let linLabel = GloabLineView.init(frame: CGRect.init(x: CGFloat((SwifterSwift.screenWidth / 3) * CGFloat(index + 1)), y: 12, width: 1, height: cellContentViewHeight - 24))
                self.contentView.addSubview(linLabel)
            }
            self.contentView.addSubview(customInfoView)
        }
        self.contentView.updateConstraintsIfNeeded()
    }
    
    func cellSetData(flowers:String, fans:String, dynamic:String){
        for index in 0...2 {
            let customView = self.viewWithTag(index) as! CustomInfoView
            switch index {
            case 0:
                customView.titleLabel.text = flowers
            case 1:
                customView.titleLabel.text = fans
            default:
                customView.titleLabel.text = dynamic
            }
        }
    }
    
    func singleTap(tap:UITapGestureRecognizer){
        let view = tap.view
        if self.profileInfoTableViewCellClouse != nil {
            self.profileInfoTableViewCellClouse(Int((view?.tag)!))
        }
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
