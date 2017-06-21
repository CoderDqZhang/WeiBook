//
//  NSFileManager+Utils.m
//
//  Created by GIGASJAPAN yamamoto on 12/05/16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSFileManager+Utils.h"
#import "sys/xattr.h"


@implementation NSFileManager (Utils)

- (BOOL)exists:(NSString *)path
{
    return [self fileExistsAtPath:path];
}

+ (NSString *)document
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [paths objectAtIndex:0];
}
+ (NSString *)library
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    return [paths objectAtIndex:0];
}
+ (NSString *)libraryCaches
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    return [paths objectAtIndex:0];
}
+ (NSString *)applicationSupport
{
    NSString *applicationSupportDirectory = [NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES) lastObject];
    NSError *error = nil;
    if ( ![[NSFileManager defaultManager] fileExistsAtPath:applicationSupportDirectory isDirectory:NULL] ) {
        if (![[NSFileManager defaultManager]
              createDirectoryAtPath:applicationSupportDirectory
              withIntermediateDirectories:NO
              attributes:nil
              error:&error])
        {
            NSAssert(NO, ([NSString stringWithFormat:@"Failed to create App Support directory %@ : %@", applicationSupportDirectory,error]));
            NSLog(@"Error creating application support directory at %@ : %@",applicationSupportDirectory,error);
            return nil;
        }
    }
    return applicationSupportDirectory;
}

+ (NSString *)tmp
{
    return [NSHomeDirectory() stringByAppendingPathComponent:@"tmp"];
}

+ (NSString *)documentWithPath:(NSArray *)values
{
    return [[self class] _baseDirectory:[NSFileManager document] path:values];
}
+ (NSString *)libraryWithPath:(NSArray *)values
{
    return [[self class] _baseDirectory:[NSFileManager library] path:values];
}
+ (NSString *)libraryCachesWithPath:(NSArray *)values
{
    return [[self class] _baseDirectory:[NSFileManager libraryCaches] path:values];
}
+ (NSString *)applicationSupportWithPath:(NSArray *)values
{
    return [[self class] _baseDirectory:[NSFileManager applicationSupport] path:values];
}
+ (NSString *)tmpWithPath:(NSArray *)values
{
    return [[self class] _baseDirectory:[NSFileManager tmp] path:values];
}
+ (NSString *)bundleWithPath:(NSString *)value
{
    return [[NSBundle mainBundle] pathForResource:value ofType:nil];
}

+ (NSString *)_baseDirectory:(NSString *)base path:(NSArray *)values
{
    NSString *returnPath = [NSString string];
	for (NSString *str in values) returnPath = [returnPath stringByAppendingPathComponent:str];
    return [base stringByAppendingPathComponent:returnPath];
}

- (NSString *)document
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [paths objectAtIndex:0];
}
- (NSString *)library
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    return [paths objectAtIndex:0];
}
- (NSString *)libraryCaches
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    return [paths objectAtIndex:0];
}
- (NSString *)applicationSupport
{
    NSString *applicationSupportDirectory = [NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES) lastObject];
    NSError *error = nil;
    if ( ![[NSFileManager defaultManager] fileExistsAtPath:applicationSupportDirectory isDirectory:NULL] ) {
        if (![[NSFileManager defaultManager]
              createDirectoryAtPath:applicationSupportDirectory
              withIntermediateDirectories:NO
              attributes:nil
              error:&error])
        {
            NSAssert(NO, ([NSString stringWithFormat:@"Failed to create App Support directory %@ : %@", applicationSupportDirectory,error]));
            NSLog(@"Error creating application support directory at %@ : %@",applicationSupportDirectory,error);
            return nil;
        }
    }
    return applicationSupportDirectory;
}
- (NSString *)tmp
{
    return [NSHomeDirectory() stringByAppendingPathComponent:@"tmp"];
}

- (NSString *)documentWithPath:(NSArray *)values
{
    return [self _baseDirectory:[NSFileManager document] path:values];
}
- (NSString *)libraryWithPath:(NSArray *)values
{
    return [self _baseDirectory:[NSFileManager library] path:values];
}
- (NSString *)libraryCachesWithPath:(NSArray *)values
{
    return [self _baseDirectory:[NSFileManager libraryCaches] path:values];
}
- (NSString *)applicationSupportWithPath:(NSArray *)values
{
    return [self _baseDirectory:[NSFileManager applicationSupport] path:values];
}
- (NSString *)tmpWithPath:(NSArray *)values
{
    return [self _baseDirectory:[NSFileManager tmp] path:values];
}
- (NSString *)bundleWithPath:(NSString *)value
{
    return [[NSBundle mainBundle] pathForResource:value ofType:nil];
}

- (NSString *)_baseDirectory:(NSString *)base path:(NSArray *)values
{
    NSString *returnPath = [NSString string];
	for (NSString *str in values) returnPath = [returnPath stringByAppendingPathComponent:str];
    return [base stringByAppendingPathComponent:returnPath];
}

- (unsigned long long int)folderSize:(NSString *)folderPath {
    NSArray *filesArray = [self subpathsOfDirectoryAtPath:folderPath error:nil];
    NSEnumerator *filesEnumerator = [filesArray objectEnumerator];
    NSString *fileName;
    unsigned long long int fileSize = 0;
    
    while (fileName = [filesEnumerator nextObject]) {
        NSDictionary *fileDictionary = [self attributesOfItemAtPath:[folderPath stringByAppendingPathComponent:fileName] error:nil];
        fileSize += [fileDictionary fileSize];
    }
    
    return fileSize;
}

- (void)unbackup:(NSString *)path
{
    if ( [[[UIDevice currentDevice] systemVersion] compare:@"5.1" options:NSNumericSearch] != NSOrderedAscending ) {
        NSError *error = nil;
        [[NSURL fileURLWithPath:path] setResourceValue:[NSNumber numberWithBool:YES] forKey:NSURLIsExcludedFromBackupKey error:&error];
    } else {
        const char *cPath = [path fileSystemRepresentation];
        const char *cKey = "com.apple.MobileBackup";
        u_int8_t v = 1;
        setxattr( cPath, cKey, &v, sizeof( v ), 0, 0 );
    }
}

- (void)mkdirIfNeeded:(NSString *)path error:(NSError **)error
{
    if (![self fileExistsAtPath:path]) {
        [self createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:error];
    }
}

- (void)rmfileIfNeeded:(NSString *)path error:(NSError **)error
{
    if ([self fileExistsAtPath:path]) {
        [self removeItemAtPath:path error:error];
    }
}

- (void)mvToPath:(NSString *)toPath fromPath:(NSString *)fromPath error:(NSError **)error
{
    [self rmfileIfNeeded:toPath error:error];
    if (error) return;
    [self moveItemAtPath:fromPath toPath:toPath error:error];
}

- (void)cpToPath:(NSString *)toPath fromPath:(NSString *)fromPath error:(NSError **)error
{
    [self rmfileIfNeeded:toPath error:error];
    if (error) return;
    [self copyItemAtPath:fromPath toPath:toPath error:error];
}


@end
