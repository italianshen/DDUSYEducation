//
//  SYTopicCollectionBottomToolBarView.m
//  AFN封装
//
//  Created by Danny on 2017/12/15.
//  Copyright © 2017年 大兵布莱恩特. All rights reserved.
//

#import "SYTopicCollectionBottomToolBarView.h"
#import "GTleftIconBtn.h"

@interface SYTopicCollectionBottomToolBarView ()


/**
 点赞
 */
@property (nonatomic, strong) GTleftIconBtn *likeBtn;


/**
 评论
 */
@property (nonatomic, strong) GTleftIconBtn *commentBtn;


/**
 收藏
 */
@property (nonatomic, strong) GTleftIconBtn *favoriteBtn;



/**
 时间
 */
@property (nonatomic, strong) UILabel *timeLabel;

@end
@implementation SYTopicCollectionBottomToolBarView

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
//    _likeBtn
    
    _likeBtn =[GTleftIconBtn buttonWithType:UIButtonTypeCustom];
    _likeBtn.titleLabel.font =[UIFont boldSystemFontOfSize:12];
    [_likeBtn setImage:[UIImage imageNamed:@"good"] forState:UIControlStateNormal];
    [_likeBtn setTitle:@" 245" forState:UIControlStateNormal];
    [_likeBtn setTitleColor:[UIColor colorWithHexString:@"#666"] forState:UIControlStateNormal];
    [_likeBtn sizeToFit];
    [self addSubview:_likeBtn];
//    _likeBtn
//    _favoriteBtn
    _commentBtn =[GTleftIconBtn buttonWithType:UIButtonTypeCustom];
    _commentBtn.titleLabel.font =[UIFont boldSystemFontOfSize:12];
    [_commentBtn setImage:[UIImage imageNamed:@"pin-lun"] forState:UIControlStateNormal];
    [_commentBtn setTitle:@" 246" forState:UIControlStateNormal];
    [_commentBtn setTitleColor:[UIColor colorWithHexString:@"#666"] forState:UIControlStateNormal];
    [_commentBtn sizeToFit];
    [self addSubview:_commentBtn];
    
//    _commentBtn
    
    _favoriteBtn =[GTleftIconBtn buttonWithType:UIButtonTypeCustom];
    _favoriteBtn.titleLabel.font =[UIFont boldSystemFontOfSize:12];
    [_favoriteBtn setImage:[UIImage imageNamed:@"guanzhu-"] forState:UIControlStateNormal];
    [_favoriteBtn setTitle:@" 24" forState:UIControlStateNormal];
    [_favoriteBtn setTitleColor:[UIColor colorWithHexString:@"#666"] forState:UIControlStateNormal];
    [_favoriteBtn sizeToFit];
    [self addSubview:_favoriteBtn];
    
   

    _timeLabel =[[UILabel alloc]init];
    _timeLabel.textColor =[UIColor colorWithHexString:@"#333"];
    _timeLabel.textAlignment = NSTextAlignmentRight;
    [_timeLabel sizeToFit];
    _timeLabel.font =[UIFont systemFontOfSize:14];
    _timeLabel.text = @"2017-12-13";
    [self addSubview:_timeLabel];
    
    
    //假设时间占100 右间距15 按钮距离时间是15
    
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.mas_equalTo(self);
        make.centerY.mas_equalTo(self);
    }];
    
    [_likeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self).offset(15);
        make.centerY.mas_equalTo(self);
    }];
    
    [_commentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(_likeBtn.mas_trailing).offset(12);
        make.centerY.mas_equalTo(self);
    }];
    
    [_favoriteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(_commentBtn.mas_trailing).offset(12);
        make.centerY.mas_equalTo(self);
    }];
    
}

@end
