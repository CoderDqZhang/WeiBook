//
//  NSFileManager+Cache.h
//  Kaoban
//
//  Created by Jane on 9/7/15.
//  Copyright (c) 2015 kaoban. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (Cache)

//计算单个文件大小
+(float)fileSizeAtPath:(NSString *)path;
//计算目录大小
+(float)folderSizeAtPath:(NSString *)path;
//清理缓存文件
+(void)clearCache:(NSString *)path;

@end
