//
//  QMMainTitleView.m
//  UIPageViewController学习
//
//  Created by weiwei on 16/8/31.
//  Copyright © 2016年 weiwei. All rights reserved.
//

#import "QMMainTitleView.h"

#define clickFontSize 17
#define unClickFontSize 15

@interface QMMainTitleView ()

@property (nonatomic ,strong) UIButton *myBtn ;

@property (nonatomic ,strong) UIButton *musicBtn ;

@property (nonatomic ,strong) UIButton *findBtn ;

@end

@implementation QMMainTitleView

- (UIButton *)myBtn
{
    if (!_myBtn) {
        _myBtn = [UIButton newAutoLayoutView] ;
        [_myBtn setTitle:@"我的" forState:UIControlStateNormal] ;
        _myBtn.titleLabel.font = buttomFont(clickFontSize);
        [_myBtn addTarget:self action:@selector(myClick) forControlEvents:UIControlEventTouchUpInside] ;
    }
    return _myBtn ;
}

- (UIButton *)musicBtn
{
    if (!_musicBtn) {
        _musicBtn = [UIButton newAutoLayoutView] ;
        [_musicBtn setTitle:@"音乐馆" forState:UIControlStateNormal] ;
        _musicBtn.titleLabel.font = buttomFont(unClickFontSize);
        [_musicBtn addTarget:self action:@selector(musicClick) forControlEvents:UIControlEventTouchUpInside] ;
    }
    return _musicBtn ;
}

- (UIButton *)findBtn
{
    if (!_findBtn) {
        _findBtn = [UIButton newAutoLayoutView] ;
        [_findBtn setTitle:@"发现" forState:UIControlStateNormal] ;
        _findBtn.titleLabel.font = buttomFont(unClickFontSize);
        [_findBtn addTarget:self action:@selector(findClick) forControlEvents:UIControlEventTouchUpInside] ;
    }
    return _findBtn ;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self initUI] ;
    }
    return self ;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initUI] ;
    }
    return self ;
}

- (void)initUI
{
    [self addSubview:self.myBtn] ;
    [self addSubview:self.musicBtn] ;
    [self addSubview:self.findBtn] ;
    [self setupConstraints] ;

    

}

- (void)setupConstraints
{
    [self.myBtn autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self];
    [self.myBtn autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self];
    //    [self.myBtn autoSetDimension:ALDimensionWidth toSize:30];

    [self.musicBtn autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.myBtn withOffset:20];
    [self.musicBtn autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self];
    [self.musicBtn autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self.myBtn];


    [self.findBtn autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.musicBtn withOffset:20];
    [self.findBtn autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self];
    [self.findBtn autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self];
    [self.findBtn autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self.myBtn];
}

- (void)setSelecteIndex:(NSInteger)selecteIndex
{
    _selecteIndex = selecteIndex ;
    if (selecteIndex == 1) {
        _myBtn.titleLabel.font = titleButtomFont(clickFontSize) ;
//        _myBtn.titleLabel.textColor
        _musicBtn.titleLabel.font = buttomFont(unClickFontSize) ;
        _findBtn.titleLabel.font = buttomFont(unClickFontSize) ;
    }else if (selecteIndex == 2){
        _myBtn.titleLabel.font = buttomFont(unClickFontSize) ;
        _musicBtn.titleLabel.font = titleButtomFont(clickFontSize) ;
        _findBtn.titleLabel.font = buttomFont(unClickFontSize) ;
    }else {
        _myBtn.titleLabel.font = buttomFont(unClickFontSize) ;
        _musicBtn.titleLabel.font = buttomFont(unClickFontSize) ;
        _findBtn.titleLabel.font = titleButtomFont(clickFontSize) ;
    }
}

- (void)myClick
{
    _myBtn.titleLabel.font = titleButtomFont(clickFontSize) ;
    _musicBtn.titleLabel.font = buttomFont(unClickFontSize) ;
    _findBtn.titleLabel.font = buttomFont(unClickFontSize) ;
    if ([self.delegate respondsToSelector:@selector(mainTitleView:clickIndex:)]) {
        [self.delegate mainTitleView:self clickIndex:1] ;
    }
}

- (void)musicClick
{
    _myBtn.titleLabel.font = buttomFont(unClickFontSize) ;
    _musicBtn.titleLabel.font = titleButtomFont(clickFontSize) ;
    _findBtn.titleLabel.font = buttomFont(unClickFontSize) ;
    if ([self.delegate respondsToSelector:@selector(mainTitleView:clickIndex:)]) {
        [self.delegate mainTitleView:self clickIndex:2] ;
    }
    
}

- (void)findClick
{
    _myBtn.titleLabel.font = buttomFont(unClickFontSize) ;
    _musicBtn.titleLabel.font = buttomFont(unClickFontSize) ;
    _findBtn.titleLabel.font = titleButtomFont(clickFontSize) ;
    if ([self.delegate respondsToSelector:@selector(mainTitleView:clickIndex:)]) {
        [self.delegate mainTitleView:self clickIndex:3] ;
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
