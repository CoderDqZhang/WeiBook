//
//  UIViewController+TalKingData.m
//  LiangPiao
//
//  Created by Zhang on 8/3/16.
//  Copyright © 2016 Meet. All rights reserved.
//

#import "UIViewController+TalKingData.h"
#import "TalkingData.h"
#import <objc/runtime.h>

static const void *TalKingDataPageName = &TalKingDataPageName;


@implementation UIViewController (TalKingData)
@dynamic talKingDataPageName;

- (NSString *)talKingDataPageName
{
    return objc_getAssociatedObject(self, TalKingDataPageName);
}

- (void)setTalKingDataPageName:(NSString *)talKingDataPageName
{
    objc_setAssociatedObject(self, TalKingDataPageName, talKingDataPageName, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"
- (void)viewDidDisappear:(BOOL)animated
{
    [TalkingData trackPageEnd:self.talKingDataPageName];
}

- (void)viewDidAppear:(BOOL)animated
{
    [TalkingData trackPageBegin:self.talKingDataPageName];
}
#pragma clang diagnostic pop


@end
