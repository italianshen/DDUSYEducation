//
//  SYAlbumViewController.m
//  AFN封装
//
//  Created by Danny on 2017/12/15.
//  Copyright © 2017年 大兵布莱恩特. All rights reserved.
//

#import "SYAlbumViewController.h"

@interface SYAlbumViewController ()

@end

@implementation SYAlbumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView *redView =[[UIView alloc]initWithFrame:CGRectMake(15, 100, 150, 150)];
    redView.backgroundColor =[UIColor orangeColor];
    [self.view addSubview:redView];
}




@end
