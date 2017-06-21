//
//  UIImage+QiNiuTools.h
//  Meet
//
//  Created by Zhang on 21/09/2016.
//  Copyright © 2016 Meet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (QiNiuTools)

+ (NSString *)imageWithUrl:(NSString *)url newImage:(CGSize)size;

+ (void)imageWithUrl:(NSString *)url newImage:(CGSize)size success:(void(^)(NSString *imageUrl))successBlock;

+ (NSString *)imageSize:(NSDictionary *)imageInfo newImageSize:(CGSize)imageSize;

@end
