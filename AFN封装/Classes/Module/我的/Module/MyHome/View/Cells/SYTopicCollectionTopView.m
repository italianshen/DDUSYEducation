//
//  SYTopicCollectionTopView.m
//  AFN封装
//
//  Created by Danny on 2017/12/15.
//  Copyright © 2017年 大兵布莱恩特. All rights reserved.
//

#import "SYTopicCollectionTopView.h"

@interface SYTopicCollectionTopView()

@property (nonatomic, strong) UILabel *titleLabel;


/**
 删除
 */
@property (nonatomic, strong) UIButton *deleteBtn;

@end
@implementation SYTopicCollectionTopView

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
    
    _titleLabel =[[UILabel alloc]init];
    _titleLabel.font =[UIFont systemFontOfSize:12];
    _titleLabel.textColor = [UIColor colorWithHexString:@"#333333"];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.numberOfLines = 2;
    [_titleLabel sizeToFit];
    _titleLabel.text = @"今天的化学课上得很愉快!一起来看看吧学习过程轻松愉快";
    [self addSubview:_titleLabel];
    
    //右侧删除按钮
    _deleteBtn =[[UIButton alloc]init];
    [_deleteBtn setImage:[UIImage imageNamed:@"delete"] forState:UIControlStateNormal];
    [self addSubview:_deleteBtn];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self).offset(15);
        make.top.mas_equalTo(self);
        make.trailing.mas_equalTo(self).offset(-(15 + 32 + 15));
    }];
    
    [_deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.mas_equalTo(self).offset(-15);
        make.top.mas_equalTo(self);
        make.width.height.mas_equalTo(32);
    }];
    
    
}

@end
