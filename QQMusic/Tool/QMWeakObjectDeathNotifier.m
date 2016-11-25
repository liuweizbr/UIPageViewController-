//
//  QMWeakObjectDeathNotifier.m
//  UIPageViewController学习
//
//  Created by weiwei on 16/9/6.
//  Copyright © 2016年 weiwei. All rights reserved.
//

#import "QMWeakObjectDeathNotifier.h"
#import "NSObject+category.h"

@interface QMWeakObjectDeathNotifier ()

@property (nonatomic, copy) JPWeakObjectDeathNotifierBlock aBlock;


@end

@implementation QMWeakObjectDeathNotifier

- (void)setBlock:(JPWeakObjectDeathNotifierBlock)block
{
    self.aBlock = block;
}

- (void)dealloc
{
    if (self.aBlock) {
        self.aBlock(self);
    }
    
    self.aBlock = nil;
}

- (void)setOwner:(id)owner
{
    _owner = owner;
    
    [owner objc_setAssociatedObject:[NSString stringWithFormat:@"observerOwner_%p",self] value:self policy:OBJC_ASSOCIATION_RETAIN_NONATOMIC];
}

@end
