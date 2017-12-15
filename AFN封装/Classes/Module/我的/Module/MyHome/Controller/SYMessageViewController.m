//
//  SYMessageViewController.m
//  AFN封装
//
//  Created by Danny on 2017/12/15.
//  Copyright © 2017年 大兵布莱恩特. All rights reserved.
//

#import "SYMessageViewController.h"

@interface SYMessageViewController ()

@end

@implementation SYMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView *redView =[[UIView alloc]initWithFrame:CGRectMake(15, 150 + 45, 150, 150)];
    redView.backgroundColor =[UIColor purpleColor];
    [self.view addSubview:redView];
}



@end
