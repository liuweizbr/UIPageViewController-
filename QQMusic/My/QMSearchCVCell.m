//
//  QMSearchCVCell.m
//  UIPageViewController学习
//
//  Created by weiwei on 16/9/6.
//  Copyright © 2016年 weiwei. All rights reserved.
//

#import "QMSearchCVCell.h"

@interface QMSearchCVCell ()

@property (nonatomic ,strong) UISearchBar *searchBar ;

@end

@implementation QMSearchCVCell

- (UISearchBar *)searchBar {
    if (!_searchBar) {
        _searchBar = [UISearchBar newAutoLayoutView] ;
        _searchBar.placeholder = @"搜索" ;
        
        for (UIView *view in _searchBar.subviews) {
            for (UIView *subView in view.subviews) {
                if ([subView isKindOfClass:NSClassFromString(@"UISearchBarBackground")]) {
                    [subView removeFromSuperview] ;
                }else {
                    subView.backgroundColor = UIColorFromRGB(0x1e3649) ;
                }
            }
        }
    }
    return _searchBar ;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initUI] ;
    }
    return self ;
}

- (void)initUI {
    [self.contentView addSubview:self.searchBar] ;
    [self setupConstrains] ;
}

- (void)setupConstrains {
    [self.searchBar autoPinEdgesToSuperviewEdges] ;

}

@end
