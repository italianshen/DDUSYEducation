//
//  SYMyHomeHeaderView.m
//  AFN封装
//
//  Created by Danny on 2017/12/15.
//  Copyright © 2017年 大兵布莱恩特. All rights reserved.
//

#import "SYMyHomeHeaderView.h"
@interface SYMyHomeHeaderView()

@property (nonatomic, strong) UIImageView *backgroundImageView;


/**
 头像
 */
@property (nonatomic, strong) UIImageView *avatarView;


/**
 昵称
 */
@property (nonatomic, strong) UILabel *nameLabel;
/**
 粉丝
 */
@property (nonatomic, strong) UIButton *fansNumBtn;


/**
 关注
 */
@property (nonatomic, strong) UIButton *attentionNumBtn;

@end
@implementation SYMyHomeHeaderView


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
    _backgroundImageView =[[UIImageView alloc]init];
    _backgroundImageView.image =[UIImage imageNamed:@"15954767_1353492149859"];
    [self addSubview:_backgroundImageView];
    
    //头像
//
    
    _avatarView =[[UIImageView alloc]init];
    _avatarView.image =[UIImage imageNamed:@"user-Default"];
    [self addSubview:_avatarView];
    
    _nameLabel =[[UILabel alloc]init];
    _nameLabel.textColor =[UIColor colorWithHexString:@"#333"];
    [_nameLabel sizeToFit];
    _nameLabel.font =[UIFont systemFontOfSize:14];
    [self addSubview:_nameLabel];
    
    
    //按钮
    _fansNumBtn =[[UIButton alloc]init];
    [_fansNumBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_fansNumBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:12]];
    [_fansNumBtn setTitle:@" 粉丝: 30 " forState:UIControlStateNormal];
    _fansNumBtn.backgroundColor=[[UIColor colorWithHexString:@"#000000"]colorWithAlphaComponent:0.5];
    [_fansNumBtn sizeToFit];
    [self addSubview:_fansNumBtn];
    
    _attentionNumBtn =[[UIButton alloc]init];
    [_attentionNumBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_attentionNumBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:12]];
    [_attentionNumBtn setTitle:@" 关注: 30 " forState:UIControlStateNormal];
    _attentionNumBtn.backgroundColor=[[UIColor colorWithHexString:@"#000000"]colorWithAlphaComponent:0.5];
    [_attentionNumBtn sizeToFit];
    [self addSubview:_attentionNumBtn];
    
    [_backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
    
    [_avatarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(self).offset(20);
        make.width.height.mas_equalTo(67);
    }];
    _avatarView.layer.cornerRadius = 67 * 0.5;
    _avatarView.layer.masksToBounds = YES;
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(_avatarView.mas_bottom).offset(5);
    }];
    
    [_fansNumBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.mas_equalTo(self.centerX).offset(-25);
        make.bottom.mas_equalTo(self).offset(-10);
    }];
    
    [_attentionNumBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.mas_equalTo(self.centerX).offset(25);
        make.bottom.mas_equalTo(self).offset(-10);
    }];
    
}

/**
 工厂方法
 
 @return 头部视图
 */
+(instancetype)myHomeHeaderView{
    
    return [[[NSBundle mainBundle]loadNibNamed:@"SYMyHomeHeaderView" owner:self options:nil ]lastObject];
}

@end
