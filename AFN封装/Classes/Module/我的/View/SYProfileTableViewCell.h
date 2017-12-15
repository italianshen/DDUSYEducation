//
//  SYProfileTableViewCell.h
//  AFN封装
//
//  Created by Danny on 2017/12/15.
//  Copyright © 2017年 大兵布莱恩特. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DDUProfileModel;

@interface SYProfileTableViewCell : UITableViewCell



/**
 cell工厂方法

 @return 返回cell
 */
+(instancetype)profileTableViewCell;

@property (nonatomic, strong) DDUProfileModel *model;

@end
