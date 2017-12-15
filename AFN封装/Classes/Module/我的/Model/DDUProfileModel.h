//
//  DDUProfileModel.h
//  DDU
//
//  Created by 沈士新 on 2017/4/13.
//  Copyright © 2017年 沈士新. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDUProfileModel : NSObject
//DDU个人信息模型
@property (nonatomic, copy) NSString *iconName;
@property (nonatomic, copy) NSString *content;


+(NSMutableArray *)models;

+(instancetype)modelWithDict:(NSDictionary *)dict;

@end
