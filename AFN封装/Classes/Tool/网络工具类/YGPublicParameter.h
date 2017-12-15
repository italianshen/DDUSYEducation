//
//  YGPublicParameter.h
//  gjpt
//
//  Created by Gamin on 16/8/10.
//  Copyright © 2016年 CQYGKJ. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "SBJson4Writer.h"

@interface YGPublicParameter : NSObject


+ (NSMutableDictionary *)publicDictParameter;

// 字典转换成JSON格式
+ (NSString *)returnJSONWithDictionary:(NSDictionary * )theDict;
// JSON转换为字典
+ (NSDictionary *)returnDictionaryWithJSONString:(NSString *)theJSON;
+ (NSDictionary *)returnOnceDictionaryWithJSONString:(NSString *)theJSON;

@end
