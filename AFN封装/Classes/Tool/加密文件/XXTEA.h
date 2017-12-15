//
//  AppDelegate.m
//  XXTEA_iOS
//
//  Created by 王印 on 15/8/4.
//  Copyright (c) 2015年 wangyin. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface XXTEA : NSObject

+ (NSData *) encrypt:(NSData *)data key:(NSData *)key sign:(BOOL)sign;
+ (NSData *) encrypt:(NSData *)data stringKey:(NSString *)key sign:(BOOL)sign;

+ (NSString *) encryptToBase64String:(NSData *)data key:(NSData *)key sign:(BOOL)sign;
+ (NSString *) encryptToBase64String:(NSData *)data stringKey:(NSString *)key sign:(BOOL)sign;

+ (NSData *) encryptString:(NSString *)data key:(NSData *)key sign:(BOOL)sign;
+ (NSData *) encryptString:(NSString *)data stringKey:(NSString *)key sign:(BOOL)sign;

+ (NSString *) encryptStringToBase64String:(NSString *)data key:(NSData *)key sign:(BOOL)sign;
+ (NSString *) encryptStringToBase64String:(NSString *)data stringKey:(NSString *)key sign:(BOOL)sign;

+ (NSData *) decrypt:(NSData *)data key:(NSData *)key sign:(BOOL)sign ;
+ (NSData *) decrypt:(NSData *)data stringKey:(NSString *)key sign:(BOOL)sign ;

+ (NSData *) decryptBase64String:(NSString *)data key:(NSData *)key sign:(BOOL)sign;
+ (NSData *) decryptBase64String:(NSString *)data stringKey:(NSString *)key sign:(BOOL)sign ;

+ (NSString *) decryptToString:(NSData *)data key:(NSData *)key sign:(BOOL)sign ;
+ (NSString *) decryptToString:(NSData *)data stringKey:(NSString *)key sign:(BOOL)sign ;

+ (NSString *) decryptBase64StringToString:(NSString *)data key:(NSData *)key sign:(BOOL)sign ;
+ (NSString *) decryptBase64StringToString:(NSString *)data stringKey:(NSString *)key sign:(BOOL)sign ;

@end

@interface NSData (XXTEA)

- (NSData *) xxteaEncrypt:(NSData *)key sign:(BOOL)sign;
- (NSData *) xxteaDecrypt:(NSData *)key sign:(BOOL)sign ;

@end
