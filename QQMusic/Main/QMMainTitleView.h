//
//  QMMainTitleView.h
//  UIPageViewController学习
//
//  Created by weiwei on 16/8/31.
//  Copyright © 2016年 weiwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QMMainTitleView ;
@protocol QMMainTitleViewDelegate <NSObject>

- (void)mainTitleView:(QMMainTitleView *)view clickIndex:(NSInteger)index ;

@end

@interface QMMainTitleView : UIView

@property (nonatomic ,assign) id <QMMainTitleViewDelegate> delegate ;

@property (nonatomic ,assign) NSInteger selecteIndex ;


@end
