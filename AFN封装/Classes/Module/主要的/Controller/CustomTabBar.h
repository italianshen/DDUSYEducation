//
//  CustomTabBar.h
//  SinaDemo
//
//  Created by Xiaomin on 16/4/1.
//  Copyright © 2016年 Xiaomin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^plusBtnClick)();
@interface CustomTabBar : UITabBar
@property (nonatomic, copy) plusBtnClick clickBlock;
@end
