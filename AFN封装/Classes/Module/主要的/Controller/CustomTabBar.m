//
//  CustomTabBar.m
//  SinaDemo
//
//  Created by Xiaomin on 16/4/1.
//  Copyright © 2016年 Xiaomin. All rights reserved.
//

#import "CustomTabBar.h"
#import "UIColor+_Hex.h"
@interface CustomTabBar ()
@property (nonatomic, strong) UIButton *plusBtn;
@end
@implementation CustomTabBar

- (UIButton *)plusBtn{
    if(!_plusBtn){
        
        _plusBtn = [[UIButton alloc]init];
        [_plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        _plusBtn.backgroundColor = [UIColor colorWithHexString:@"#ff8200" andAlpha:1];
        [_plusBtn addTarget:self action:@selector(plusBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _plusBtn;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    CGFloat btnW = self.bounds.size.width/(self.items.count +1);
    CGFloat btnH = self.bounds.size.height;
    
    int i =0;
    for (UIView *tabBarButton in self.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            if (i == 2) {
                i = 3;
            }
            btnX = i * btnW;
            tabBarButton.frame = CGRectMake(btnX, btnY, btnW, btnH);
            i ++;
        }
    }
    
    self.plusBtn.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    self.plusBtn.bounds = CGRectMake(0, 0, 38, 38);
    [self addSubview:self.plusBtn];
    
    NSLog(@"%@",NSStringFromCGPoint(self.center));
    
    
    
}
-(void)plusBtnClick:(UIButton *)sender{
    self.clickBlock();
}
@end
