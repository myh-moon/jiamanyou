//
//  JiaTabBarViewController.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/2.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "JiaTabBarViewController.h"

#import "MainViewController.h"
#import "InvestViewController.h"
#import "ServiceViewController.h"
#import "MineViewController.h"

@interface JiaTabBarViewController ()

#import "MainViewController.h"


@end

@implementation JiaTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupJiaTabBar];
}

- (void) setupJiaTabBar {
    MainViewController *mainVC = [[MainViewController alloc] init];
    mainVC.title = @"首页";
    mainVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"" image:nil selectedImage:nil];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:mainVC];

    
    InvestViewController *investVC = [[InvestViewController alloc] init];
    investVC.title = @"投资";
    investVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"投资" image:nil selectedImage:nil];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:investVC];
    
    MineViewController *mineVC = [[MineViewController alloc] init];
    mineVC.title = @"我的";
    mineVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:nil selectedImage:nil];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:mineVC];
    
    ServiceViewController *serviceVC = [[ServiceViewController alloc] init];
    serviceVC.title = @"信批";
    serviceVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"信批" image:nil selectedImage:nil];
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:serviceVC];
    
    
    self.viewControllers = @[nav1,nav2,nav3,nav4];
    self.tabBar.backgroundColor = JWhiteColor;
    self.tabBar.tintColor = JBlackColor;
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
