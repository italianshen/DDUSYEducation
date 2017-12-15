//
//  SYMyHomeTabView.m
//  AFN封装
//
//  Created by Danny on 2017/12/15.
//  Copyright © 2017年 大兵布莱恩特. All rights reserved.
//

#import "SYMyHomeTabView.h"



@interface  SYMyHomeTabView()


/**
 帖子
 */
@property (nonatomic, strong) UIButton *topicBtn;
/**
 相册
 */
@property (nonatomic, strong) UIButton *standardBtn;


/**
 收藏
 */
@property (nonatomic, strong) UIButton *favoriteBtn;



/**
 消息
 */
@property (nonatomic, strong) UIButton *messageBtn;

@property (nonatomic, strong) UIView *indicatorView;//指示线

@property (nonatomic, strong) NSMutableArray *buttonArrM;
@end

@implementation SYMyHomeTabView

#pragma mark - lazy load
-(NSMutableArray *)buttonArrM{
    if (_buttonArrM == nil) {
        _buttonArrM =[NSMutableArray array];
    }
    return _buttonArrM;
}

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
    //数据源
    NSArray *titleArr =[NSArray arrayWithObjects:@"Basic($50)",@"Standard($100)",@"Premium($150)", nil];
    
    NSLog(@"self.bounds:%@",NSStringFromCGRect(self.bounds));
    
    CGFloat buttonW = (screenwidth - 2* 15)/4.0;
    CGFloat buttonH = 45;
    //创建按钮
    for (NSInteger i = 0; i < titleArr.count; ++i) {
        UIButton *button =[[UIButton alloc]init];
        button.tag = 1000 + i;
        //设置标题
        [button setTitle:titleArr[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithHexString:@"666666"] forState:UIControlStateNormal];
        [button.titleLabel setFont:[UIFont boldSystemFontOfSize:12]];
        //监听
        [button addTarget:self action:@selector(buttonDidClick:) forControlEvents:UIControlEventTouchUpInside];
        //计算frame
        [self addSubview:button];
        
        button.frame = CGRectMake(buttonW * i, 0, buttonW, buttonH);
        [self.buttonArrM addObject:button];
    }
    
    //线
    _indicatorView =[[UIView alloc]init];
    [self addSubview:_indicatorView];
    UIButton *firstBtn = (UIButton *)self.subviews.firstObject;
    _indicatorView.center = CGPointMake(firstBtn.centerX, firstBtn.bottom - 1);
    _indicatorView.bounds = CGRectMake(0, 0, firstBtn.width *0.8, 2);
    //底部的分割线
    UIView *seperatorLine = [[UIView alloc]init];
    seperatorLine.backgroundColor = [UIColor colorWithHexString:@"#dedede"];
    [self addSubview:seperatorLine];
    seperatorLine.frame = CGRectMake(0, 44, screenwidth, 1);
}

-(void)buttonDidClick:(UIButton *)sender{
    
    //slider移动
    [UIView animateWithDuration:0.25 animations:^{
        self.indicatorView.centerX = sender.centerX;
    }];
    if ([self.delegate respondsToSelector:@selector(myHomeTabViewDidSelectTabWithIndex:)]) {
        [self.delegate myHomeTabViewDidSelectTabWithIndex:(sender.tag - 1000)];
    }
}

/**
 滚动到指定的索引
 
 @param index 索引
 */
-(void)scrollToIndexAtIndex:(NSInteger)index{
    
    UIButton *button = self.buttonArrM[index];
//    NSLog(@"button.bounds:%@",NSStringFromCGRect(button.bounds));
    [UIView animateWithDuration:0.25 animations:^{
        self.indicatorView.centerX = button.centerX;
    }];
    
}




@end
