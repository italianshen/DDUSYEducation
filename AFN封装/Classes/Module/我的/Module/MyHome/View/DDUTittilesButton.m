//
//  DDUTittilesButton.m
//  DDU
//
//  Created by Danny on 2017/5/14.
//  Copyright © 2017年 沈士新. All rights reserved.
//

#import "DDUTittilesButton.h"

@implementation DDUTittilesButton
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        // 设置按钮颜色
        // self.selected = NO;
        [self setTitleColor:[UIColor colorWithHexString:@"#333"] forState:UIControlStateNormal];
        // self.selected = YES;
        [self setTitleColor:[UIColor colorWithHexString:@"#027bd6"] forState:UIControlStateSelected];
        self.titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return self;
}

- (void)setHighlighted:(BOOL)highlighted {}


@end
