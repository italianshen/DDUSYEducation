//
//  DDUNavgationController.m
//  DDUGloTask
//
//  Created by 沈士新 on 2017/11/8.
//  Copyright © 2017年 沈士新. All rights reserved.
//

#import "DDUNavgationController.h"
// Controllers
// Models
// Views
// Vendors
//#import "GQGesVCTransition.h"
// Categories



// Others
@interface DDUNavgationController ()

@end

@implementation DDUNavgationController
#pragma mark - load 初始化
+(void)load{
//    [self setUpBase];
}

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - 初始化
//+(void)setUpBase{
//    UINavigationBar *bar = [UINavigationBar appearance];
//    bar.barTintColor = GTGlobalThemeColor;
//    [bar setShadowImage:[UIImage new]];
//    [bar setTintColor:[UIColor clearColor]];
//
//    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
//    // 设置导航栏字体颜色
//    UIColor * naiColor = [UIColor blackColor];
//    attributes[NSForegroundColorAttributeName] = naiColor;
//    attributes[NSFontAttributeName] = [UIFont systemFontOfSize:18];
//    bar.titleTextAttributes = attributes;
//}


#pragma mark - <返回>
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.childViewControllers.count >= 1) {
        //返回按钮自定义
        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        negativeSpacer.width = -15;
        UIButton *button = [[UIButton alloc] init];
        [button setImage:[UIImage imageNamed:@"navigation_back_normal"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"navigation_back_hl"] forState:UIControlStateHighlighted];
        button.frame = CGRectMake(0, 0, 33, 33);
        if (@available(ios 11.0,*)) {
            button.contentEdgeInsets = UIEdgeInsetsMake(0, -15,0, 0);
            button.imageEdgeInsets = UIEdgeInsetsMake(0, -10,0, 0);
        }
        
        [button addTarget:self action:@selector(backButtonTapClick) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:button];
        
        viewController.navigationItem.leftBarButtonItems = @[negativeSpacer, backButton];
        
        viewController.hidesBottomBarWhenPushed = YES;
        
        // 就有滑动返回功能
        self.interactivePopGestureRecognizer.delegate = nil;
    }
    //跳转
    [super pushViewController:viewController animated:animated];
    if(iPhoneX){//解决iPhone X push tabBar上移的bug
        CGRect frame = self.tabBarController.tabBar.frame;
        frame.origin.y = screenheight - frame.size.height;
        self.tabBarController.tabBar.frame = frame;
    }
}

#pragma mark - 点击
- (void)backButtonTapClick {
    
    [self popViewControllerAnimated:YES];
}

//#pragma mark - 导航栏上状态栏为白色
//- (UIStatusBarStyle)preferredStatusBarStyle
//{
//    return UIStatusBarStyleLightContent;
//}

/**
 如果单单只是想控制所有界面上方的BarStyle可以打开上面的代码打开这行代码并且在那个界面重写上面的代码
 
 @return UIViewController
 */
- (UIViewController *)childViewControllerForStatusBarStyle{
    return self.topViewController;
}




@end

