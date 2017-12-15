//
//  SYFavoriteViewController.m
//  AFN封装
//
//  Created by Danny on 2017/12/15.
//  Copyright © 2017年 大兵布莱恩特. All rights reserved.
//

#import "SYFavoriteViewController.h"

@interface SYFavoriteViewController ()

@end

@implementation SYFavoriteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView *redView =[[UIView alloc]initWithFrame:CGRectMake(15, 100, 150, 150)];
    redView.backgroundColor =[UIColor brownColor];
    [self.view addSubview:redView];
}



@end
