//
//  HMSaveDataTool.m
//
//
//  Created by SZSYKT_iOSBasic_2 on 16/2/20.
//  Copyright © 2016年 heima. All rights reserved.
//

#import "HMSaveDataTool.h"

@implementation HMSaveDataTool
+ (void)setBool:(BOOL)b forKey:( NSString *)key {
     if (key.length == 0) return;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:b forKey:key];
}

+ (BOOL)boolForKey:(NSString *)key {
     if (key.length == 0) return NO;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults boolForKey:key];
}

+ (void)setValue:(id)value forKey:(NSString *)key {
    if (key.length == 0) return;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:value forKey:key];
}

+ (NSString *)valueForKey:(NSString *)key {
    if (key.length == 0) return nil;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults valueForKey:key];
}


@end
