//
//  QMMusicVC.m
//  UIPageViewController学习
//
//  Created by weiwei on 16/9/5.
//  Copyright © 2016年 weiwei. All rights reserved.
//

#import "QMMusicVC.h"
#import "QMEssenceVC.h"
#import "QMRankingVC.h"
#import "QMMusicListVC.h"
#import "QMRadioVC.h"
#import "QMMVVC.h"
#import "QMSelectedTypeMusicCVCell.h"

@interface QMMusicVC ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic ,strong) QMCollectionView *categoryView ;


@property (nonatomic ,strong) QMEssenceVC *essenceVC ;
@property (nonatomic ,strong) QMRankingVC *rangkingVC ;
@property (nonatomic ,strong) QMMusicListVC *musicListVC ;
@property (nonatomic ,strong) QMRadioVC *radioVC ;
@property (nonatomic ,strong) QMMVVC *mvVC ;

@property (nonatomic ,strong) NSMutableArray *contentPageVCs ;


@end

@implementation QMMusicVC

- (QMCollectionView *)categoryView
{
    if (!_categoryView) {
        UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new] ;
        flowLayout.itemSize = CGSizeMake(kScreen_Width/5, 40) ;
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0) ;
        flowLayout.minimumInteritemSpacing = 0 ;
        flowLayout.minimumLineSpacing = 0 ;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal ;
        _categoryView = [[QMCollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout] ;
        _categoryView.dataSource = self ;
        _categoryView.delegate = self ;
        _categoryView.backgroundColor = [UIColor redColor] ;
        _categoryView.showsHorizontalScrollIndicator = NO ;
        [_categoryView registerClass:[QMSelectedTypeMusicCVCell class] forCellWithReuseIdentifier:[QMSelectedTypeMusicCVCell cellReuseIdentifier]] ;
       
    }
    return _categoryView ;
}

#pragma mark - UICollectionViewDelegate && UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5 ;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    QMSelectedTypeMusicCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[QMSelectedTypeMusicCVCell cellReuseIdentifier] forIndexPath:indexPath] ;
    [cell updateWithCellData:nil atIndexPath:indexPath] ;
    return cell ;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor greenColor] ; 

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
