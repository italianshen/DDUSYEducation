//
//  NSMutableDictionary+CcExtensionDic.m
//  新项目
//
//  Created by 刘耀宗 on 2016/11/22.
//  Copyright © 2016年 刘耀宗. All rights reserved.
//

#import "NSMutableDictionary+CcExtensionDic.h"

@implementation NSMutableDictionary (CcExtensionDic)
-(void)setKey:(NSString *)key forValue:(NSString *)value
{
    [self setValue:value forKey:key];
    
}


@end
