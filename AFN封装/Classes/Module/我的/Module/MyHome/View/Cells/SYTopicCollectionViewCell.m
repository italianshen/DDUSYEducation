//
//  SYTopicCollectionViewCell.m
//  AFN封装
//
//  Created by Danny on 2017/12/15.
//  Copyright © 2017年 大兵布莱恩特. All rights reserved.
//

#import "SYTopicCollectionViewCell.h"
#import "SYTopicImageViewCell.h"
static NSString *const SYTopicImageViewCellID = @"SYTopicImageViewCellID";

@interface SYTopicCollectionViewCell()<UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout>



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
        _collectionView.frame = CGRectMake(15, 0, screenwidth - 15, self.height);
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
    
    self.contentView.backgroundColor =[UIColor whiteColor];
    self.collectionView.backgroundColor =[UIColor cyanColor];
    
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
