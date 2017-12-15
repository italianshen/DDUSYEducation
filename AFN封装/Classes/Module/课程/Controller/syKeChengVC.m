//
//  syKeChengVC.m
//  AFN封装
//
//  Created by 刘耀宗 on 2017/12/11.
//  Copyright © 2017年 大兵布莱恩特. All rights reserved.
//

#import "syKeChengVC.h"
#import "syCourseCell.h"
@interface syKeChengVC ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionViewFlowLayout *layout;

@end

@implementation syKeChengVC
-(UICollectionViewFlowLayout *)layout
{
    if (_layout == nil) {
        _layout = [[UICollectionViewFlowLayout alloc] init];
        _layout.itemSize=CGSizeMake((screenwidth-30)/2, 197);
        _layout.minimumLineSpacing=10;
        _layout.minimumInteritemSpacing=10;
        
        
    }
    return _layout;
}
-(UICollectionView *)collectionView
{
    if (_collectionView == nil) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, screenwidth, screenheight) collectionViewLayout:self.layout];
        _collectionView.delegate=self;
        _collectionView.dataSource=self;
        _collectionView.contentInset=UIEdgeInsetsMake(10, 10, 0, 10);
       
    }
    return _collectionView;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
     [self.view addSubview:self.collectionView];
    self.collectionView.backgroundColor=randomColor;
    // Do any additional setup after loading the view from its nib.
    UINib *nib=[UINib nibWithNibName:@"syCourseCell" bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:@"syCourseCell"];
}
#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    syCourseCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"syCourseCell" forIndexPath:indexPath];
    
    
    
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
