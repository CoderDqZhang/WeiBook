//
//  UIImage+PureColor.h
//  Kaoban
//
//  Created by Jane on 8/11/15.
//  Copyright (c) 2015 kaoban. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (PureColor)

+(UIImage *) getImageFromURL:(NSString *)fileURL;

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;
+(UIImage *) createImageWithColor: (UIColor *) color;
@end
