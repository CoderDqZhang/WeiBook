//
//  TYTabButtonPagerControlle.m
//  TYPagerControllerDemo
//
//  Created by tany on 16/5/11.
//  Copyright © 2016年 tanyang. All rights reserved.
//

#import "TYTabButtonPagerController.h"

@interface TYTabButtonPagerController ()
@property (nonatomic, assign) CGFloat selectFontScale;
@end

#define kUnderLineViewHeight 2

@implementation TYTabButtonPagerController

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self configureTabButtonPropertys];
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
        [self configureTabButtonPropertys];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (!self.delegate) {
        self.delegate = self;
    }
    
    if (!self.dataSource) {
        self.dataSource = self;
    }
    _selectFontScale = self.normalTextFont.pointSize/self.selectedTextFont.pointSize;
    
    [self configureSubViews];
}


- (void)reloadNumberOfPageIndex:(NSArray *)numberOfTitle
{
    for (NSInteger i = 0; i < numberOfTitle.count; i ++ ) {
        TYTabTitleViewCell *titleCell = (TYTabTitleViewCell *)[self cellForIndex:i];
        if (![numberOfTitle[i] isEqualToString:@"0"]) {
            titleCell.numberLabel.hidden = NO;
            titleCell.numberLabel.text = numberOfTitle[i];
        }else{
            titleCell.numberLabel.hidden = YES;
        }
    }
}


- (void)setNumberOfControllerBar:(NSString *)number controller:(NSInteger)controller
{
    TYTabTitleViewCell *titleCell = (TYTabTitleViewCell *)[self cellForIndex:controller];
    if (![number isEqualToString:@"0"]) {
        titleCell.numberLabel.hidden = NO;
        titleCell.numberLabel.text = number;
    }else{
        titleCell.numberLabel.hidden = YES;
    }
}

- (void)configureSubViews
{
    // progress
    self.progressView.backgroundColor = _progressColor;
    self.progressView.layer.cornerRadius = _progressRadius;
    self.progressView.layer.masksToBounds = YES;
    
    // tabBar
    self.pagerBarView.backgroundColor = _pagerBarColor;
    self.collectionViewBar.backgroundColor = _collectionViewBarColor;
}

- (void)configureTabButtonPropertys
{
    self.cellSpacing = 2;
    self.cellEdging = 3;
    
    self.barStyle = TYPagerBarStyleProgressView;
    
    _normalTextColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
    _selectedTextColor = [UIColor redColor];
    
    _pagerBarColor = [UIColor whiteColor];
    _collectionViewBarColor = [UIColor clearColor];
    
    _progressColor = [UIColor redColor];
    _progressRadius = self.progressHeight/2;
    
    [self registerCellClass:[TYTabTitleViewCell class] isContainXib:NO];
}

- (void)setBarStyle:(TYPagerBarStyle)barStyle
{
    [super setBarStyle:barStyle];
    
    switch (barStyle) {
        case TYPagerBarStyleProgressView:
            self.progressWidth = 0;
            self.progressHeight = kUnderLineViewHeight;
            self.progressEdging = 3;
            break;
        case TYPagerBarStyleProgressBounceView:
            self.progressHeight = kUnderLineViewHeight;
            self.progressWidth = 30;
            break;
        case TYPagerBarStyleCoverView:
            self.progressWidth = 0;
            self.progressHeight = self.contentTopEdging-8;
            self.progressEdging = -self.progressHeight/4;
            break;
        default:
            break;
    }
    
    if (barStyle == TYPagerBarStyleCoverView) {
        self.progressColor = [UIColor lightGrayColor];
    }else {
        self.progressColor = [UIColor redColor];
    }
    self.progressRadius = self.progressHeight/2;
}

#pragma mark - private

- (void)transitionFromCell:(UICollectionViewCell<TYTabTitleCellProtocol> *)fromCell toCell:(UICollectionViewCell<TYTabTitleCellProtocol> *)toCell
{
    if (fromCell) {
        fromCell.titleLabel.textColor = self.normalTextColor;
        fromCell.transform = CGAffineTransformMakeScale(self.selectFontScale, self.selectFontScale);
    }
    
    if (toCell) {
        toCell.titleLabel.textColor = self.selectedTextColor;
        toCell.transform = CGAffineTransformIdentity;
    }
}

- (void)transitionFromCell:(UICollectionViewCell<TYTabTitleCellProtocol> *)fromCell toCell:(UICollectionViewCell<TYTabTitleCellProtocol> *)toCell progress:(CGFloat)progress
{
    CGFloat currentTransform = (1.0 - self.selectFontScale)*progress;
    fromCell.transform = CGAffineTransformMakeScale(1.0-currentTransform, 1.0-currentTransform);
    toCell.transform = CGAffineTransformMakeScale(self.selectFontScale+currentTransform, self.selectFontScale+currentTransform);
    
    CGFloat narR,narG,narB,narA;
    [self.normalTextColor getRed:&narR green:&narG blue:&narB alpha:&narA];
    CGFloat selR,selG,selB,selA;
    [self.selectedTextColor getRed:&selR green:&selG blue:&selB alpha:&selA];
    CGFloat detalR = narR - selR ,detalG = narG - selG,detalB = narB - selB,detalA = narA - selA;
    
    fromCell.titleLabel.textColor = [UIColor colorWithRed:selR+detalR*progress green:selG+detalG*progress blue:selB+detalB*progress alpha:selA+detalA*progress];
    toCell.titleLabel.textColor = [UIColor colorWithRed:narR-detalR*progress green:narG-detalG*progress blue:narB-detalB*progress alpha:narA-detalA*progress];
//    NSLog(@"%f",progress);
//    if (progress == 0) {
//        [self transitionFromCell:toCell toCell:fromCell];
//    }

}

#pragma mark - TYPagerControllerDataSource

- (NSInteger)numberOfControllersInPagerController
{
    NSAssert(NO, @"you must impletement method numberOfControllersInPagerController");
    return 0;
}

- (UIViewController *)pagerController:(TYPagerController *)pagerController controllerForIndex:(NSInteger)index
{
    NSAssert(NO, @"you must impletement method pagerController:controllerForIndex:");
    return nil;
}

#pragma mark - TYTabPagerControllerDelegate

- (void)pagerController:(TYTabPagerController *)pagerController configreCell:(TYTabTitleViewCell *)cell forItemTitle:(NSString *)title atIndexPath:(NSIndexPath *)indexPath
{
    TYTabTitleViewCell *titleCell = (TYTabTitleViewCell *)cell;
    titleCell.titleLabel.text = title;
    titleCell.titleLabel.font = self.selectedTextFont;
}

- (void)pagerController:(TYTabPagerController *)pagerController configreCell:(UICollectionViewCell *)cell forItemNumber:(NSString *)number atIndexPath:(NSIndexPath *)indexPath
{
    TYTabTitleViewCell *titleCell = (TYTabTitleViewCell *)cell;
    if ([number isEqualToString:@"0"]) {
        titleCell.numberContainer.hidden = YES;
    }else{
        titleCell.numberContainer.hidden = NO;
    }
    titleCell.numberLabel.text = number;
//    titleCell.numberLabel.backgroundColor = [UIColor colorWithHexString:MeProfileCollectViewItemSelect];
    titleCell.numberLabel.font = [UIFont systemFontOfSize:8];
}


- (void)pagerController:(TYTabPagerController *)pagerController transitionFromeCell:(UICollectionViewCell<TYTabTitleCellProtocol> *)fromCell toCell:(UICollectionViewCell<TYTabTitleCellProtocol> *)toCell animated:(BOOL)animated
{
    if (animated) {
        [UIView animateWithDuration:self.animateDuration animations:^{
            [self transitionFromCell:(TYTabTitleViewCell *)fromCell toCell:(TYTabTitleViewCell *)toCell];
        }];
    }else{
        [self transitionFromCell:fromCell toCell:toCell];
    }
}

- (void)pagerController:(TYTabPagerController *)pagerController transitionFromeCell:(UICollectionViewCell<TYTabTitleCellProtocol> *)fromCell toCell:(UICollectionViewCell<TYTabTitleCellProtocol> *)toCell progress:(CGFloat)progress
{
    [self transitionFromCell:fromCell toCell:toCell progress:progress];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
