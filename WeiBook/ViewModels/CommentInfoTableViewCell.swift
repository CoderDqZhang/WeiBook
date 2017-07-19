//
//  CommentInfoTableViewCell.swift
//  
//
//  Created by Zhang on 2017/7/4.
//
//

import UIKit
import SwifterSwift

let ImageSize = CGSize.init(width: 80, height: 80)
typealias PhotoBrowserClouse = (_ tag:NSInteger, _ view:UIView) ->Void

class CommentInfoTableViewCell: UITableViewCell {

    var titleLable:UILabel!
    var photosImageView:UIView!
    
    var lineLabel:GloabLineView!
    var photoBrowserClouse:PhotoBrowserClouse!
    
    var didMakeConstraints = false
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpView()
    }
    
    func setUpView(){
        titleLable = UILabel.init()
        self.contentView.addSubview(titleLable)
        
        photosImageView = UIView.init()
        self.contentView.addSubview(photosImageView)
        
        lineLabel = GloabLineView.init(frame: CGRect.init(x: 0, y: 0, width: SwifterSwift.screenWidth, height: 0.5))
        self.contentView.addSubview(lineLabel)
        
        self.updateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func cellSetData(title:String, imgs:[String]){
        titleLable.text = title
        for i in 0...imgs.count - 1{
            let image = UIImageView.init()
            let frame = CGRect.init(x: CGFloat(i % 3 * 85), y: CGFloat(i / 3 * 85), width: ImageSize.width, height: ImageSize.height)
            image.sd_setImage(with: URL.init(string: imgs[i]), placeholderImage: nil, options: .retryFailed, completed: { (image, error, cacheType, url) in
                
            })
            image.tag = i
            
            image.isUserInteractionEnabled = true
            image.frame = frame
            
            
            let sigleTap = UITapGestureRecognizer.init(target: self, action: #selector(CommentInfoTableViewCell.imageTap(gesture:)))
            sigleTap.numberOfTapsRequired = 1
            sigleTap.numberOfTouchesRequired = 1
            image.addGestureRecognizer(sigleTap)
            
            photosImageView.addSubview(image)
        }
        self.updateConstraintsIfNeeded()
    }
    
    func imageTap(gesture:UITapGestureRecognizer) {
        let image = gesture.view
        if self.photoBrowserClouse != nil {
            self.photoBrowserClouse((image?.tag)!, image!)
        }
    }
    
    override func updateConstraints() {
        if !didMakeConstraints {
            titleLable.snp.makeConstraints({ (make) in
                make.top.equalTo(self.contentView.snp.top).offset(10)
                make.left.equalTo(self.contentView.snp.left).offset(15)
                make.right.equalTo(self.contentView.snp.right).offset(-15)
            })
            
            photosImageView.snp.makeConstraints({ (make) in
                make.top.equalTo(self.titleLable.snp.bottom).offset(5)
                make.left.equalTo(self.contentView.snp.left).offset(15)
                make.right.equalTo(self.contentView.snp.right).offset(-15)
                make.bottom.equalTo(self.contentView.snp.bottom).offset(-20)
            })
            
            lineLabel.snp.makeConstraints({ (make) in
                make.left.equalTo(self.contentView.snp.left).offset(0)
                make.right.equalTo(self.contentView.snp.right).offset(0)
                make.bottom.equalTo(self.contentView.snp.bottom).offset(-0.5)
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
