//
//  QMMyMusicCell.m
//  UIPageViewController学习
//
//  Created by weiwei on 16/9/6.
//  Copyright © 2016年 weiwei. All rights reserved.
//

#import "QMMyMusicCell.h"

@interface QMMyMusicCell ()

@property (nonatomic ,strong) UIView *bgView ;
@property (nonatomic ,strong) UIImageView *imageView ;
@property (nonatomic ,strong) UILabel *nameLabel ;
@property (nonatomic ,strong) UILabel *numLabel ;

@end

@implementation QMMyMusicCell

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView newAutoLayoutView] ;
        _bgView.backgroundColor = [UIColor clearColor] ;
//        _bgView.alpha = 0.7 ;
    }
    return _bgView ;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [UIImageView newAutoLayoutView] ;
    }
    return _imageView ;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [UILabel newAutoLayoutView] ;
        _nameLabel.textColor = [UIColor whiteColor] ;
        _nameLabel.font = buttomFont(12) ;
    }
    return _nameLabel ;
}

- (UILabel *)numLabel {
    if (!_numLabel) {
        _numLabel = [UILabel newAutoLayoutView] ;
        _numLabel.font = buttomFont(10) ;
        _numLabel.textColor = UIColorFromRGB(0x8d969b) ;
    }
    return _numLabel ;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initUI] ;
        
    }
    return self ;
}

- (void)initUI
{
    [self.bgView addSubview:self.imageView] ;
    [self.bgView addSubview:self.nameLabel] ;
    [self.bgView addSubview:self.numLabel] ;
    [self.contentView addSubview:self.bgView] ;
    
    [self setupConstraints] ;
}

- (void)setupConstraints {
    [self.bgView autoPinEdgesToSuperviewEdges] ;
    [self.imageView autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.bgView withOffset:20] ;
    [self.imageView autoAlignAxis:ALAxisVertical toSameAxisOfView:self.bgView] ;
    [self.imageView autoSetDimension:ALDimensionWidth toSize:55] ;
    [self.imageView autoSetDimension:ALDimensionHeight toSize:55] ;
    
    [self.nameLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.imageView withOffset:5] ;
    [self.nameLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:self.imageView] ;
    
    [self.numLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.nameLabel withOffset:5] ;
    [self.numLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:self.nameLabel] ;
    
}

- (void)updateWithCellData:(id)aData atIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        self.nameLabel.text = @"全部歌曲" ;
        self.numLabel.text = @"38" ;
        self.imageView.image = [UIImage imageNamed:@"concise_icon_allsongs_normal"] ;
        
    } else if (indexPath.row == 1) {
        self.nameLabel.text = @"下载歌曲" ;
        self.numLabel.text = @"286" ;
        self.imageView.image = [UIImage imageNamed:@"concise_icon_download_normal"] ;

    } else if (indexPath.row == 2) {
        self.nameLabel.text = @"最近播放" ;
        self.numLabel.text = @"1" ;
        self.imageView.image = [UIImage imageNamed:@"concise_icon_history_normal"] ;

    } else if (indexPath.row == 3) {
        self.nameLabel.text = @"我喜欢" ;
        self.numLabel.text = @"38" ;
        self.imageView.image = [UIImage imageNamed:@"concise_icon_favorite_normal"] ;

    } else if (indexPath.row == 4) {
        self.nameLabel.text = @"下载MV" ;
        self.imageView.image = [UIImage imageNamed:@"concise_icon_mv_normal"] ;

    } else if (indexPath.row == 5) {
        self.nameLabel.text = @"听歌识曲" ;
        self.imageView.image = [UIImage imageNamed:@"concise_icon_recognizer_small_normal"] ;

    }
}

@end
