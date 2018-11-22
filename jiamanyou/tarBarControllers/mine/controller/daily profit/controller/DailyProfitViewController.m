//
//  DailyProfitViewController.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/9.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "DailyProfitViewController.h"

@interface DailyProfitViewController ()

@end

@implementation DailyProfitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"每日收益";
    self.navigationItem.leftBarButtonItem = self.backBarButtonItem;
    
    [self setupDailyProfitTableView];
}

- (void) setupDailyProfitTableView {
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.jiaManager addSection:section];
    
    
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
