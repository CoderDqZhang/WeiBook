//
//  CreateDataTableViewCell.swift
//  WeiBook
//
//  Created by Zhang on 2017/7/10.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit
import SDWebImage
import Photos

typealias AddImagesClouse = () -> Void
typealias ImagesSelectClouse = (_ tag:Int, _ view:UIView?) -> Void

class CreateDataTableViewCell: UITableViewCell {

    var textView:UITextView!
    var addImagesClouse:AddImagesClouse!
    var imagesSelectClouse:ImagesSelectClouse!
    
    var didMakeConstraints = false
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpView()
    }
    
    func setUpView(){
        textView = UITextView.init()
        textView.becomeFirstResponder()
        self.contentView.addSubview(textView)
        
        self.updateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func cellSetData(images:[PHAsset]){
        
        for i in 0...images.count {
            let imageView = UIImageView.init()
            let frame = CGRect.init(x: CGFloat(i % 4 * 85) + 15, y: CGFloat(i / 4 * 85) + 100, width: ImageSize.width, height: ImageSize.height)
            imageView.frame = frame
            imageView.tag = i
            if images.count == 9 {
                
            }else if i < images.count {
                DXPickerHelper.fetchImage(viaAsset: images[i], targetSize: ImageSize, imageResultHandler: { (image) in
                    imageView.image = image
                })
                imageView.isUserInteractionEnabled = true
                let sigleTap = UITapGestureRecognizer.init(target: self, action: #selector(CreateDataTableViewCell.sigleTapGeustImage))
                sigleTap.numberOfTapsRequired = 1
                sigleTap.numberOfTouchesRequired = 1
                imageView.addGestureRecognizer(sigleTap)
            }else{
                imageView.image = UIImage.init(named: "add")
                imageView.layer.borderColor = UIColor.init(hexString: App_Theme_DDE0E5_Color).cgColor
                imageView.layer.borderWidth = 1.0
                imageView.layer.masksToBounds = true
                imageView.isUserInteractionEnabled = true
                let sigleTap = UITapGestureRecognizer.init(target: self, action: #selector(CreateDataTableViewCell.sigleTapGeust))
                sigleTap.numberOfTapsRequired = 1
                sigleTap.numberOfTouchesRequired = 1
                imageView.addGestureRecognizer(sigleTap)
            }
            self.contentView.addSubview(imageView)
        }
        self.updateConstraintsIfNeeded()
    }
    
    func sigleTapGeust(){
        if self.addImagesClouse != nil {
            self.addImagesClouse()
        }
    }
    
    func sigleTapGeustImage(geust:UITapGestureRecognizer) {
        let view = geust.view
        if imagesSelectClouse != nil {
            imagesSelectClouse((view?.tag)!, view)
        }
    }
    
    override func updateConstraints() {
        if !didMakeConstraints {
            textView.snp.makeConstraints({ (make) in
                make.top.equalTo(self.contentView.snp.top).offset(10)
                make.left.equalTo(self.contentView.snp.left).offset(15)
                make.right.equalTo(self.contentView.snp.right).offset(-15)
                make.height.equalTo(90)
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
