//
//  UIColor+_Hex.m
//  SinaDemo
//
//  Created by Xiaomin on 16/4/1.
//  Copyright © 2016年 Xiaomin. All rights reserved.
//

#import "UIColor+_Hex.h"

@implementation UIColor (_Hex)
+ (UIColor *)colorWithHexValue:(uint)hexValue andAlpha:(float)alpha {
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 green:((float)((hexValue & 0xFF00) >> 8))/255.0 blue:((float)(hexValue & 0xFF))/255.0 alpha:alpha];
}

+ (UIColor *)colorWithHexString:(NSString *)hexString andAlpha:(float)alpha {
    UIColor *col;
    hexString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@"0x"];
    uint hexValue;
    if ([[NSScanner scannerWithString:hexString] scanHexInt:&hexValue]) {
        col = [self colorWithHexValue:hexValue andAlpha:alpha];
    } else {
        NSLog(@"ERROR: calling [UIColor colorWithHexString:andAlpha] with an invalid hex string: '%@'", hexString);
        col = [self blackColor];
    }
    return col;
}

- (NSString *)hexString
{
    NSString *hex = @"";
    
    // This method only works for RGB colors
    if (self && CGColorGetNumberOfComponents(self.CGColor) == 4) {
        // Get the red, green and blue components
        const CGFloat *components = CGColorGetComponents(self.CGColor);
        
        // These components range from 0.0 till 1.0 and need to be converted to 0 till 255
        CGFloat red, green, blue;
        red = roundf(components[0] * 255.0);
        green = roundf(components[1] * 255.0);
        blue = roundf(components[2] * 255.0);
        
        // Convert with %02x (use 02 to always get two chars)
        hex = [[NSString alloc]initWithFormat:@"#%02x%02x%02x", (int)red, (int)green, (int)blue];
    }
    
    return hex;
}

@end
