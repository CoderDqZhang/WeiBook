//
//  UIViewController+hideExcessLine.m
//  Kaoban
//
//  Created by Jane on 8/24/15.
//  Copyright (c) 2015 kaoban. All rights reserved.
//

#import "UIViewController+hideExcessLine.h"

@implementation UIViewController (hideExcessLine)

-(void)hideExcessLine:(UITableView *)tableViews{
    
    UIView *view=[[UIView alloc] init];
    view.backgroundColor=[UIColor clearColor];
    [tableViews setTableFooterView:view];
}


@end
