//
//  SYTopicCollectionViewCell.m
//  AFN封装
//
//  Created by Danny on 2017/12/15.
//  Copyright © 2017年 大兵布莱恩特. All rights reserved.
//

#import "SYTopicCollectionViewCell.h"
#import "SYTopicImageViewCell.h"
#import "SYTopicCollectionTopView.h"
#import "SYTopicCollectionBottomToolBarView.h"
static NSString *const SYTopicImageViewCellID = @"SYTopicImageViewCellID";

@interface SYTopicCollectionViewCell()<UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout>

/**
 顶部视图
 */
@property (nonatomic, strong) SYTopicCollectionTopView *topView;


/**
 底部工具条视图
 */
@property (nonatomic, strong) SYTopicCollectionBottomToolBarView *bottomToolBarView;


//横向collectionView

@property (nonatomic, strong) UICollectionView *collectionView;

@end
@implementation SYTopicCollectionViewCell

#pragma mark - lazyload
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.minimumLineSpacing = 12;
        layout.minimumInteritemSpacing = 10;
        
        layout.itemSize = CGSizeMake(self.width * 0.65, self.height);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal; //滚动方向
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        
        [self.contentView addSubview:_collectionView];
        //右边不要挡住
//        _collectionView.frame = CGRectMake(15, 0, screenwidth - 15, self.height);
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.pagingEnabled = YES;
        [_collectionView registerClass:[SYTopicImageViewCell class] forCellWithReuseIdentifier:SYTopicImageViewCellID];
    }
    return _collectionView;
}

#pragma mark - Intial
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUI];
    }
    return self;
}

#pragma mark - UI
- (void)setUpUI
{
    _topView =[[SYTopicCollectionTopView alloc]init];
    
    [self.contentView addSubview:_topView];
    
    
    _bottomToolBarView =[[SYTopicCollectionBottomToolBarView alloc]init];
    [self.contentView addSubview:_bottomToolBarView];
    
    
    self.contentView.backgroundColor =[UIColor whiteColor];
    self.collectionView.backgroundColor =[UIColor cyanColor];
    
    
    //约束
    [_topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.contentView).offset(10);
        make.trailing.mas_equalTo(self.contentView);
        make.height.mas_equalTo(34);
    }];
    
    
    
    
    [_bottomToolBarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.contentView);
        make.bottom.mas_equalTo(self.contentView);
        make.trailing.mas_equalTo(self.contentView);
        make.height.mas_equalTo(44);
    }];
    
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self);
        make.top.mas_equalTo(_topView.mas_bottom);
        make.bottom.mas_equalTo(_bottomToolBarView.mas_top);
    }];

}

#pragma mark -  <UICollectionViewDataSource>

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    SYTopicImageViewCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:SYTopicImageViewCellID forIndexPath:indexPath];
    return cell;
}




@end
