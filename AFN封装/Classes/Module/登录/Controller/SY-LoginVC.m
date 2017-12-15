//
//  SY-LoginVC.m
//  SinaDemo
//
//  Created by 刘耀宗 on 2017/12/5.
//  Copyright © 2017年 Xiaomin. All rights reserved.
//

#import "SY-LoginVC.h"
#import "RootViewController.h"
@interface SY_LoginVC ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIView *accountView;
@property (weak, nonatomic) IBOutlet UIView *passView;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UITextField *accountField;
@property (weak, nonatomic) IBOutlet UITextField *passWordField;

@property (nonatomic, strong) MBProgressHUD *hud;
@end

@implementation SY_LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initView];
}
//初始化view
-(void)initView
{
    self.accountView.layer.cornerRadius=22;
    self.accountView.layer.borderColor=[CcColor(153, 153, 153) CGColor];
    self.accountView.layer.borderWidth=1;
    self.accountView.layer.masksToBounds=YES;
    
    self.passView.layer.cornerRadius=22;
    self.passView.layer.borderColor=[CcColor(153, 153, 153) CGColor];
    self.passView.layer.borderWidth=1;
    self.passView.layer.masksToBounds=YES;
    
    
    self.loginBtn.layer.cornerRadius=22;
    self.loginBtn.layer.masksToBounds=YES;
    
    self.accountField.delegate=self;
    self.passWordField.delegate=self;
    
    
}
//点击登录
- (IBAction)clickForLogin:(id)sender {

    
    
    NSMutableDictionary *objDict = [[NSMutableDictionary alloc] init];
    [objDict setObject:@"123" forKey:@"LoginName"];
    [objDict setObject:@"123" forKey:@"PassWord"];
    NSMutableDictionary *mdict = [YGPublicParameter publicDictParameter];
    [mdict setObject:objDict forKey:@"data"];
    
    //      __weak typeof(self)weakSelf = self;
    [MHNetworkManager postReqeustWithURL:@"http://120.78.213.251:8101/Login" params:mdict successBlock:^(NSDictionary *returnData) {
        NSLog(@"当前返回的值是%@",returnData);
        RootViewController *rootVC=[[RootViewController alloc] init];
                [self presentViewController:rootVC animated:YES completion:nil];
    } failureBlock:^(NSError *error) {
        
    } showHUD:YES];

 
    
}
//注册账号
- (IBAction)reginAccount:(id)sender {
}
//忘记密码
- (IBAction)forgetPassWorrd:(id)sender {
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
