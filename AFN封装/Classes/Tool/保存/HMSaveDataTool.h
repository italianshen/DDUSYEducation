//
//  HMSaveDataTool.h
//  
//
//  Created by SZSYKT_iOSBasic_2 on 16/2/20.
//  Copyright © 2016年 heima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMSaveDataTool : NSObject

+ (void)setBool:(BOOL)b forKey:( NSString *)key;
+ (BOOL)boolForKey:(NSString *)key;

+ (void)setValue:(id)value forKey:(NSString *)key;
+ (NSString *)valueForKey:(NSString *)key;
@end
