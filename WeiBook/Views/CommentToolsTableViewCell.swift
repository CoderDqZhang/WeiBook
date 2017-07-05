//
//  CommentToolsTableViewCell.swift
//  WeiBook
//
//  Created by Zhang on 2017/7/5.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit

class CommentToolsTableViewCell: UITableViewCell {

    var indexPath:IndexPath!
    
    var titles = ["100","300","分享"]
    var imgs = ["like_unselect.png","comment_unselect.png","share_unselect.png"]
    var didMakeConstraints = false
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpView()
    }
    
    func setUpView(){
        for i in 0...2 {
            let frame = CGRect.init(x: CGFloat(i) * SCREENWIDTH / 3, y: 0, width: SCREENWIDTH / 3, height: 40)
            let button = self.createButton(frame: frame, title: titles[i], image: UIImage.init(named: imgs[i])!, tag: i)
            self.contentView.addSubview(button)
        }
        self.updateConstraints()
    }
    
    func createButton(frame:CGRect, title:String, image:UIImage, tag:Int) ->UIButton{
        let btn = UIButton.init(type: .custom)
        btn.frame = frame
        if tag == 1 {
            btn.layer.borderWidth = 0.5
            btn.layer.borderColor = UIColor.init(hexString: App_Theme_E9EBF2_Color).cgColor
        }
        btn.titleEdgeInsets = UIEdgeInsetsMake(-0, 10, 0, -10)
        btn.setTitleColor(UIColor.init(hexString: App_Theme_DDE0E5_Color), for: .normal)
        btn.setTitle(title, for: .normal)
        btn.titleLabel?.font = App_Theme_PinFan_L_12_Font
        btn.setImage(image, for: .normal)
        btn.reactive.controlEvents(.touchUpInside).observe { (action) in
            
        }
        return btn
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
