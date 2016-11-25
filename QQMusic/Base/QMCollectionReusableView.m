//
//  QMCollectionReusableView.m
//  UIPageViewController学习
//
//  Created by weiwei on 16/9/6.
//  Copyright © 2016年 weiwei. All rights reserved.
//

#import "QMCollectionReusableView.h"

#import "NSObject+BeeNotification.h"

@implementation QMCollectionReusableView

+ (NSString *)cellReuseIdentifier
{
    return NSStringFromClass([self class]);
}

+ (UINib *)nib{
    NSString *className = NSStringFromClass([self class]);
    return [UINib nibWithNibName:className bundle:nil];
}

- (void)updateWithCellData:(id)aData
{
    
}

- (void)updateWithCellData:(id)aData atIndexPath:(NSIndexPath *)indexPath
{
    
}

+ (CGSize)sizeForCellData:(id)aData
{
    return CGSizeZero;
}

- (void)dealloc
{
    [self unobserveAllNotifications];
}

@end
