//
//  UIColor+_Hex.h
//  SinaDemo
//
//  Created by Xiaomin on 16/4/1.
//  Copyright © 2016年 Xiaomin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (_Hex)
+ (UIColor *)colorWithHexValue:(uint)hexValue andAlpha:(float)alpha;
+ (UIColor *)colorWithHexString:(NSString *)hexString andAlpha:(float)alpha;

- (NSString *)hexString;
@end
