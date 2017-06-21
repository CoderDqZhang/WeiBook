//
//  TYTabTitleViewCell.m
//  TYPagerControllerDemo
//
//  Created by tany on 16/5/4.
//  Copyright © 2016年 tanyang. All rights reserved.
//

#import "TYTabTitleViewCell.h"

@interface TYTabTitleViewCell ()
@property (nonatomic, weak) UILabel *titleLabel;
@property (nonatomic, weak) UILabel *numberLabel;
@property (nonatomic, weak) UIView *numberContainer;

@end

@implementation TYTabTitleViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addTabTitleLabel];
        [self addTabNumberLabel];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self addTabTitleLabel];
        [self addTabNumberLabel];
    }
    return self;
}

- (void)addTabTitleLabel
{
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.font = [UIFont systemFontOfSize:15];
    titleLabel.textColor = [UIColor darkTextColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:titleLabel];
    _titleLabel = titleLabel;
}

- (void)addTabNumberLabel
{
    UIView *numberContainer = [[UIView alloc] init];
    numberContainer.layer.cornerRadius = 10;
    numberContainer.backgroundColor = [UIColor whiteColor];
    UILabel *numberLabel = [[UILabel alloc]init];
    numberLabel.font = [UIFont systemFontOfSize:10];
    numberLabel.textColor = [UIColor whiteColor];
//    numberLabel.backgroundColor = [UIColor colorWithHexString:MeProfileCollectViewItemSelect];
    numberLabel.layer.cornerRadius = 6;
    numberLabel.layer.masksToBounds = YES;
    numberLabel.textAlignment = NSTextAlignmentCenter;
    [numberContainer addSubview:numberLabel];
    [self.contentView addSubview:numberContainer];
    _numberLabel = numberLabel;
    _numberContainer = numberContainer;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGRect frame = self.contentView.bounds;
    _titleLabel.frame = frame;
    _numberLabel.frame = CGRectMake(2, 2, 18, 12);
    _numberContainer.frame = CGRectMake(frame.size.width - 22, frame.origin.y + 8, 22, 16);
    _numberContainer.backgroundColor = [UIColor whiteColor];
}

@end
