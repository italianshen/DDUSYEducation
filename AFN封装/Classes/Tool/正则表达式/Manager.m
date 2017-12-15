//
//  Manager.m
//  Contact
//
//  Created by zz on 14/12/29.
//  Copyright (c) 2014年 zz. All rights reserved.
//

#import "Manager.h"

@implementation Manager

+ (BOOL)validateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}


//手机号码验证
+ (BOOL)validateMobile:(NSString *)mobile
{
    
    
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex =@"^((13[0-9])|(17[0])|(17[7])|(14[57])|(15[012356789])|(17[678])|(18[0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}


//车牌号验证
+ (BOOL)validateCarNo:(NSString *)carNo
{
    NSString *carRegex = @"^[\u4e00-\u9fa5]{1}[a-zA-Z]{1}[a-zA-Z_0-9]{4}[a-zA-Z_0-9_\u4e00-\u9fa5]$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];

    return [carTest evaluateWithObject:carNo];
}


//车型
+ (BOOL)validateCarType:(NSString *)CarType
{
    NSString *CarTypeRegex = @"^[\u4E00-\u9FFF]+$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",CarTypeRegex];
    return [carTest evaluateWithObject:CarType];
}


//用户名
+ (BOOL)validateUserName:(NSString *)name
{
    NSString *userNameRegex = @"^[A-Za-z0-9]{6,20}+$";
    NSPredicate *userNamePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",userNameRegex];
    BOOL B = [userNamePredicate evaluateWithObject:name];
    return B;
}


//密码
+ (BOOL) validatePassword:(NSString *)passWord
{
    NSString *passWordRegex = @"^[a-zA-Z0-9]{6,20}+$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    return [passWordPredicate evaluateWithObject:passWord];
}


//昵称
+ (BOOL) validateNickname:(NSString *)nickname
{
    NSString *nicknameRegex = @"^[\u4e00-\u9fa5]{4,8}$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nicknameRegex];
    return [passWordPredicate evaluateWithObject:nickname];
}


//身份证号
+ (BOOL) validateIdentityCard: (NSString *)value
{
//    BOOL flag;
//    if (identityCard.length <= 0) {
//        flag = NO;
//        return flag;
//    }
//    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
//    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
//    return [identityCardPredicate evaluateWithObject:identityCard];
    value = [value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
      if ([value length] != 18) {
        return NO;
             }
       NSString *mmdd = @"(((0[13578]|1[02])(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)(0[1-9]|[12][0-9]|30))|(02(0[1-9]|[1][0-9]|2[0-8])))";
    NSString *leapMmdd = @"0229";
      NSString *year = @"(19|20)[0-9]{2}";
       NSString *leapYear = @"(19|20)(0[48]|[2468][048]|[13579][26])";
      NSString *yearMmdd = [NSString stringWithFormat:@"%@%@", year, mmdd];
    NSString *leapyearMmdd = [NSString stringWithFormat:@"%@%@", leapYear, leapMmdd];
      NSString *yyyyMmdd = [NSString stringWithFormat:@"((%@)|(%@)|(%@))", yearMmdd, leapyearMmdd, @"20000229"];
       NSString *area = @"(1[1-5]|2[1-3]|3[1-7]|4[1-6]|5[0-4]|6[1-5]|82|[7-9]1)[0-9]{4}";
     NSString *regex = [NSString stringWithFormat:@"%@%@%@", area, yyyyMmdd  , @"[0-9]{3}[0-9Xx]"];
 
   NSPredicate *regexTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
   if (![regexTest evaluateWithObject:value]) {
         return NO;
       }
   int summary = ([value substringWithRange:NSMakeRange(0,1)].intValue + [value substringWithRange:NSMakeRange(10,1)].intValue) *7
            + ([value substringWithRange:NSMakeRange(1,1)].intValue + [value substringWithRange:NSMakeRange(11,1)].intValue) *9
            + ([value substringWithRange:NSMakeRange(2,1)].intValue + [value substringWithRange:NSMakeRange(12,1)].intValue) *10
              + ([value substringWithRange:NSMakeRange(3,1)].intValue + [value substringWithRange:NSMakeRange(13,1)].intValue) *5
            + ([value substringWithRange:NSMakeRange(4,1)].intValue + [value substringWithRange:NSMakeRange(14,1)].intValue) *8
             + ([value substringWithRange:NSMakeRange(5,1)].intValue + [value substringWithRange:NSMakeRange(15,1)].intValue) *4
            + ([value substringWithRange:NSMakeRange(6,1)].intValue + [value substringWithRange:NSMakeRange(16,1)].intValue) *2
            + [value substringWithRange:NSMakeRange(7,1)].intValue *1 + [value substringWithRange:NSMakeRange(8,1)].intValue *6
              + [value substringWithRange:NSMakeRange(9,1)].intValue *3;
    NSInteger remainder = summary % 11;
    NSString *checkBit = @"";
      NSString *checkString = @"10X98765432";
     checkBit = [checkString substringWithRange:NSMakeRange(remainder,1)];// 判断校验位
     return [checkBit isEqualToString:[[value substringWithRange:NSMakeRange(17,1)] uppercaseString]];
}
//判断是否为整形：

+ (BOOL)validatePureInt:(NSString*)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}

//判断是否为浮点形：

+ (BOOL)validatePureFloat:(NSString*)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    float val;
    return[scan scanFloat:&val] && [scan isAtEnd];
}

+ (BOOL)validateNumber:(NSString *)string{
   
    if ([Manager validatePureFloat:string]||[Manager validatePureInt:string]) {
        return YES;
    }else{
        return NO;
    }
}

+(BOOL)isValidCreditNumber:(NSString*)value {
    BOOL result = NO;
    NSInteger length = [value length];
    if (length >= 13) {
        result = [Manager validateNumber:value];
        
        
        if (result)
        {
            NSInteger twoDigitBeginValue = [[value substringWithRange:NSMakeRange(0, 2)] integerValue];
            //VISA
            if([[value substringToIndex:1] isEqualToString:@"4"]) {
                if (13 == length||16 == length) {
                    result = TRUE;
                }else {
                    result = NO;
                }
            }
            //MasterCard
            else if(twoDigitBeginValue >= 51 && twoDigitBeginValue <= 55 && length == 16) {
                result = TRUE;
            }
            //American Express
            else if(([[value substringToIndex:2] isEqualToString:@"34"]||[[value substringToIndex:1] isEqualToString:@"37"]) && length == 15){
                result = TRUE;
            }
            //Discover
            else if([[value substringToIndex:4] isEqualToString:@"6011"]&& length == 16) {
                result = TRUE;
            }else {
                result = FALSE;
            }
        }
        if (result)
        {
            NSInteger digitValue;
            NSInteger checkSum = 0;
            NSInteger index = 0;
            NSInteger leftIndex;
            //even length, odd index
            if (0 == length%2) {
                index = 0;
                leftIndex = 1;
            }
            //odd length, even index
            else {
                index = 1;
                leftIndex = 0;
            }
            while (index < length) {
                digitValue = [[value substringWithRange:NSMakeRange(index, 1)] integerValue];
                digitValue = digitValue*2;
                if (digitValue >= 10)
                {
                    checkSum += digitValue/10 + digitValue%10;
                }
                else
                {
                    checkSum += digitValue;
                }
                digitValue = [[value substringWithRange:NSMakeRange(leftIndex, 1)] integerValue];
                checkSum += digitValue;
                index += 2;
                leftIndex += 2;
            }
            result = (0 == checkSum%10) ? TRUE:FALSE;
        }
    }else {
        result = NO;
    }
    return result;
}

@end
