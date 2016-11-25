//
//  QMMyVC.m
//  UIPageViewController学习
//
//  Created by weiwei on 16/9/5.
//  Copyright © 2016年 weiwei. All rights reserved.
//

#import "QMMyVC.h"
#import "QMMyInfoCVCell.h"
#import "QMMyMusicCell.h"
#import "QMSearchCVCell.h"

@interface QMMyVC ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic ,strong) QMCollectionView *collectionView ;


@end

@implementation QMMyVC

- (QMCollectionView *)collectionView {
    if (!_collectionView) {

        UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new] ;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical ;
        _collectionView = [[QMCollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout] ;
        _collectionView.delegate = self ;
        _collectionView.dataSource = self ;
        _collectionView.backgroundColor = [UIColor clearColor] ;

        [_collectionView registerClass:[QMSearchCVCell class] forCellWithReuseIdentifier:[QMSearchCVCell cellReuseIdentifier]] ;
        [_collectionView registerClass:[QMMyMusicCell class] forCellWithReuseIdentifier:[QMMyMusicCell cellReuseIdentifier]] ;
        [_collectionView registerClass:[QMMyInfoCVCell class] forCellWithReuseIdentifier:[QMMyInfoCVCell cellReuseIdentifier]] ;
        
    }
    return _collectionView ;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initUI] ;
    
}

- (void)initUI {
    
    [self.view addSubview:self.collectionView] ;
    [self.collectionView autoPinEdgesToSuperviewEdges] ;
    
}

#pragma mark - UICollectionViewDelegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 10 ;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 2) {
        return 6 ;
    }else{
        return 1 ;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        QMSearchCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[QMSearchCVCell cellReuseIdentifier] forIndexPath:indexPath] ;
        return cell ;
    }
    else if (indexPath.section == 2) {
        QMMyMusicCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[QMMyMusicCell cellReuseIdentifier] forIndexPath:indexPath] ;
        [cell updateWithCellData:nil atIndexPath:indexPath] ;
        return cell ;
    }
    else {
        QMMyInfoCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[QMMyInfoCVCell cellReuseIdentifier] forIndexPath:indexPath] ;
        cell.backgroundColor = [UIColor yellowColor] ;

        return cell ;
    }
}

#pragma mark - UICollectionViewFlowLayout
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0) ;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(collectionView.width, 0) ;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0 ;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0 ;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return CGSizeMake(collectionView.width, 10) ;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 2) {
        return CGSizeMake(collectionView.width/3, collectionView.width/3) ;
    }else if (indexPath.section == 0) {
        return CGSizeMake(collectionView.width, 40) ;
    }else {
        return CGSizeMake(collectionView.width, 60) ;
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
