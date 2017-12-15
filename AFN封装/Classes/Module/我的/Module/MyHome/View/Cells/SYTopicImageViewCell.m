//
//  SYTopicImageViewCell.m
//  AFN封装
//
//  Created by Danny on 2017/12/15.
//  Copyright © 2017年 大兵布莱恩特. All rights reserved.
//

#import "SYTopicImageViewCell.h"
@interface SYTopicImageViewCell()

@property (nonatomic, strong) UIImageView *iconView;

@end
@implementation SYTopicImageViewCell
#pragma mark - Intial
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUI];
    }
    return self;
}

#pragma mark - UI
- (void)setUpUI
{
    //banner
    _iconView =[[UIImageView alloc]init];
    _iconView.contentMode = UIViewContentModeScaleAspectFill;
    _iconView.image =[UIImage imageNamed:@"15954767_1353492149859"];
    _iconView.clipsToBounds = YES;
    [self.contentView addSubview:_iconView];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.contentView);
        make.trailing.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.contentView);
        make.bottom.mas_equalTo(self.contentView);
    }];
    
}
@end
