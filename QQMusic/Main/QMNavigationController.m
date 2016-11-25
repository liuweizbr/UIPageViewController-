//
//  QMNavigationController.m
//  UIPageViewController学习
//
//  Created by weiwei on 16/8/31.
//  Copyright © 2016年 weiwei. All rights reserved.
//

#import "QMNavigationController.h"

@interface QMNavigationController ()

@end

@implementation QMNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationBar.barTintColor = RGB(43, 195, 128) ;
    self.navigationBar.translucent = NO;


    
}
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent ;
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
