//
//  LxmOrderVC.m
//  HappyTogether
//
//  Created by 李晓满 on 16/11/30.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "LxmOrderVC.h"
#import "LxmOrderHeaderView.h"
#import "LxmOrderCell.h"
#import "LxmOrderConentVC.h"

@interface LxmOrderVC ()

@end

@implementation LxmOrderVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initCollectionView];
   
}
-(void)initCollectionView
{
    self.flowLayout.minimumInteritemSpacing=5;
    self.flowLayout.minimumLineSpacing=5;
    self.collectionView.backgroundColor = BGGrayColor;
    CGFloat width = (self.view.bounds.size.width-15)*0.5;
    self.flowLayout.itemSize = CGSizeMake(width, width+50+10);
    self.collectionView.contentInset = UIEdgeInsetsMake(5, 0, 0, 0);
    self.collectionView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-5);
    [self.collectionView registerClass:[LxmOrderCell class] forCellWithReuseIdentifier:@"LxmOrderCell"];
    [self.collectionView registerClass:[LxmOrderHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"LxmOrderHeaderView"];
}
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader])
    {
        LxmOrderHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"LxmOrderHeaderView" forIndexPath:indexPath];
        headerView.bgImageView.backgroundColor = BGGrayColor;
        headerView.titleStr = @"锦江国际大酒店";
        return headerView;
    }
    return nil;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(self.view.bounds.size.width, 40);
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 5, 5, 5);
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LxmOrderCell * item = [collectionView dequeueReusableCellWithReuseIdentifier:@"LxmOrderCell" forIndexPath:indexPath];
    item.backgroundColor = [UIColor whiteColor];
    return item;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    LxmOrderConentVC * vc = [[LxmOrderConentVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
