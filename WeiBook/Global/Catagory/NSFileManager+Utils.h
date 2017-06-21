//The MIT License (MIT)
//
//Copyright (c) <2014> <Yama>
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in
//all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//THE SOFTWARE.

#import <Foundation/Foundation.h>

@interface NSFileManager (Utils)

/**
 Documents
 */
+ (NSString *)document;
- (NSString *)document;
+ (NSString *)documentWithPath:(NSArray *)values;
- (NSString *)documentWithPath:(NSArray *)values;

/**
 Library
 */
+ (NSString *)library;
- (NSString *)library;
+ (NSString *)libraryWithPath:(NSArray *)values;
- (NSString *)libraryWithPath:(NSArray *)values;

/**
 Library/Caches
 */
+ (NSString *)libraryCaches;
- (NSString *)libraryCaches;
+ (NSString *)libraryCachesWithPath:(NSArray *)values;
- (NSString *)libraryCachesWithPath:(NSArray *)values;

/**
 Library/Application Support
 */
+ (NSString *)applicationSupport;
- (NSString *)applicationSupport;
+ (NSString *)applicationSupportWithPath:(NSArray *)values;
- (NSString *)applicationSupportWithPath:(NSArray *)values;

/**
 tmp
 */
+ (NSString *)tmp;
- (NSString *)tmp;
+ (NSString *)tmpWithPath:(NSArray *)values;
- (NSString *)tmpWithPath:(NSArray *)values;



+ (NSString *)bundleWithPath:(NSString *)value;
- (NSString *)bundleWithPath:(NSString *)value;

/**
 file exists
 */
- (BOOL)exists:(NSString *)path;

/**
 directory size
 */
- (unsigned long long int)folderSize:(NSString *)folderPath;


/**
 unbackup
 */
- (void)unbackup:(NSString *)path;

/**
 To create, if necessary
 */
- (void)mkdirIfNeeded:(NSString *)path error:(NSError **)error;

/**
 You want to remove it if necessary
 */
- (void)rmfileIfNeeded:(NSString *)path error:(NSError **)error;

/**
 move
 */
- (void)mvToPath:(NSString *)toPath fromPath:(NSString *)fromPath error:(NSError **)error;

/**
 copy
 */
- (void)cpToPath:(NSString *)toPath fromPath:(NSString *)fromPath error:(NSError **)error;

@end

