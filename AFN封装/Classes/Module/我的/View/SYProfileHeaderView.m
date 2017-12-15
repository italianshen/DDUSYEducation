//
//  SYProfileHeaderView.m
//  AFN封装
//
//  Created by Danny on 2017/12/15.
//  Copyright © 2017年 大兵布莱恩特. All rights reserved.
//

#import "SYProfileHeaderView.h"

@implementation SYProfileHeaderView

/**
 工厂方法
 
 @return 返回视图
 */
+(instancetype)profileHeaderView{
    return [[[NSBundle mainBundle]loadNibNamed:@"SYProfileHeaderView" owner:self options:nil ] lastObject];
}

@end
