
//
//  CXBJudgmentByte.m
//  车信帮3.0
//
//  Created by 刘耀宗 on 16/7/22.
//  Copyright © 2016年 lifuli. All rights reserved.
//

#import "CXBJudgmentByte.h"

@implementation CXBJudgmentByte
+(instancetype)shareJudgmentByte
{
    static id instance;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        instance=[[self alloc] init];
        
    });
    return instance;


}
- (int)stringConvertToInt:(NSString*)strtemp
{
    int strlength = 0;
    char* p = (char*)[strtemp cStringUsingEncoding:NSUnicodeStringEncoding];
    for (int i=0 ; i<[strtemp lengthOfBytesUsingEncoding:NSUnicodeStringEncoding] ;i++)
    {
        if (*p) {
            p++;
            strlength++;
        }
        else {
            p++;
        }
    }
    return strlength;//+1)/2;
}
@end
