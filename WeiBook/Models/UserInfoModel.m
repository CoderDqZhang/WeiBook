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

@interface Tail ()
@end
@implementation Tail




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
    Tail *copy = [Tail new];
    
    copy.token = [self.token copy];
    copy.userInfo = [self.userInfo copy];
    
    return copy;
}
@end


NSString *const kUserInfoAttentionNum = @"attentionNum";
NSString *const kUserInfoCity = @"city";
NSString *const kUserInfoCreatedAt = @"createdAt";
NSString *const kUserInfoFansNum = @"fansNum";
NSString *const kUserInfoHobbyTag = @"hobbyTag";
NSString *const kUserInfoIdField = @"id";
NSString *const kUserInfoIdentify = @"identify";
NSString *const kUserInfoIntroduction = @"introduction";
NSString *const kUserInfoInvitationCode = @"invitationCode";
NSString *const kUserInfoNickname = @"nickname";
NSString *const kUserInfoPhoto = @"photo";
NSString *const kUserInfoProfessionTag = @"professionTag";
NSString *const kUserInfoQrCode = @"qrCode";
NSString *const kUserInfoSex = @"sex";
NSString *const kUserInfoSocialUtility = @"socialUtility";
NSString *const kUserInfoStar = @"star";
NSString *const kUserInfoTails = @"tails";
NSString *const kUserInfoTitle = @"title";
NSString *const kUserInfoUserId = @"userId";

@interface UserInfo ()
@end
@implementation UserInfo




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kUserInfoAttentionNum] isKindOfClass:[NSNull class]]){
        self.attentionNum = dictionary[kUserInfoAttentionNum];
    }
    if(![dictionary[kUserInfoCity] isKindOfClass:[NSNull class]]){
        self.city = dictionary[kUserInfoCity];
    }
    if(![dictionary[kUserInfoCreatedAt] isKindOfClass:[NSNull class]]){
        self.createdAt = dictionary[kUserInfoCreatedAt];
    }
    if(![dictionary[kUserInfoFansNum] isKindOfClass:[NSNull class]]){
        self.fansNum = [dictionary[kUserInfoFansNum] integerValue];
    }
    
    if(![dictionary[kUserInfoHobbyTag] isKindOfClass:[NSNull class]]){
        self.hobbyTag = dictionary[kUserInfoHobbyTag];
    }
    if(![dictionary[kUserInfoIdField] isKindOfClass:[NSNull class]]){
        self.idField = dictionary[kUserInfoIdField];
    }
    if(![dictionary[kUserInfoIdentify] isKindOfClass:[NSNull class]]){
        self.identify = dictionary[kUserInfoIdentify];
    }
    if(![dictionary[kUserInfoIntroduction] isKindOfClass:[NSNull class]]){
        self.introduction = dictionary[kUserInfoIntroduction];
    }
    if(![dictionary[kUserInfoInvitationCode] isKindOfClass:[NSNull class]]){
        self.invitationCode = dictionary[kUserInfoInvitationCode];
    }
    if(![dictionary[kUserInfoNickname] isKindOfClass:[NSNull class]]){
        self.nickname = dictionary[kUserInfoNickname];
    }
    if(![dictionary[kUserInfoPhoto] isKindOfClass:[NSNull class]]){
        self.photo = dictionary[kUserInfoPhoto];
    }
    if(![dictionary[kUserInfoProfessionTag] isKindOfClass:[NSNull class]]){
        self.professionTag = dictionary[kUserInfoProfessionTag];
    }
    if(![dictionary[kUserInfoQrCode] isKindOfClass:[NSNull class]]){
        self.qrCode = dictionary[kUserInfoQrCode];
    }
    if(![dictionary[kUserInfoSex] isKindOfClass:[NSNull class]]){
        self.sex = dictionary[kUserInfoSex];
    }
    if(![dictionary[kUserInfoSocialUtility] isKindOfClass:[NSNull class]]){
        self.socialUtility = dictionary[kUserInfoSocialUtility];
    }
    if(![dictionary[kUserInfoStar] isKindOfClass:[NSNull class]]){
        self.star = dictionary[kUserInfoStar];
    }
    
    if(![dictionary[kUserInfoTitle] isKindOfClass:[NSNull class]]){
        self.title = dictionary[kUserInfoTitle];
    }
    if(![dictionary[kUserInfoUserId] isKindOfClass:[NSNull class]]){
        self.userId = dictionary[kUserInfoUserId];
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.attentionNum != nil){
        dictionary[kUserInfoAttentionNum] = self.attentionNum;
    }
    if(self.city != nil){
        dictionary[kUserInfoCity] = self.city;
    }
    if(self.createdAt != nil){
        dictionary[kUserInfoCreatedAt] = self.createdAt;
    }
    dictionary[kUserInfoFansNum] = @(self.fansNum);
    if(self.hobbyTag != nil){
        dictionary[kUserInfoHobbyTag] = self.hobbyTag;
    }
    if(self.idField != nil){
        dictionary[kUserInfoIdField] = self.idField;
    }
    if(self.identify != nil){
        dictionary[kUserInfoIdentify] = self.identify;
    }
    if(self.introduction != nil){
        dictionary[kUserInfoIntroduction] = self.introduction;
    }
    if(self.invitationCode != nil){
        dictionary[kUserInfoInvitationCode] = self.invitationCode;
    }
    if(self.nickname != nil){
        dictionary[kUserInfoNickname] = self.nickname;
    }
    if(self.photo != nil){
        dictionary[kUserInfoPhoto] = self.photo;
    }
    if(self.professionTag != nil){
        dictionary[kUserInfoProfessionTag] = self.professionTag;
    }
    if(self.qrCode != nil){
        dictionary[kUserInfoQrCode] = self.qrCode;
    }
    if(self.sex != nil){
        dictionary[kUserInfoSex] = self.sex;
    }
    if(self.socialUtility != nil){
        dictionary[kUserInfoSocialUtility] = self.socialUtility;
    }
    if(self.star != nil){
        dictionary[kUserInfoStar] = self.star;
    }
    
    if(self.title != nil){
        dictionary[kUserInfoTitle] = self.title;
    }
    if(self.userId != nil){
        dictionary[kUserInfoUserId] = self.userId;
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
    if(self.attentionNum != nil){
        [aCoder encodeObject:self.attentionNum forKey:kUserInfoAttentionNum];
    }
    if(self.city != nil){
        [aCoder encodeObject:self.city forKey:kUserInfoCity];
    }
    if(self.createdAt != nil){
        [aCoder encodeObject:self.createdAt forKey:kUserInfoCreatedAt];
    }
    [aCoder encodeObject:@(self.fansNum) forKey:kUserInfoFansNum];	if(self.hobbyTag != nil){
        [aCoder encodeObject:self.hobbyTag forKey:kUserInfoHobbyTag];
    }
    if(self.idField != nil){
        [aCoder encodeObject:self.idField forKey:kUserInfoIdField];
    }
    if(self.identify != nil){
        [aCoder encodeObject:self.identify forKey:kUserInfoIdentify];
    }
    if(self.introduction != nil){
        [aCoder encodeObject:self.introduction forKey:kUserInfoIntroduction];
    }
    if(self.invitationCode != nil){
        [aCoder encodeObject:self.invitationCode forKey:kUserInfoInvitationCode];
    }
    if(self.nickname != nil){
        [aCoder encodeObject:self.nickname forKey:kUserInfoNickname];
    }
    if(self.photo != nil){
        [aCoder encodeObject:self.photo forKey:kUserInfoPhoto];
    }
    if(self.professionTag != nil){
        [aCoder encodeObject:self.professionTag forKey:kUserInfoProfessionTag];
    }
    if(self.qrCode != nil){
        [aCoder encodeObject:self.qrCode forKey:kUserInfoQrCode];
    }
    if(self.sex != nil){
        [aCoder encodeObject:self.sex forKey:kUserInfoSex];
    }
    if(self.socialUtility != nil){
        [aCoder encodeObject:self.socialUtility forKey:kUserInfoSocialUtility];
    }
    if(self.star != nil){
        [aCoder encodeObject:self.star forKey:kUserInfoStar];
    }
    
    if(self.title != nil){
        [aCoder encodeObject:self.title forKey:kUserInfoTitle];
    }
    if(self.userId != nil){
        [aCoder encodeObject:self.userId forKey:kUserInfoUserId];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.attentionNum = [aDecoder decodeObjectForKey:kUserInfoAttentionNum];
    self.city = [aDecoder decodeObjectForKey:kUserInfoCity];
    self.createdAt = [aDecoder decodeObjectForKey:kUserInfoCreatedAt];
    self.fansNum = [[aDecoder decodeObjectForKey:kUserInfoFansNum] integerValue];
    self.hobbyTag = [aDecoder decodeObjectForKey:kUserInfoHobbyTag];
    self.idField = [aDecoder decodeObjectForKey:kUserInfoIdField];
    self.identify = [aDecoder decodeObjectForKey:kUserInfoIdentify];
    self.introduction = [aDecoder decodeObjectForKey:kUserInfoIntroduction];
    self.invitationCode = [aDecoder decodeObjectForKey:kUserInfoInvitationCode];
    self.nickname = [aDecoder decodeObjectForKey:kUserInfoNickname];
    self.photo = [aDecoder decodeObjectForKey:kUserInfoPhoto];
    self.professionTag = [aDecoder decodeObjectForKey:kUserInfoProfessionTag];
    self.qrCode = [aDecoder decodeObjectForKey:kUserInfoQrCode];
    self.sex = [aDecoder decodeObjectForKey:kUserInfoSex];
    self.socialUtility = [aDecoder decodeObjectForKey:kUserInfoSocialUtility];
    self.star = [aDecoder decodeObjectForKey:kUserInfoStar];
    self.title = [aDecoder decodeObjectForKey:kUserInfoTitle];
    self.userId = [aDecoder decodeObjectForKey:kUserInfoUserId];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    UserInfo *copy = [UserInfo new];
    
    copy.attentionNum = [self.attentionNum copy];
    copy.city = [self.city copy];
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
    copy.qrCode = [self.qrCode copy];
    copy.sex = [self.sex copy];
    copy.socialUtility = [self.socialUtility copy];
    copy.star = [self.star copy];
    copy.title = [self.title copy];
    copy.userId = [self.userId copy];
    
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
            _instance.tails = [Tail findLastObject];
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
        self.tails = [[Tail alloc] initWithDictionary:dictionary[kUserInfoModelTails]];
    }
    
    if(![dictionary[kUserInfoModelUsername] isKindOfClass:[NSNull class]]){
        self.username = dictionary[kUserInfoModelUsername];
    }
    return self;
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
    //    NSFileManager *fileManager = [NSFileManager defaultManager];
    //    return [fileManager fileExistsAtPath:kEncodedObjectPath_User];
}

+ (BOOL)logout
{
    
    //    NSFileManager *fileManager = [NSFileManager defaultManager];
    //    NSError *error;
    //    BOOL result = [fileManager removeItemAtPath:kEncodedObjectPath_User error:&error];
    [UserInfoModel shareInstance].createdAt = 0;
    [UserInfoModel shareInstance].username = nil;
    [UserInfoModel shareInstance].state = 0;
    [UserInfoModel shareInstance].lastLoginAt = nil;
    [UserInfoModel shareInstance].email = 0;
    [UserInfoModel shareInstance].tails = nil;
    [UserInfoModel shareInstance].mobile = nil;
    [UserInfoModel shareInstance].idField = nil;
    return [[UserInfoModel shareInstance] deleteObject];;
}

@end
