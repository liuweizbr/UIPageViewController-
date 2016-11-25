//
//  QMMainVC.m
//  UIpageViewController学习
//
//  Created by weiwei on 16/8/31.
//  Copyright © 2016年 weiwei. All rights reserved.
//

#import "QMMainVC.h"
#import "QMMainTitleView.h"
#import "QMFindVC.h"
#import "QMMyVC.h"
#import "QMMusicVC.h"

@interface QMMainVC ()<UIPageViewControllerDataSource,UIPageViewControllerDelegate,QMMainTitleViewDelegate>

@property (nonatomic ,strong) QMMainTitleView *titleView ;
@property (nonatomic ,strong) UIImageView *bgImageView ;


@property (nonatomic ,strong) QMMyVC *myVC ;
@property (nonatomic ,strong) QMMusicVC *musicVC ;
@property (nonatomic ,strong) QMFindVC *findVC ;

@property (nonatomic ,strong) NSMutableArray *contentPageVCs ;
@property (nonatomic ,strong) UIPageViewController *pageViewController ;



@end

@implementation QMMainVC

- (UIImageView *)bgImageView
{
    if (!_bgImageView) {
        _bgImageView= [UIImageView newAutoLayoutView] ;
        _bgImageView.image = [UIImage imageNamed:@"Main_bgImage"] ;
    }
    return _bgImageView ;
}

- (UIPageViewController *)pageViewController
{
    if (!_pageViewController) {
        NSDictionary *options = [NSDictionary dictionaryWithObject:[NSNumber numberWithInteger:UIPageViewControllerSpineLocationMin] forKey:UIPageViewControllerOptionSpineLocationKey] ;
        _pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:options] ;
        _pageViewController.view.translatesAutoresizingMaskIntoConstraints = NO  ;
        _pageViewController.delegate = self ;
        _pageViewController.dataSource = self ;
    }
    return _pageViewController ;
}

- (NSMutableArray *)contentPageVCs
{
    if (!_contentPageVCs) {
        _contentPageVCs = [[NSMutableArray alloc]initWithArray:@[self.myVC,self.musicVC,self.findVC]];
    }
    return _contentPageVCs ;
}

- (QMMyVC *)myVC
{
    if (!_myVC) {
        _myVC = [QMMyVC new] ;
    }
    return _myVC ;
}

- (QMMusicVC *)musicVC
{
    if (!_musicVC) {
        _musicVC = [QMMusicVC new] ;
    }
    return _musicVC ;
}



- (QMFindVC *)findVC
{
    if (!_findVC) {
        _findVC = [QMFindVC new] ;
    }
    return _findVC ;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initNav] ;
    [self initUI] ;
}

- (void)initUI
{
    [self.view addSubview:self.bgImageView] ;
    
    [self.bgImageView autoPinEdgesToSuperviewEdges] ;
    
    [self.pageViewController setViewControllers:@[self.myVC]
                                      direction:UIPageViewControllerNavigationDirectionForward
                                       animated:NO
                                     completion:nil] ;
    
    
    
    [self addChildViewController:self.pageViewController] ;
    [self.view addSubview:self.pageViewController.view] ;

}

- (void)initNav
{
    _titleView = [[QMMainTitleView alloc] initWithFrame:CGRectMake(0, 0, 200, 44)] ;
    _titleView.delegate = self ;
    self.navigationItem.titleView = _titleView ;
}

- (UIViewController *)lastContentVC:(UIViewController *)viewController
{
    NSInteger index = [self.contentPageVCs indexOfObject:viewController] ;
    if (index <= 0) {
        index = 0 ;
    }else{
        index-- ;
    }
    return [self.contentPageVCs objectAtIndex:index] ;
}

- (UIViewController *)nextContentVC:(UIViewController *)viewController
{
    NSInteger index = [self.contentPageVCs indexOfObject:viewController] ;
    if (index >= 2) {
        index = 2 ;
    }else{
        index++ ;
    }
    return [self.contentPageVCs objectAtIndex:index] ;
}

// 得到相应的VC对象
- (UIViewController *)viewControllerAtIndex:(NSInteger)index
{
    if (self.contentPageVCs.count == 0 || index >= self.contentPageVCs.count ) {
        return nil;
    }
    return [self.contentPageVCs objectAtIndex:index] ;
}

- (NSUInteger)indexOfViewController:(UIViewController *)viewController
{
    return [self.contentPageVCs indexOfObject:viewController] ;
}

#pragma mark - UIpageViewControllerDataSource
// 返回上一个ViewController对象
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:viewController] ;
    if (index <= 0 || index == NSNotFound) {
        return nil ;
    }
    
    UIViewController *contentVC = [self lastContentVC:viewController] ;
    
    index -- ;
    
    return contentVC ;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:viewController] ;
    if (index == NSNotFound || index >= 2) {
        return nil ;
    }
    
    UIViewController *contentVC = [self nextContentVC:viewController] ;
    index ++ ;
    
    return contentVC ;
}

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed
{
    UIViewController *viewController = self.pageViewController.viewControllers[0] ;
    
    NSUInteger index = [self indexOfViewController:viewController] ;
    self.titleView.selecteIndex = index + 1 ;
}

#pragma mark - QMMainTitleViewDelegate
- (void)mainTitleView:(QMMainTitleView *)view clickIndex:(NSInteger)index
{
    UIViewController *viewController = [self viewControllerAtIndex:index - 1] ;
    [self.pageViewController setViewControllers:@[viewController] direction:
     UIPageViewControllerNavigationDirectionForward animated:NO completion:^(BOOL finished) {
        
    }] ;
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
