//
//  ExpressDeliveryNet.m
//  LiangPiao
//
//  Created by Zhang on 2017/3/19.
//  Copyright © 2017年 Zhang. All rights reserved.
//

#import "ExpressDeliveryNet.h"
#import <CommonCrypto/CommonDigest.h>

@implementation ExpressDeliveryNet

+ (instancetype)shareInstance{
    static ExpressDeliveryNet *expressDeliveryNet = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        expressDeliveryNet = [[ExpressDeliveryNet alloc] init];
    });
    return expressDeliveryNet;
}

- (void)requestExpressDelivreyNetOrder:(NSDictionary *)dic url:(NSString *)url clouse:(ExpressDeliveryClouse)clouse
{
    NSDictionary *headers = @{ @"content-type": @"application/x-www-form-urlencoded",
                               @"cache-control": @"no-cache",
                               @"postman-token": @"670bcadb-9b3e-74b1-1ea6-330c4492d1f9" };
    
    NSMutableData *postData = [[NSMutableData alloc] initWithData:[[NSString stringWithFormat:@"RequestType=%@",[dic objectForKey:@"RequestType"]]  dataUsingEncoding:NSUTF8StringEncoding]];
    [postData appendData:[[NSString stringWithFormat:@"&DataType=%@",[dic objectForKey:@"DataType"]] dataUsingEncoding:NSUTF8StringEncoding]];
    [postData appendData:[[NSString stringWithFormat:@"&EBusinessID=%@",[dic objectForKey:@"EBusinessID"]] dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSDictionary *requestData = [dic objectForKey:@"RequestData"];
    NSString *requestString = [self DataTOjsonString:requestData];
    
    NSString *md5 = [self md5:[NSString stringWithFormat:@"%@%@",requestString,[dic objectForKey:@"key"]]];
    NSString *dataSigin = [self urlString:[self base64EncodedString:md5]];
    NSString *requestStr = [self urlString:requestString];
    
    [postData appendData:[[NSString stringWithFormat:@"&DataSign=%@", dataSigin] dataUsingEncoding:NSUTF8StringEncoding]];
    [postData appendData:[[NSString stringWithFormat:@"&RequestData=%@",requestStr] dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:10.0];
    [request setHTTPMethod:@"POST"];
    [request setAllHTTPHeaderFields:headers];
    [request setHTTPBody:postData];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
                                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                    if (error) {
                                                    } else {
                                                        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
                                                        if (httpResponse.statusCode == 200) {
                                                            NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
                                                            clouse(jsonDict);
                                                            
                                                        }else{
                                                        }
                                                    }
                                                }];
    [dataTask resume];
}

-(NSString*)DataTOjsonString:(id)object
{
    NSString *jsonString = nil;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else { 
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]; 
    } 
    return jsonString; 
}



- (NSString *)urlString:(NSString *)str {
    str = [str stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLHostAllowedCharacterSet]];
    return str;
}

- (NSString *)md5:(NSString *)str {
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, strlen(cStr), result ); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

- (NSString *)base64EncodedString:(NSString *)str {
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    return [data base64EncodedStringWithOptions:0];
}

@end
