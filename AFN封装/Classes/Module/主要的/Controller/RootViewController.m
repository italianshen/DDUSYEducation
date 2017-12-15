//
//  RootViewController.m
//  SinaDemo
//
//  Created by Xiaomin on 16/4/1.
//  Copyright © 2016年 Xiaomin. All rights reserved.
//

#import "RootViewController.h"
#import "CustomTabBar.h"
#import "MainViewController.h"
#import "MessageViewController.h"
#import "DiscoverViewController.h"
#import "SYProfileViewController.h"
#import "PlusViewController.h"
#import "UIColor+_Hex.h"
#import "SDTimeLineTableViewController.h"
#import "UIView+Screenshot.h"
#import "UIImage+ImageEffects.h"
#import "FancyTabBar.h"
#import "ScrollSegmentControl.h"
#import "DDUNavgationController.h"
@interface RootViewController ()<FancyTabBarDelegate>
@property(nonatomic,strong) FancyTabBar *fancyTabBar;
@property (nonatomic,strong) UIImageView *backgroundView;
@property (nonatomic, strong) UIView *plusView;
@end

@implementation RootViewController
-(FancyTabBar *)fancyTabBar
{
    if (_fancyTabBar == nil) {
        _fancyTabBar = [[FancyTabBar alloc]initWithFrame:self.view.bounds];
    }
    return _fancyTabBar;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(removeView) name:@"removeView" object:nil];
       
       //postNotificationName:@"removeView" object:nil];
    CustomTabBar *tabBar = [[CustomTabBar alloc]initWithFrame:self.tabBar.frame];
    
//
////    _fancyTabBar.backgroundColor=[UIColor blackColor];
//    [self.fancyTabBar setUpChoices:self choices:@[@"gallery",@"dropbox",@"camera"] withMainButtonImage:[UIImage imageNamed:@"main_button"]];
//    self.fancyTabBar.delegate = self;
//    [[UIApplication sharedApplication].keyWindow addSubview:self.fancyTabBar];
    
    [self setValue:tabBar forKeyPath:@"tabBar"];
    tabBar.clickBlock = ^(){
        PlusViewController *plus = [[PlusViewController alloc]init];
        [self addChildViewController:plus];
        plus.view.frame=self.view.bounds;
        self.plusView=plus.view;
        [self.view addSubview:plus.view];

        
    };
    NSArray *titles = @[@"首页",@"术业圈",@"课程",@"我的"];
    NSArray *classNames = @[@"MainViewController",@"SDTimeLineTableViewController",@"ScrollSegmentControl",@"SYProfileViewController"];
    NSArray *imags = @[@"zhuye_xuanzhong",@"toolbar_compose",@"kecheng_xuanzhong",@"wode_xuanzhong"];
    NSMutableArray *mArray = [NSMutableArray array];
    
    
    for (int idx = 0; idx < classNames.count; idx++) {
        NSString *selImg = [NSString stringWithFormat:@"%@_selected", [imags objectAtIndex:idx] ];
        id nav = [self viewControllerWithClassName: [classNames objectAtIndex:idx]
                                             image: [self changeImage:imags[idx]]
                                     selectedImage: [self changeImage:selImg]
                                             title: [titles objectAtIndex:idx]];
        [mArray addObject: nav];
    }
    self.viewControllers = mArray;

    
    
}
-(void)removeView
{
    [self.plusView removeFromSuperview];
}
- (void)didExpand
{
    self.fancyTabBar.backgroundColor=[UIColor blackColor];
    self.fancyTabBar.alpha=0.4;
    NSLog(@"打开了");
}
- (void)didCollapse
{
    self.fancyTabBar.backgroundColor=[UIColor clearColor];
    self.fancyTabBar.alpha=1;
     NSLog(@"关闭了");
}
- (DDUNavgationController *)viewControllerWithClassName:(NSString*)className image:(UIImage*)image selectedImage:(UIImage *)selectedImage title:(NSString *)title
{
    Class class = NSClassFromString( className );
    id pClass = [[class alloc]init];
    [pClass setTabBarItem: [[UITabBarItem alloc] initWithTitle: title image:image selectedImage:selectedImage] ];
    [pClass setTitle: title];
    DDUNavgationController *viewController = [[DDUNavgationController alloc] initWithRootViewController: pClass];
    return viewController;
}
-(UIImage *)changeImage:(NSString *)image{
    return [UIImage imageNamed:[NSString stringWithFormat:@"%@",image]];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
