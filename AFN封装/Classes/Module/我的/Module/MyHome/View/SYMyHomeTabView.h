//
//  SYMyHomeTabView.h
//  AFN封装
//
//  Created by Danny on 2017/12/15.
//  Copyright © 2017年 大兵布莱恩特. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SYMyHomeTabViewDelegate<NSObject>

/**
 选中了哪个索引
 
 @param index 索引
 */
-(void)myHomeTabViewDidSelectTabWithIndex:(NSInteger)index;

@end


@interface SYMyHomeTabView : UIView

@property (nonatomic, weak) id<SYMyHomeTabViewDelegate> delegate;


/**
 滚动到指定的索引
 
 @param index 索引
 */
-(void)scrollToIndexAtIndex:(NSInteger)index;

@end
