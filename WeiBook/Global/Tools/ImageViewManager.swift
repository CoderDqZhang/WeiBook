//
//  ImageViewManager.swift
//  WeiBook
//
//  Created by Zhang on 2017/7/25.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit
import SDWebImage

enum ImageExtType {
    
    case DanDanUrl
    case DouBanUrl
    case AWSUrl
}

typealias DownLoadImageCompletionBlock = (_ image:UIImage?, _ error:Error?, _ url:URL) -> Void

class ImageViewManager: NSObject {

    override init() {
        
    }
    
    static let shareInstance = ImageViewManager()
    
//    func doubanDanDanImageViewTools(url:String, imageSizeType:ImageSizeType,  imageView:UIImageView, completedBlock: DownLoadImageCompletionBlock?) {
//        if imageSizeType != .Default {
//            let size = imageSize(type: imageSizeType, imageUrlType: imageType)
//            switch imageSizeType {
//            case .BookListView:
//                imageView.snp.updateConstraints({ (make) in
//                    make.size.equalTo(size)
//                    make.left.equalTo(imageType == .DouBanUrl ? 25 : 0)
//                })
//            default:
//                imageView.snp.updateConstraints({ (make) in
//                    make.size.equalTo(size)
//                })
//            }
//            
//        }
//        let imageType = imageUrlType(url: url)
//        SDWebImageManager.shared().imageDownloader?.downloadImage(with: URL.init(string: url), options: SDWebImageDownloaderOptions.highPriority, progress: { (start, end, url) in
//            
//        }, completed: { (image, imageDate, error, finish) in
//            if completedBlock != nil {
//                completedBlock(imageType == .DanDanUrl ? coreImage(image) : image, error, url)
//            }
//        })
//        imageView.sd_setImage(with: URL.init(string: url), placeholderImage: nil, options: .retryFailed, completed: completedBlock)
//    }
    
    func doubanDanDanImageViewTools(url:String, imageView:UIImageView, completedBlock:@escaping DownLoadImageCompletionBlock) {
        let imageType = imageUrlType(url: url)
        SDWebImageManager.shared().imageDownloader?.downloadImage(with: URL.init(string: url), options: SDWebImageDownloaderOptions.highPriority, progress: { (start, end, url) in
            
        }, completed: { (image, imageDate, error, finish) in
            let image = imageType == .DanDanUrl ? self.coreImage(image: (image)!) : image
            completedBlock(image, error, URL.init(string: url)!)
        })
        
    }
    
    func sd_imageView(url:String, imageView:UIImageView, completedBlock: SDWebImage.SDExternalCompletionBlock? = nil){
        imageView.sd_setImage(with: URL.init(string: url), placeholderImage: nil, options: .retryFailed, completed: completedBlock)
    }
    
    func coreImage(image:UIImage) ->UIImage{
        let sourceImageRef: CGImage = image.cgImage!
        let newCGImage = sourceImageRef.cropping(to: CGRect.init(x: 20, y: 0, width: image.size.width - 40, height: image.size.height))!
        let newImage = UIImage.init(cgImage: newCGImage)
        return newImage
    }
    
    func imageUrlType(url:String) ->ImageExtType {
        let strs = url.components(separatedBy: ".")
        switch strs[1] {
        case "ddimg":
            return .DanDanUrl
        default:
            return .DouBanUrl
        }
    }
}
