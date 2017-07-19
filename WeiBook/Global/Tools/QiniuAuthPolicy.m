//
//  QiniuAuthPolicy.m
//  WeiBook
//
//  Created by Zhang on 2017/7/19.
//  Copyright © 2017年 Zhang. All rights reserved.
//

#import "QiniuAuthPolicy.h"
#import <CommonCrypto/CommonDigest.h>
#include <CommonCrypto/CommonHMAC.h>
#import "QNUrlSafeBase64.h"
#import "QN_GTM_Base64.h"

@implementation QiniuAuthPolicy

//qiNiuSDK包含以下文件
+ (NSString*)dictionryToJSONString:(NSMutableDictionary *)dictionary
{
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionary options:NSJSONWritingPrettyPrinted error:&parseError];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

//AccessKey  以及SecretKey
+ (NSString *)token{
    return [QiniuAuthPolicy makeToken:@"xX-kcCyk_b1TmufkALFCKVXP53cPMVrF_TgErxx7" secretKey:@"7xMrZ-kt2D-BJOmoPGulHF47I4yQyjBgAm2myFIw"];
}

+ (NSString *) hmacSha1Key:(NSString*)key textData:(NSString*)text
{
    const char *cData  = [text cStringUsingEncoding:NSUTF8StringEncoding];
    const char *cKey = [key cStringUsingEncoding:NSUTF8StringEncoding];
    uint8_t cHMAC[CC_SHA1_DIGEST_LENGTH];
    CCHmac(kCCHmacAlgSHA1, cKey, strlen(cKey), cData, strlen(cData), cHMAC);
    NSData *HMAC = [[NSData alloc] initWithBytes:cHMAC length:CC_SHA1_DIGEST_LENGTH];
    NSString *hash = [QNUrlSafeBase64 encodeData:HMAC];
    return hash;
}

+ (NSString *)makeToken:(NSString *)accessKey secretKey:(NSString *)secretKey
{
    //名字
    NSString *baseName = [self marshal];
    baseName = [baseName stringByReplacingOccurrencesOfString:@" " withString:@""];
    baseName = [baseName stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    NSData   *baseNameData = [baseName dataUsingEncoding:NSUTF8StringEncoding];
    NSString *baseNameBase64 = [QNUrlSafeBase64 encodeData:baseNameData];
    NSString *secretKeyBase64 =  [QiniuAuthPolicy hmacSha1Key:secretKey textData:baseNameBase64];
    NSString *token = [NSString stringWithFormat:@"%@:%@:%@",  accessKey, secretKeyBase64, baseNameBase64];
    
    return token;
}

+ (NSString *)marshal
{
    time_t deadline;
    time(&deadline);
    //"ceshi" 是我们七牛账号下创建的储存空间名字“可以自定义”
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"topveda" forKey:@"scope"];
    //3464706673 是token有效期
    NSNumber *escapeNumber = [NSNumber numberWithLongLong:3464706673];
    [dic setObject:escapeNumber forKey:@"deadline"];
    NSString *json = [QiniuAuthPolicy dictionryToJSONString:dic];
    return json;
}

@end
