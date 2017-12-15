//
//  syCourseCell.m
//  AFN封装
//
//  Created by 刘耀宗 on 2017/12/11.
//  Copyright © 2017年 大兵布莱恩特. All rights reserved.
//

#import "syCourseCell.h"

@implementation syCourseCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.contentView.backgroundColor=[UIColor whiteColor];
    self.contentView.layer.cornerRadius=4;
    self.contentView.layer.masksToBounds=YES;
}

@end
