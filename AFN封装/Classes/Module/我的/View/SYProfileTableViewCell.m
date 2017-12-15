//
//  SYProfileTableViewCell.m
//  AFN封装
//
//  Created by Danny on 2017/12/15.
//  Copyright © 2017年 大兵布莱恩特. All rights reserved.
//

#import "SYProfileTableViewCell.h"
 #import "DDUProfileModel.h"
@interface SYProfileTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end
@implementation SYProfileTableViewCell

/**
 cell工厂方法
 
 @return 返回cell
 */
+(instancetype)profileTableViewCell{
    return [[[NSBundle mainBundle]loadNibNamed:@"SYProfileTableViewCell" owner:self options:nil ] lastObject];
}

-(void)setModel:(DDUProfileModel *)model{
    _model = model;
    
    self.iconView.image =[UIImage imageNamed:model.iconName];
    self.nameLabel.text = model.content;
}

@end
