//
//  QMWeakObjectDeathNotifier.h
//  UIPageViewController学习
//
//  Created by weiwei on 16/9/6.
//  Copyright © 2016年 weiwei. All rights reserved.
//

#import <Foundation/Foundation.h>

//当owner释放的时候通知block
@class QMWeakObjectDeathNotifier;

typedef void(^JPWeakObjectDeathNotifierBlock)(QMWeakObjectDeathNotifier *sender);

@interface QMWeakObjectDeathNotifier : NSObject

@property (nonatomic, weak) id owner;
@property (nonatomic, strong) id data;

- (void)setBlock:(JPWeakObjectDeathNotifierBlock)block;

@end
