//
//  PlusViewController.m
//  SinaDemo
//
//  Created by Xiaomin on 16/4/1.
//  Copyright © 2016年 Xiaomin. All rights reserved.
//

#import "PlusViewController.h"

@interface PlusViewController ()

@end

@implementation PlusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backBtnClick:(UIButton *)sender {
    
    [UIView animateWithDuration:0.2 animations:^{
        sender.transform = CGAffineTransformMakeRotation(M_PI_4);
    } completion:^(BOOL finished) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"removeView" object:nil];
//        [self dismissModalViewControllerAnimated:YES];
        [self.view removeFromSuperview];
    }];
    
    
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
