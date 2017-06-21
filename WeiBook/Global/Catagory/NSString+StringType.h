//
//  NSString+StringType.h
//  Meet
//
//  Created by Zhang on 6/28/16.
//  Copyright © 2016 Meet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (StringType)

/**
 *  判断是否全部为数字
 *
 *  @param string 输入字符串
 *
 *  @return Yes(NO)
 */
+ (BOOL)isPureInt:(NSString*)string;
/**
 *  判断是否为数字字母下划线组成
 *
 *  @param string 输入字符串
 *
 */
+ (BOOL)isWeixinNum:(NSString *)string;
/**
 *  判断是否是电话号码
 *
 *  @param mobile 输入字符串
 *
 */
+ (BOOL) isValidateMobile:(NSString *)mobile;
/**
 *  判断是否包含中文
 *
 *  @param str 输入字符串
 *
 */
+ (BOOL)IsChinese:(NSString *)str;
/**
 *  判断是否是身份证号码
 *
 *  @param IDNumber 输入字符串
 *
 */
+ (BOOL)isCorrect:(NSString *)IDNumber;
/**
 *  判断是否是邮箱格式
 *
 *  @param email 输入字符串
 *
 */
+ (BOOL) validateEmail:(NSString *)email;

/**
 *  检测是否包含特殊字符
 *
 *
 */
+ (BOOL)isHaveSpecialCharacters:(NSString *)string;

/**
 *  md5加密
 *
 */
+ (NSString *)md5:(NSString *)str;

@end
