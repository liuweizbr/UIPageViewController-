//
//  QMSelectedTypeMusicCVCell.m
//  UIPageViewController学习
//
//  Created by weiwei on 16/9/7.
//  Copyright © 2016年 weiwei. All rights reserved.
//

#import "QMSelectedTypeMusicCVCell.h"

@interface QMSelectedTypeMusicCVCell ()

@property (nonatomic ,strong) UILabel *nameLabel ;
@property (nonatomic ,strong) UIView *bottomLine ;


@end

@implementation QMSelectedTypeMusicCVCell

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [UILabel newAutoLayoutView] ;
        _nameLabel.font = buttomFont(14) ;
        _nameLabel.textAlignment = NSTextAlignmentCenter ;
        _nameLabel.textColor = [UIColor whiteColor] ;
        
    }
    return _nameLabel ;
}

- (UIView *)bottomLine {
    if (!_bottomLine) {
        _bottomLine = [UILabel newAutoLayoutView] ;
                   
    }
    return _bottomLine ;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
    }
    return self ;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
