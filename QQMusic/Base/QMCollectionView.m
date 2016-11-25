//
//  QMCollectionView.m
//  UIPageViewController学习
//
//  Created by weiwei on 16/9/6.
//  Copyright © 2016年 weiwei. All rights reserved.
//

#import "QMCollectionView.h"
#import "QMCollectionViewCell.h"
#import "QMCollectionReusableView.h"
#import "NSObject+BeeNotification.h"
#import "QMWeakObjectDeathNotifier.h"


@implementation QMCollectionView

- (id)dequeueReusableCellWithReuseIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [super dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    if ([cell isKindOfClass:[QMCollectionViewCell class]]) {
        [(QMCollectionViewCell *)cell setIndexPath:indexPath];
    }
    
    return cell;
}

- (id)dequeueReusableSupplementaryViewOfKind:(NSString *)elementKind withReuseIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath
{ 
    UICollectionViewCell *cell = [super dequeueReusableSupplementaryViewOfKind:elementKind withReuseIdentifier:identifier forIndexPath:indexPath];
    
    if ([cell isKindOfClass:[QMCollectionReusableView class]]) {
        [(QMCollectionReusableView *)cell setIndexPath:indexPath];
    }
    
    return cell;
}

- (void)scrollToItemAtIndexPath:(NSIndexPath *)indexPath atScrollPosition:(UICollectionViewScrollPosition)scrollPosition animated:(BOOL)animated
{
    if (indexPath.section >= [self numberOfSections] || indexPath.item >= [self numberOfItemsInSection:indexPath.section]) {
        return ;
    }
    
    [super scrollToItemAtIndexPath:indexPath atScrollPosition:scrollPosition animated:animated];
}

- (void)selectItemAtIndexPath:(NSIndexPath *)indexPath animated:(BOOL)animated scrollPosition:(UICollectionViewScrollPosition)scrollPosition
{
    if (indexPath.section >= [self numberOfSections] || indexPath.item >= [self numberOfItemsInSection:indexPath.section]) {
        return ;
    }
    
    [super selectItemAtIndexPath:indexPath animated:animated scrollPosition:scrollPosition];
}
- (void)dealloc
{
    [self unobserveAllNotifications];
}

- (void)setDelegate:(id<UICollectionViewDelegate>)delegate
{
    [super setDelegate:delegate];
    
    if (delegate == nil) {
        return;
    }
    
    QMWeakObjectDeathNotifier *wo = [QMWeakObjectDeathNotifier new];
    [wo setOwner:delegate];
    WEAK_SELF;
    [wo setBlock:^(QMWeakObjectDeathNotifier *sender) {
        STRONG_SELF;
        self.delegate = nil;
        self.dataSource = nil;
    }];
}

- (void)reloadData
{
    [self.collectionViewLayout invalidateLayout];
    [super reloadData];
}


@end
