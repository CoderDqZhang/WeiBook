//
//  BooksInfoTableViewCell.swift
//  WeiBook
//
//  Created by Zhang on 2017/6/28.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit
import SDWebImage
import SwifterSwift

class BookInfo: UIView {
    var bookPost:UIImageView!
    var bookTitle:UILabel!
//    var bookDesc:UILabel!
    
    var didMakeConstrants = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUpView()
    }
    
    func setUpView(){
        bookPost = UIImageView.init()
        bookPost.sd_setImage(with: URL.init(string: "https://img3.doubanio.com/lpic/s29435682.jpg"), placeholderImage: nil)
        self.addSubview(bookPost)
        
        bookTitle = UILabel.init()
        bookTitle.font = App_Theme_PinFan_R_14_Font
        bookTitle.numberOfLines = 0
        bookTitle.text = "这是一个测试文件"
        bookTitle.textColor = UIColor.init(hexString: App_Theme_384249_Color)
        self.addSubview(bookTitle)
        
        self.updateConstraints()
        

    }
    
    func setBookInfoData(model:ServerBookModel){
        bookTitle.text = model.title
        ImageViewManager.shareInstance.doubanDanDanImageViewTools(url: model.bookImg, imageView: bookPost) { (image, error, url) in
            
        }
    }
    
    override func updateConstraints() {
        if !didMakeConstrants {
            bookPost.snp.makeConstraints({ (make) in
                make.top.equalTo(self.snp.top).offset(10)
                make.left.equalTo(self.snp.left).offset(20)
                make.right.equalTo(self.snp.right).offset(-20)
                make.size.equalTo(CGSize.init(width: 70, height: 95))
            })
            bookTitle.snp.makeConstraints({ (make) in
                make.top.equalTo(bookPost.snp.bottom).offset(0)
                make.size.equalTo(CGSize.init(width: 70, height: 40))
                make.left.equalTo(self.snp.left).offset(20)
                make.right.equalTo(self.snp.right).offset(-20)

            })
            didMakeConstrants = true
        }
        super.updateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

typealias BooksInfoTableViewCellClouse = (_ tag:Int) ->Void

class BooksInfoTableViewCell: UITableViewCell {

    var booksInfoTableViewCellClouse:BooksInfoTableViewCellClouse!

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func cellSetData(model:NSMutableArray){
        for i in 0...model.count - 1 {
            let frame = CGRect.init(x: CGFloat((CGFloat(i%3) * SwifterSwift.screenWidth / 3)), y: CGFloat(((i/3) * 145)), width: SwifterSwift.screenWidth / 3, height: 145)
            let book = BookInfo.init(frame: frame)
            book.tag = i
            let sigleTap = UITapGestureRecognizer.init(target: self, action: #selector(BooksInfoTableViewCell.sigleTapGest(gest:)))
            sigleTap.numberOfTapsRequired = 1
            sigleTap.numberOfTouchesRequired = 1
            book.isUserInteractionEnabled = true
            book.addGestureRecognizer(sigleTap)
            
            let model = HomeRecommentModel.init(fromDictionary: model[i] as! NSDictionary)
            book.setBookInfoData(model: model.tails.bookInfo)
            self.contentView.addSubview(book)
        }
    }
    
    func sigleTapGest(gest:UITapGestureRecognizer) {
        let view = gest.view
        if booksInfoTableViewCellClouse != nil {
            booksInfoTableViewCellClouse((view?.tag)!)
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
