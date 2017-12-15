//
//  SDTimeLineCellOperationMenu.m
//  GSD_WeiXin(wechat)
//
//  Created by aier on 16/4/2.
//  Copyright © 2016年 GSD. All rights reserved.
//评论按钮

#import "SDTimeLineCellOperationMenu.h"
#import "UIView+SDAutoLayout.h"
#import "GlobalDefines.h"

@implementation SDTimeLineCellOperationMenu
{
    UIButton *_likeButton;
    UIButton *_commentButton;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    self.clipsToBounds = YES;
    self.layer.cornerRadius = 5;
    self.backgroundColor = SDColor(69, 74, 76, 1);
    //点赞按钮
    _likeButton = [self creatButtonWithTitle:@"赞" image:[UIImage imageNamed:@"AlbumLike"] selImage:[UIImage imageNamed:@""] target:self selector:@selector(likeButtonClicked)];
    //评论按钮
    _commentButton = [self creatButtonWithTitle:@"评论" image:[UIImage imageNamed:@"AlbumComment"] selImage:[UIImage imageNamed:@""] target:self selector:@selector(commentButtonClicked)];
    
    UIView *centerLine = [UIView new];
    centerLine.backgroundColor = [UIColor redColor];
    
    //添加控件
    [self sd_addSubviews:@[_likeButton, _commentButton, centerLine]];
    
    CGFloat margin = 5;
    //添加约束
    _likeButton.sd_layout
    .leftSpaceToView(self, margin)
    .topEqualToView(self)
    .bottomEqualToView(self)
    .widthIs(80);
    
    centerLine.sd_layout
    .leftSpaceToView(_likeButton, margin)
    .topSpaceToView(self, margin)
    .bottomSpaceToView(self, margin)
    .widthIs(1);
    
    _commentButton.sd_layout
    .leftSpaceToView(centerLine, margin)
    .topEqualToView(_likeButton)
    .bottomEqualToView(_likeButton)
    .widthRatioToView(_likeButton, 1);
    
}
//设置按钮
- (UIButton *)creatButtonWithTitle:(NSString *)title image:(UIImage *)image selImage:(UIImage *)selImage target:(id)target selector:(SEL)sel
{
    UIButton *btn = [UIButton new];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:selImage forState:UIControlStateSelected];
    [btn addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 3, 0, 0);
    return btn;
}
//点赞按钮回调
- (void)likeButtonClicked
{
    if (self.likeButtonClickedOperation) {
        self.likeButtonClickedOperation();
    }
}
//评论按钮回调
- (void)commentButtonClicked
{
    if (self.commentButtonClickedOperation) {
        self.commentButtonClickedOperation();
    }
    self.show = NO;
}
//显示
- (void)setShow:(BOOL)show
{
    _show = show;
    
    [UIView animateWithDuration:0.2 animations:^{
        if (!show) {
            //清楚所有的 约束
            [self clearAutoWidthSettings];
            //设置为0
            self.fixedWidth = @(0);
        } else {
            self.fixedWidth = nil;
            [self setupAutoWidthWithRightView:_commentButton rightMargin:5];
        }
        // 更新cell内部的控件的布局（cell内部控件专属的更新约束方法,如果启用了cell frame缓存则会自动清除缓存再更新约束）
        [self updateLayoutWithCellContentView:self.superview];
    }];
}

@end
