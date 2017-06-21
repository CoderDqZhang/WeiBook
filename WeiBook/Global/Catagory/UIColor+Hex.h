//
//  UIColor+Hex.h
//  Meet
//
//  Created by Zhang on 6/2/16.
//  Copyright © 2016 Meet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)


+ (UIColor *)colorWithHex:(UInt32)hex andAlpha:(CGFloat)alpha;

+ (UIColor *)colorWithHex:(UInt32)hex;
+ (UIColor *)colorWithHexString:(id)input;
+ (UIColor *)colorWithHexString:(id)hexString andAlpha:(CGFloat)alpha;

- (UInt32)hexValue;

@end
