//
//  GTleftIconBtn.m
//  DDUGloTask
//
//  Created by 沈士新 on 2017/11/21.
//  Copyright © 2017年 沈士新. All rights reserved.
//

#import "GTleftIconBtn.h"

@implementation GTleftIconBtn

/**
 *  布局子控件的frame
 */
- (void)layoutSubviews {
    [super layoutSubviews];
    
    // 获得按钮的宽高
    //    CGFloat buttonW = self.frame.size.width;
    CGFloat buttonH = self.frame.size.height;
    // 获得图片的宽度
    CGFloat imageW = self.imageView.frame.size.width;
    CGFloat imageH = self.imageView.frame.size.height;
    
    // 按钮和图片之间的间接
    CGFloat margin = 0;
    
    // 再调整图片和titleLabel的位置
    CGFloat labelW = self.titleLabel.frame.size.width;
    CGFloat labelH = self.titleLabel.frame.size.height;
    
    self.imageView.frame = CGRectMake(0, (buttonH - imageH) * 0.5, imageW, imageH);
    // 计算label的x值
    CGFloat labelY = (buttonH - labelH)  * 0.5;

    self.titleLabel.frame = CGRectMake(CGRectGetMaxX(self.imageView.frame) + margin, labelY, labelW, labelH);

}

@end
