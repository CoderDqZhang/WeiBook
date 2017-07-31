//
//  AudioWrapper.h
//  WeiBook
//
//  Created by Zhang on 31/07/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AudioWrapper : NSObject

+ (void)audioPCMtoMP3 :(NSString *)audioFileSavePath :(NSString *)mp3FilePath;

@end
