//
//  UserInfoModel.h
//  WeiBook
//
//  Created by Zhang on 2017/6/22.
//  Copyright © 2017年 Zhang. All rights reserved.
//

#import "JKDBModel.h"

#import <UIKit/UIKit.h>




@interface UserInfo : JKDBModel

@property (nonatomic, strong) NSObject * attentionNum;
@property (nonatomic, strong) NSObject * city;
@property (nonatomic, strong) NSObject * createdAt;
@property (nonatomic, assign) NSInteger fansNum;
@property (nonatomic, strong) NSObject * hobbyTag;
@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSString * identify;
@property (nonatomic, strong) NSString * introduction;
@property (nonatomic, strong) NSString * invitationCode;
@property (nonatomic, strong) NSObject * nickname;
@property (nonatomic, strong) NSString * photo;
@property (nonatomic, strong) NSObject * professionTag;
@property (nonatomic, strong) NSString * qrCode;
@property (nonatomic, strong) NSString * sex;
@property (nonatomic, strong) NSObject * socialUtility;
@property (nonatomic, strong) NSString * star;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * userId;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end

@interface Tail : JKDBModel

@property (nonatomic, strong) NSString * token;
@property (nonatomic, strong) UserInfo * userInfo;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end

@interface UserInfoModel : JKDBModel

@property (nonatomic, assign) NSInteger createdAt;
@property (nonatomic, strong) NSString * email;
@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSObject * lastLoginAt;
@property (nonatomic, strong) NSString * mobile;
@property (nonatomic, assign) NSInteger state;
@property (nonatomic, strong) Tail * tails;
@property (nonatomic, strong) NSString * username;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

+ (instancetype)shareInstance;

+ (BOOL)logout;

+ (BOOL)isLoggedIn;

@end
