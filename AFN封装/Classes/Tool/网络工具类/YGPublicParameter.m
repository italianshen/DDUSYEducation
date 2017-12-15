//
//  YGPublicParameter.m
//  gjpt
//
//  Created by Gamin on 16/8/10.
//  Copyright © 2016年 CQYGKJ. All rights reserved.
//

#import "YGPublicParameter.h"
#import <sys/utsname.h>


@implementation YGPublicParameter

+ (NSMutableDictionary *)publicDictParameter {
    // 获取版本号
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"Info" ofType:@"plist"];
    NSMutableDictionary *infoDictionary = [NSMutableDictionary dictionaryWithContentsOfFile:bundlePath];
    // 当前应用软件版本  比如：1.0.1
    NSString *appVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    // 手机系统版本
    NSString *phoneVersion = [[UIDevice currentDevice] systemVersion];
    // 设备名称
    NSString *phoneName =  [self fetchDeviceType];
    // UUID
    NSString *uuid = [self deviceUUID];
    
    NSMutableDictionary *mdict = [[NSMutableDictionary alloc] init];
    [mdict setObject:@"2" forKey:@"platform"];
    [mdict setObject:uuid forKey:@"devicenumber"];
     [mdict setObject:@"" forKey:@"devicebrand"];
    [mdict setObject:phoneName forKey:@"devicename"];
    [mdict setObject:phoneVersion forKey:@"deviceversion"];
    [mdict setObject:appVersion forKey:@"version"];
    [mdict setObject:@"" forKey:@"guid"];
    [mdict setObject:@"" forKey:@"source"];

    return mdict;
}

// 当前时间时间戳
+ (NSString *)curTimestamp {
    NSString *dateStr = @"198412280000";
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyyMMddHHmm"];
    [formatter setTimeZone: [NSTimeZone timeZoneWithName:@"Asia/Chongqing"]];
    NSDate *baseDate = [formatter dateFromString:dateStr];
    NSTimeInterval time =[[NSDate date]timeIntervalSinceDate:baseDate];
    NSString *timeSpStr =  [NSString stringWithFormat:@"%.f",time*1000];
    return timeSpStr;
}
+ (NSString *)timeString
{
    NSString *dateStr = @"198412280000";
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyyMMddHHmm"];
    [formatter setTimeZone: [NSTimeZone timeZoneWithName:@"Asia/Chongqing"]];
    NSDate *baseDate = [formatter dateFromString:dateStr];
    NSTimeInterval time =[[NSDate date]timeIntervalSinceDate:baseDate];
    NSString *times =  [NSString stringWithFormat:@"%.f",time*1000];
    return times;
}
+ (NSString *)fetchDeviceType {
    //Hardware Model硬件模型
    struct utsname u;
    uname(&u);
    NSString *platform = [NSString stringWithCString:u.machine];
    if ([platform isEqualToString:@"iPhone1,1"]) return @"iphone";
    if ([platform isEqualToString:@"iPhone1,2"]) return @"iphone3gs";
    if ([platform isEqualToString:@"iPhone2,1"]) return @"iphone3gs";
    if ([platform isEqualToString:@"iPhone3,1"]) return @"iphone4";
    if ([platform isEqualToString:@"iPhone3,2"]) return @"iPhone4";
    if ([platform isEqualToString:@"iPhone3,3"]) return @"iPhone4";
    if ([platform isEqualToString:@"iPhone4,1"]) return @"iphone4s";
    if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone5";
    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone5";
    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone5c";
    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone5c";
    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone5s";
    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone5s";
    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone6 Plus";
    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone6";
    // tudo
    if ([platform isEqualToString:@"iPhone8,1"]) return @"iPhone6s";
    if ([platform isEqualToString:@"iPhone8,2"]) return @"iPhone6s Plus";
    if ([platform isEqualToString:@"iPhone9,1"]) return @"iPhone7 Plus";
    if ([platform isEqualToString:@"iPhone9,2"]) return @"iPhone7";
    if ([platform isEqualToString:@"iPhone10,1"]) return @"iPhone7s";
    if ([platform isEqualToString:@"iPhone10,2"]) return @"iPhone7s Plus";
    
    if ([platform isEqualToString:@"iPod1,1"])   return @"ipodtouch";
    if ([platform isEqualToString:@"iPod2,1"])   return @"ipodtouch";
    if ([platform isEqualToString:@"iPod3,1"])   return @"ipodtouch";
    if ([platform isEqualToString:@"iPod4,1"])   return @"ipodtouch";
    if ([platform isEqualToString:@"iPod5,1"])   return @"ipodtouch";
    
    if ([platform isEqualToString:@"iPad1,1"])   return @"ipad";
    if ([platform isEqualToString:@"iPad2,1"])   return @"ipad2";
    if ([platform isEqualToString:@"iPad2,2"])   return @"iPad2";
    if ([platform isEqualToString:@"iPad2,3"])   return @"iPad2";
    if ([platform isEqualToString:@"iPad2,4"])   return @"iPad2";
    if ([platform isEqualToString:@"iPad2,5"])   return @"iPad Mini";
    if ([platform isEqualToString:@"iPad2,6"])   return @"iPad Mini";
    if ([platform isEqualToString:@"iPad2,7"])   return @"iPad Mini";
    if ([platform isEqualToString:@"iPad3,1"])   return @"ipad3";
    if ([platform isEqualToString:@"iPad3,2"])   return @"iPad3";
    if ([platform isEqualToString:@"iPad3,3"])   return @"iPad3";
    if ([platform isEqualToString:@"iPad3,4"])   return @"iPad4";
    if ([platform isEqualToString:@"iPad3,5"])   return @"iPad4";
    if ([platform isEqualToString:@"iPad3,6"])   return @"iPad4";
    if ([platform isEqualToString:@"iPad4,1"])   return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,2"])   return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,3"])   return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,4"])   return @"iPad Mini";
    if ([platform isEqualToString:@"iPad4,5"])   return @"iPad Mini";
    if ([platform isEqualToString:@"iPad4,6"])   return @"iPad Mini";
    
    if ([platform isEqualToString:@"i386"])      return @"iphone4";
    if ([platform isEqualToString:@"x86_64"])    return @"iphone4";
    return platform;
}

+ (NSString *)deviceUUID {
    NSUUID *myDevice =[UIDevice currentDevice].identifierForVendor;
    NSString *uuid = myDevice.UUIDString;
    return uuid;
}

// 字典转换成JSON格式
+ (NSString *)returnJSONWithDictionary:(NSDictionary * )theDict {
    NSString *returnStr = nil;
//    SBJson4Writer *writer = [[SBJson4Writer alloc] init];
//    returnStr = [writer stringWithObject:theDict];
    return returnStr;
}

// JSON转换为字典
+ (NSDictionary *)returnDictionaryWithJSONString:(NSString *)theJSON {
    NSMutableDictionary *tempDict = [[self dictionaryWithJSONString:theJSON] mutableCopy];
    if(tempDict){
        NSInteger code = [[tempDict objectForKey:@"code"] integerValue];
        if(code == 1){
            NSString *jsonOne = [tempDict objectForKey:@"ResultJson"];
            if([jsonOne isEqualToString:@""]){
                return nil;
            }
            NSDictionary *dictOne = [self dictionaryWithJSONString:jsonOne];
            if(!dictOne){
                return nil;
            }
            [tempDict setObject:dictOne forKey:@"ResultJson"];
        }
    }
    return tempDict;
}

+ (NSDictionary *)returnOnceDictionaryWithJSONString:(NSString *)theJSON {
    NSMutableDictionary *tempDict = [[self dictionaryWithJSONString:theJSON] mutableCopy];

    return tempDict;
}

+ (NSDictionary *)dictionaryWithJSONString:(NSString *)theJSON {
    NSData *jsonData = [[NSData alloc] initWithData:[theJSON dataUsingEncoding:NSUTF8StringEncoding]];
    NSError *errorJSON = [[NSError alloc] init];
    NSDictionary *tempDict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&errorJSON];
    return tempDict;
}

@end
