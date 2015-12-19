//
//  RootTabBarViewController.m
//  JKZX
//
//  Created by qianfeng on 15/12/18.
//  Copyright © 2015年 张旭华. All rights reserved.
//

#import "RootTabBarViewController.h"
#import "HomePageViewController.h"
#import "MoreViewController.h"

@interface RootTabBarViewController ()

@end

@implementation RootTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self setEdgesForExtendedLayout:UIRectEdgeNone];
//    self.automaticallyAdjustsScrollViewInsets = YES;
    
    HomePageViewController *homePageVC = [[HomePageViewController alloc] init];
    homePageVC.title = @"资讯";
    
    MoreViewController *moreVC = [[MoreViewController alloc] init];
    moreVC.title = @"更多";
    
    self.viewControllers = @[homePageVC,moreVC];
    
    
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
