//
//  UIWindow+Screenshot.h
//  LiangPiao
//
//  Created by Zhang on 29/12/2016.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWindow (Screenshot)

- (UIImage *)screenshot;
- (UIImage *)screenshotWithRect:(CGRect)rect;

@end
