//
//  UserInfoModel.m
//  WeiBook
//
//  Created by Zhang on 2017/6/22.
//  Copyright © 2017年 Zhang. All rights reserved.
//

#import "UserInfoModel.h"

NSString *const kTailToken = @"token";
NSString *const kTailUserInfo = @"userInfo";

@interface UserInfoTail ()
@end

@implementation UserInfoTail

/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kTailToken] isKindOfClass:[NSNull class]]){
        self.token = dictionary[kTailToken];
    }
    if(![dictionary[kTailUserInfo] isKindOfClass:[NSNull class]]){
        self.userInfo = [[UserInfo alloc] initWithDictionary:dictionary[kTailUserInfo]];
    }
    
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.token != nil){
        dictionary[kTailToken] = self.token;
    }
    if(self.userInfo != nil){
        dictionary[kTailUserInfo] = [self.userInfo toDictionary];
    }
    return dictionary;
    
}

/**
 * Implementation of NSCoding encoding method
 */
/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    if(self.token != nil){
        [aCoder encodeObject:self.token forKey:kTailToken];
    }
    if(self.userInfo != nil){
        [aCoder encodeObject:self.userInfo forKey:kTailUserInfo];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.token = [aDecoder decodeObjectForKey:kTailToken];
    self.userInfo = [aDecoder decodeObjectForKey:kTailUserInfo];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    UserInfoTail *copy = [UserInfoTail new];
    
    copy.token = [self.token copy];
    copy.userInfo = [self.userInfo copy];
    
    return copy;
}
@end


NSString *const kRootClassAddress = @"address";
NSString *const kRootClassAttentionNum = @"attentionNum";
NSString *const kRootClassCity = @"city";
NSString *const kRootClassCompany = @"company";
NSString *const kRootClassCreatedAt = @"createdAt";
NSString *const kRootClassFansNum = @"fansNum";
NSString *const kRootClassHobbyTag = @"hobbyTag";
NSString *const kRootClassIdField = @"id";
NSString *const kRootClassIdentify = @"identify";
NSString *const kRootClassIntroduction = @"introduction";
NSString *const kRootClassInvitationCode = @"invitationCode";
NSString *const kRootClassNickname = @"nickname";
NSString *const kRootClassPhoto = @"photo";
NSString *const kRootClassProfessionTag = @"professionTag";
NSString *const kRootClassQq = @"qq";
NSString *const kRootClassQrCode = @"qrCode";
NSString *const kRootClassSex = @"sex";
NSString *const kRootClassSocialUtility = @"socialUtility";
NSString *const kRootClassStar = @"star";
NSString *const kRootClassTitle = @"title";
NSString *const kRootClassUserId = @"userId";
NSString *const kRootClassWeixin = @"weixin";

@interface UserInfo ()
@end
@implementation UserInfo

/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kRootClassAddress] isKindOfClass:[NSNull class]]){
        self.address = dictionary[kRootClassAddress];
    }
    if(![dictionary[kRootClassAttentionNum] isKindOfClass:[NSNull class]]){
        self.attentionNum = dictionary[kRootClassAttentionNum];
    }
    if(![dictionary[kRootClassCity] isKindOfClass:[NSNull class]]){
        self.city = dictionary[kRootClassCity];
    }
    if(![dictionary[kRootClassCompany] isKindOfClass:[NSNull class]]){
        self.company = dictionary[kRootClassCompany];
    }
    if(![dictionary[kRootClassCreatedAt] isKindOfClass:[NSNull class]]){
        self.createdAt = dictionary[kRootClassCreatedAt];
    }
    if(![dictionary[kRootClassFansNum] isKindOfClass:[NSNull class]]){
        self.fansNum = [dictionary[kRootClassFansNum] integerValue];
    }
    
    if(![dictionary[kRootClassHobbyTag] isKindOfClass:[NSNull class]]){
        self.hobbyTag = dictionary[kRootClassHobbyTag];
    }
    if(![dictionary[kRootClassIdField] isKindOfClass:[NSNull class]]){
        self.idField = dictionary[kRootClassIdField];
    }
    if(![dictionary[kRootClassIdentify] isKindOfClass:[NSNull class]]){
        self.identify = dictionary[kRootClassIdentify];
    }
    if(![dictionary[kRootClassIntroduction] isKindOfClass:[NSNull class]]){
        self.introduction = dictionary[kRootClassIntroduction];
    }
    if(![dictionary[kRootClassInvitationCode] isKindOfClass:[NSNull class]]){
        self.invitationCode = dictionary[kRootClassInvitationCode];
    }
    if(![dictionary[kRootClassNickname] isKindOfClass:[NSNull class]]){
        self.nickname = dictionary[kRootClassNickname];
    }
    if(![dictionary[kRootClassPhoto] isKindOfClass:[NSNull class]]){
        self.photo = dictionary[kRootClassPhoto];
    }
    if(![dictionary[kRootClassProfessionTag] isKindOfClass:[NSNull class]]){
        self.professionTag = dictionary[kRootClassProfessionTag];
    }
    if(![dictionary[kRootClassQq] isKindOfClass:[NSNull class]]){
        self.qq = dictionary[kRootClassQq];
    }
    if(![dictionary[kRootClassQrCode] isKindOfClass:[NSNull class]]){
        self.qrCode = dictionary[kRootClassQrCode];
    }
    if(![dictionary[kRootClassSex] isKindOfClass:[NSNull class]]){
        self.sex = dictionary[kRootClassSex];
    }
    if(![dictionary[kRootClassSocialUtility] isKindOfClass:[NSNull class]]){
        self.socialUtility = dictionary[kRootClassSocialUtility];
    }
    if(![dictionary[kRootClassStar] isKindOfClass:[NSNull class]]){
        self.star = dictionary[kRootClassStar];
    }
    if(![dictionary[kRootClassTitle] isKindOfClass:[NSNull class]]){
        self.title = dictionary[kRootClassTitle];
    }
    if(![dictionary[kRootClassUserId] isKindOfClass:[NSNull class]]){
        self.userId = dictionary[kRootClassUserId];
    }
    if(![dictionary[kRootClassWeixin] isKindOfClass:[NSNull class]]){
        self.weixin = dictionary[kRootClassWeixin];
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.address != nil){
        dictionary[kRootClassAddress] = self.address;
    }
    if(self.attentionNum != nil){
        dictionary[kRootClassAttentionNum] = self.attentionNum;
    }
    if(self.city != nil){
        dictionary[kRootClassCity] = self.city;
    }
    if(self.company != nil){
        dictionary[kRootClassCompany] = self.company;
    }
    if(self.createdAt != nil){
        dictionary[kRootClassCreatedAt] = self.createdAt;
    }
    dictionary[kRootClassFansNum] = @(self.fansNum);
    if(self.hobbyTag != nil){
        dictionary[kRootClassHobbyTag] = self.hobbyTag;
    }
    if(self.idField != nil){
        dictionary[kRootClassIdField] = self.idField;
    }
    if(self.identify != nil){
        dictionary[kRootClassIdentify] = self.identify;
    }
    if(self.introduction != nil){
        dictionary[kRootClassIntroduction] = self.introduction;
    }
    if(self.invitationCode != nil){
        dictionary[kRootClassInvitationCode] = self.invitationCode;
    }
    if(self.nickname != nil){
        dictionary[kRootClassNickname] = self.nickname;
    }
    if(self.photo != nil){
        dictionary[kRootClassPhoto] = self.photo;
    }
    if(self.professionTag != nil){
        dictionary[kRootClassProfessionTag] = self.professionTag;
    }
    if(self.qq != nil){
        dictionary[kRootClassQq] = self.qq;
    }
    if(self.qrCode != nil){
        dictionary[kRootClassQrCode] = self.qrCode;
    }
    if(self.sex != nil){
        dictionary[kRootClassSex] = self.sex;
    }
    if(self.socialUtility != nil){
        dictionary[kRootClassSocialUtility] = self.socialUtility;
    }
    if(self.star != nil){
        dictionary[kRootClassStar] = self.star;
    }
    if(self.title != nil){
        dictionary[kRootClassTitle] = self.title;
    }
    if(self.userId != nil){
        dictionary[kRootClassUserId] = self.userId;
    }
    if(self.weixin != nil){
        dictionary[kRootClassWeixin] = self.weixin;
    }
    return dictionary;
    
}

/**
 * Implementation of NSCoding encoding method
 */
/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    if(self.address != nil){
        [aCoder encodeObject:self.address forKey:kRootClassAddress];
    }
    if(self.attentionNum != nil){
        [aCoder encodeObject:self.attentionNum forKey:kRootClassAttentionNum];
    }
    if(self.city != nil){
        [aCoder encodeObject:self.city forKey:kRootClassCity];
    }
    if(self.company != nil){
        [aCoder encodeObject:self.company forKey:kRootClassCompany];
    }
    if(self.createdAt != nil){
        [aCoder encodeObject:self.createdAt forKey:kRootClassCreatedAt];
    }
    [aCoder encodeObject:@(self.fansNum) forKey:kRootClassFansNum];	if(self.hobbyTag != nil){
        [aCoder encodeObject:self.hobbyTag forKey:kRootClassHobbyTag];
    }
    if(self.idField != nil){
        [aCoder encodeObject:self.idField forKey:kRootClassIdField];
    }
    if(self.identify != nil){
        [aCoder encodeObject:self.identify forKey:kRootClassIdentify];
    }
    if(self.introduction != nil){
        [aCoder encodeObject:self.introduction forKey:kRootClassIntroduction];
    }
    if(self.invitationCode != nil){
        [aCoder encodeObject:self.invitationCode forKey:kRootClassInvitationCode];
    }
    if(self.nickname != nil){
        [aCoder encodeObject:self.nickname forKey:kRootClassNickname];
    }
    if(self.photo != nil){
        [aCoder encodeObject:self.photo forKey:kRootClassPhoto];
    }
    if(self.professionTag != nil){
        [aCoder encodeObject:self.professionTag forKey:kRootClassProfessionTag];
    }
    if(self.qq != nil){
        [aCoder encodeObject:self.qq forKey:kRootClassQq];
    }
    if(self.qrCode != nil){
        [aCoder encodeObject:self.qrCode forKey:kRootClassQrCode];
    }
    if(self.sex != nil){
        [aCoder encodeObject:self.sex forKey:kRootClassSex];
    }
    if(self.socialUtility != nil){
        [aCoder encodeObject:self.socialUtility forKey:kRootClassSocialUtility];
    }
    if(self.star != nil){
        [aCoder encodeObject:self.star forKey:kRootClassStar];
    }
    if(self.title != nil){
        [aCoder encodeObject:self.title forKey:kRootClassTitle];
    }
    if(self.userId != nil){
        [aCoder encodeObject:self.userId forKey:kRootClassUserId];
    }
    if(self.weixin != nil){
        [aCoder encodeObject:self.weixin forKey:kRootClassWeixin];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.address = [aDecoder decodeObjectForKey:kRootClassAddress];
    self.attentionNum = [aDecoder decodeObjectForKey:kRootClassAttentionNum];
    self.city = [aDecoder decodeObjectForKey:kRootClassCity];
    self.company = [aDecoder decodeObjectForKey:kRootClassCompany];
    self.createdAt = [aDecoder decodeObjectForKey:kRootClassCreatedAt];
    self.fansNum = [[aDecoder decodeObjectForKey:kRootClassFansNum] integerValue];
    self.hobbyTag = [aDecoder decodeObjectForKey:kRootClassHobbyTag];
    self.idField = [aDecoder decodeObjectForKey:kRootClassIdField];
    self.identify = [aDecoder decodeObjectForKey:kRootClassIdentify];
    self.introduction = [aDecoder decodeObjectForKey:kRootClassIntroduction];
    self.invitationCode = [aDecoder decodeObjectForKey:kRootClassInvitationCode];
    self.nickname = [aDecoder decodeObjectForKey:kRootClassNickname];
    self.photo = [aDecoder decodeObjectForKey:kRootClassPhoto];
    self.professionTag = [aDecoder decodeObjectForKey:kRootClassProfessionTag];
    self.qq = [aDecoder decodeObjectForKey:kRootClassQq];
    self.qrCode = [aDecoder decodeObjectForKey:kRootClassQrCode];
    self.sex = [aDecoder decodeObjectForKey:kRootClassSex];
    self.socialUtility = [aDecoder decodeObjectForKey:kRootClassSocialUtility];
    self.star = [aDecoder decodeObjectForKey:kRootClassStar];
    self.title = [aDecoder decodeObjectForKey:kRootClassTitle];
    self.userId = [aDecoder decodeObjectForKey:kRootClassUserId];
    self.weixin = [aDecoder decodeObjectForKey:kRootClassWeixin];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    UserInfo *copy = [UserInfo new];
    
    copy.address = [self.address copy];
    copy.attentionNum = [self.attentionNum copy];
    copy.city = [self.city copy];
    copy.company = [self.company copy];
    copy.createdAt = [self.createdAt copy];
    copy.fansNum = self.fansNum;
    copy.hobbyTag = [self.hobbyTag copy];
    copy.idField = [self.idField copy];
    copy.identify = [self.identify copy];
    copy.introduction = [self.introduction copy];
    copy.invitationCode = [self.invitationCode copy];
    copy.nickname = [self.nickname copy];
    copy.photo = [self.photo copy];
    copy.professionTag = [self.professionTag copy];
    copy.qq = [self.qq copy];
    copy.qrCode = [self.qrCode copy];
    copy.sex = [self.sex copy];
    copy.socialUtility = [self.socialUtility copy];
    copy.star = [self.star copy];
    copy.title = [self.title copy];
    copy.userId = [self.userId copy];
    copy.weixin = [self.weixin copy];
    
    return copy;
}
@end



NSString *const kUserInfoModelCreatedAt = @"createdAt";
NSString *const kUserInfoModelEmail = @"email";
NSString *const kUserInfoModelIdField = @"id";
NSString *const kUserInfoModelLastLoginAt = @"lastLoginAt";
NSString *const kUserInfoModelMobile = @"mobile";
NSString *const kUserInfoModelState = @"state";
NSString *const kUserInfoModelTails = @"tails";
NSString *const kUserInfoModelUsername = @"username";


#define kEncodedObjectPath_User ([[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"UserInfo"])

static UserInfoModel *_instance = nil;
@interface UserInfoModel ()
@end



@implementation UserInfoModel

+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if ([UserInfoModel findAll].count > 0) {
            _instance =  [UserInfoModel findLastObject];
            _instance.tails = [UserInfoTail findLastObject];
            _instance.tails.userInfo = [UserInfo findLastObject];
        }else{
            _instance = [[UserInfoModel alloc] init];
        }
        
    });
    return _instance;
}

/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kUserInfoModelCreatedAt] isKindOfClass:[NSNull class]]){
        self.createdAt = [dictionary[kUserInfoModelCreatedAt] integerValue];
    }
    
    if(![dictionary[kUserInfoModelEmail] isKindOfClass:[NSNull class]]){
        self.email = dictionary[kUserInfoModelEmail];
    }
    if(![dictionary[kUserInfoModelIdField] isKindOfClass:[NSNull class]]){
        self.idField = dictionary[kUserInfoModelIdField];
    }
    if(![dictionary[kUserInfoModelLastLoginAt] isKindOfClass:[NSNull class]]){
        self.lastLoginAt = dictionary[kUserInfoModelLastLoginAt];
    }
    if(![dictionary[kUserInfoModelMobile] isKindOfClass:[NSNull class]]){
        self.mobile = dictionary[kUserInfoModelMobile];
    }
    if(![dictionary[kUserInfoModelState] isKindOfClass:[NSNull class]]){
        self.state = [dictionary[kUserInfoModelState] integerValue];
    }
    
    if(![dictionary[kUserInfoModelTails] isKindOfClass:[NSNull class]]){
        self.tails = [[UserInfoTail alloc] initWithDictionary:dictionary[kUserInfoModelTails]];
    }
    
    if(![dictionary[kUserInfoModelUsername] isKindOfClass:[NSNull class]]){
        self.username = dictionary[kUserInfoModelUsername];
    }
    return self;
}

+ (void)toUserInstance:(UserInfoModel *)userInfo {
    [UserInfoModel shareInstance].createdAt = userInfo.createdAt;
    [UserInfoModel shareInstance].username = userInfo.username;
    [UserInfoModel shareInstance].state = userInfo.state;
    [UserInfoModel shareInstance].lastLoginAt = userInfo.lastLoginAt;
    [UserInfoModel shareInstance].email = userInfo.email;
    [UserInfoModel shareInstance].mobile = userInfo.mobile;
    [UserInfoModel shareInstance].idField = userInfo.idField;
    [UserInfoModel shareInstance].username = userInfo.username;
    [UserInfoModel shareInstance].tails = userInfo.tails;
    [UserInfoModel shareInstance].tails.userInfo = userInfo.tails.userInfo;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    dictionary[kUserInfoModelCreatedAt] = @(self.createdAt);
    if(self.email != nil){
        dictionary[kUserInfoModelEmail] = self.email;
    }
    if(self.idField != nil){
        dictionary[kUserInfoModelIdField] = self.idField;
    }
    if(self.lastLoginAt != nil){
        dictionary[kUserInfoModelLastLoginAt] = self.lastLoginAt;
    }
    if(self.mobile != nil){
        dictionary[kUserInfoModelMobile] = self.mobile;
    }
    dictionary[kUserInfoModelState] = @(self.state);
    if(self.tails != nil){
        dictionary[kUserInfoModelTails] = [self.tails toDictionary];
    }
    if(self.username != nil){
        dictionary[kUserInfoModelUsername] = self.username;
    }
    return dictionary;
    
}

/**
 * Implementation of NSCoding encoding method
 */
/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:@(self.createdAt) forKey:kUserInfoModelCreatedAt];	if(self.email != nil){
        [aCoder encodeObject:self.email forKey:kUserInfoModelEmail];
    }
    if(self.idField != nil){
        [aCoder encodeObject:self.idField forKey:kUserInfoModelIdField];
    }
    if(self.lastLoginAt != nil){
        [aCoder encodeObject:self.lastLoginAt forKey:kUserInfoModelLastLoginAt];
    }
    if(self.mobile != nil){
        [aCoder encodeObject:self.mobile forKey:kUserInfoModelMobile];
    }
    [aCoder encodeObject:@(self.state) forKey:kUserInfoModelState];	if(self.tails != nil){
        [aCoder encodeObject:self.tails forKey:kUserInfoModelTails];
    }
    if(self.username != nil){
        [aCoder encodeObject:self.username forKey:kUserInfoModelUsername];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.createdAt = [[aDecoder decodeObjectForKey:kUserInfoModelCreatedAt] integerValue];
    self.email = [aDecoder decodeObjectForKey:kUserInfoModelEmail];
    self.idField = [aDecoder decodeObjectForKey:kUserInfoModelIdField];
    self.lastLoginAt = [aDecoder decodeObjectForKey:kUserInfoModelLastLoginAt];
    self.mobile = [aDecoder decodeObjectForKey:kUserInfoModelMobile];
    self.state = [[aDecoder decodeObjectForKey:kUserInfoModelState] integerValue];
    self.tails = [aDecoder decodeObjectForKey:kUserInfoModelTails];
    self.username = [aDecoder decodeObjectForKey:kUserInfoModelUsername];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    UserInfoModel *copy = [UserInfoModel new];
    
    copy.createdAt = self.createdAt;
    copy.email = [self.email copy];
    copy.idField = [self.idField copy];
    copy.lastLoginAt = [self.lastLoginAt copy];
    copy.mobile = [self.mobile copy];
    copy.state = self.state;
    copy.tails = [self.tails copy];
    copy.username = [self.username copy];
    
    return copy;
}

+ (BOOL)isLoggedIn
{
    if ([UserInfoModel findAll].count > 0) {
        return YES;
    }else{
        return NO;
    }
}

+ (BOOL)logout
{
    [UserInfoModel shareInstance].createdAt = 0;
    [UserInfoModel shareInstance].username = nil;
    [UserInfoModel shareInstance].state = 0;
    [UserInfoModel shareInstance].lastLoginAt = nil;
    [UserInfoModel shareInstance].email = 0;
    [UserInfoModel shareInstance].tails = nil;
    [UserInfoModel shareInstance].mobile = nil;
    [UserInfoModel shareInstance].idField = nil;
    [[UserInfoModel shareInstance].tails deleteObject];
    [[UserInfoModel shareInstance].tails.userInfo deleteObject];
    return [[UserInfoModel shareInstance] deleteObject];;
}

@end
