//
//  DDUProfileModel.m
//  DDU
//
//  Created by 沈士新 on 2017/4/13.
//  Copyright © 2017年 沈士新. All rights reserved.
//

#import "DDUProfileModel.h"

@implementation DDUProfileModel

+(NSMutableArray *)models{
    
    NSArray *sectionOne = [NSArray arrayWithObject:
                           @{@"iconName":@"calendar",   @"content":@"我的主页"}
                           ];
    NSArray *sectionTwo = [NSArray arrayWithObjects:
                           @{@"iconName":@"calendar",   @"content":@"我的签到"},
                           @{@"iconName":@"calendar",   @"content":@"我的积分"},
                           nil];
    
    NSArray *sectionThree = [NSArray arrayWithObjects:
                             @{@"iconName":@"calendar",   @"content":@"我的术业豆"},
                             @{@"iconName":@"calendar",   @"content":@"我的术业益友"},
                             nil];
    
    NSArray *sectionFour = [NSArray arrayWithObject:
                            @{@"iconName":@"calendar",   @"content":@"修改密码"}
                            ];
    NSArray *sectionFive = [NSArray arrayWithObjects:
                             @{@"iconName":@"calendar",   @"content":@"应用设置"},
                             @{@"iconName":@"calendar",   @"content":@"关于我们"},
                             nil];
    
    NSArray *dictArr =[NSArray arrayWithObjects:sectionOne,sectionTwo,sectionThree,sectionFour,sectionFive, nil];
    
    
    NSMutableArray *modelSectionArr =[NSMutableArray array];
    
    
    for (NSInteger i = 0; i < dictArr.count; ++i) {
        //里层字典数组
        NSArray *innerDictArr = dictArr[i];
        NSMutableArray *modelArr =[NSMutableArray array];
        
        for (NSDictionary *dict in innerDictArr) {
            DDUProfileModel *model =[DDUProfileModel modelWithDict:dict];
            [modelArr addObject:model];
        }
        [modelSectionArr addObject:modelArr];
    }
    return modelSectionArr;
}


+(instancetype)modelWithDict:(NSDictionary *)dict{

    return [[self alloc]initWithDict:dict];
    
}


-(instancetype)initWithDict:(NSDictionary *)dict{

    if (self =[super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}


-(NSString *)description{

    return [NSString stringWithFormat:@"icon %@-- content:%@",self.iconName,self.content];
}
@end
