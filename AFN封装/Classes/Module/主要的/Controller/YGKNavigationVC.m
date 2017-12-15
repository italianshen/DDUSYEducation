//
//  YGKNavigationVC.m
//  新项目
//
//  Created by 刘耀宗 on 2016/10/21.
//  Copyright © 2016年 刘耀宗. All rights reserved.
//

#import "YGKNavigationVC.h"

@interface YGKNavigationVC ()

@end

@implementation YGKNavigationVC
// 如果子类没有重写该方法，父类的该方法会被调用多次
+ (void)initialize {
    //    NSLog(@"%s", __FUNCTION__);
    if (self == [YGKNavigationVC self]) {
        
        //         NSLog(@"%s", __FUNCTION__);
        // 获得主题导航条
        UINavigationBar *navBar = [UINavigationBar appearance];
        // 设置返回按钮的箭头颜色
        navBar.tintColor = [UIColor blackColor];
        // 设置导航条背景
        // forBarMetrics: 类似按钮的 forState: 什么状态下显示。
        //    UIBarMetricsDefault, 不管横竖屏都显示
        //    UIBarMetricsCompact, 在竖屏下不显示，在横屏下显示
        //        [navBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
        // 设置导航条标题颜色
        NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
        //    attributes[NSFontAttributeName] = [UIFont systemFontOfSize:20];
        attributes[NSFontAttributeName] = newFont(20);
        attributes[NSForegroundColorAttributeName] = [UIColor blackColor];
        [navBar setTitleTextAttributes:attributes];
        
        // .ttf .odt
        // 获得全局的item
        UIBarButtonItem *item = [UIBarButtonItem appearance];
        NSMutableDictionary *itemAttributes = [NSMutableDictionary dictionary];
        
        itemAttributes[NSFontAttributeName] = newFont(14);
        itemAttributes[NSForegroundColorAttributeName] = [UIColor blackColor];
        [item setTitleTextAttributes:itemAttributes forState:UIControlStateNormal];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}





@end
