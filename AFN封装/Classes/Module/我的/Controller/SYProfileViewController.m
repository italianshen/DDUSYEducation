//
//  SYProfileViewController.m
//  AFN封装
//
//  Created by Danny on 2017/12/15.
//  Copyright © 2017年 大兵布莱恩特. All rights reserved.
//

#import "SYProfileViewController.h"
#import "DDUProfileModel.h"
#import "SYProfileTableViewCell.h"
#import "SYProfileHeaderView.h"
 #import "SYMyHomeViewController.h"
@interface SYProfileViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *models;

@end

@implementation SYProfileViewController

#pragma mark - lazy load
-(NSArray *)models{
    if (_models == nil) {
        _models =[DDUProfileModel models];
    }
    return _models;
}
#pragma mark - 懒加载
-(UITableView *)tableView{
    if (_tableView == nil) {
        _tableView =[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.rowHeight = 44;
        UIView *footer = [[UIView alloc] init];
        footer.backgroundColor = [UIColor colorWithHexString:@"#f2f2f2" andAlpha:1.0];
        _tableView.tableFooterView = footer;
        _tableView.tableHeaderView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, screenwidth, 100)];
        SYProfileHeaderView *headerView =[SYProfileHeaderView profileHeaderView];
        [_tableView.tableHeaderView addSubview:headerView];
        headerView.frame = CGRectMake(0, 0, screenwidth, 100);
        _tableView.backgroundColor =  [UIColor colorWithHexString:@"#f2f2f2" andAlpha:1.0];
        _tableView.separatorStyle = NO;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"%@",self.models);
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view).offset(DDUNavBarH);
    }];
    
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //适配iOS11.0  因为设置按钮点不到 所以调整方案
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else{
        self.automaticallyAdjustsScrollViewInsets = NO;
        
    }
}

#pragma mark - 数据源方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.models.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.models[section] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SYProfileTableViewCell *cell =[SYProfileTableViewCell profileTableViewCell];
    DDUProfileModel *model = self.models[indexPath.section][indexPath.row];
    cell.model = model;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SYMyHomeViewController *home =[[SYMyHomeViewController alloc]init];
    home.view.backgroundColor = [UIColor colorWithHexString:@"#f2f2f2" andAlpha:1.0];
    [self.navigationController pushViewController:home animated:YES];
    
}


//行间距
//每一组的组头

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10.0;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *header =[[UIView alloc]init];
    //    header.backgroundColor =  [UIColor colorWithHexString:@"#f2f2f2"];
    header.backgroundColor = [UIColor colorWithHexString:@"#f2f2f2" andAlpha:1.0];
    return header;
}



@end
