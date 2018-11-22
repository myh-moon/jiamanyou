//
//  MyAssetsViewController.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/6.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "MyAssetsViewController.h"


#import "MyAssetsItem.h"
#import "MyAssetsDistributionItem.h"

@interface MyAssetsViewController ()

@end

@implementation MyAssetsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"资产总额";
    self.navigationItem.leftBarButtonItem = self.backBarButtonItem;
    
    self.jiaManager[@"MyAssetsItem"] = @"MyAssetsCell";
    self.jiaManager[@"MyAssetsDistributionItem"] = @"MyAssetsDistributionCell";

    [self setupMyAssetsTableView];
}

- (void) setupMyAssetsTableView {
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.jiaManager addSection:section];
    
    MyAssetsItem *myAssetsItem = [[MyAssetsItem alloc] init];
    myAssetsItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:myAssetsItem];
    
    MyAssetsDistributionItem *myAssetsDistributionItem = [[MyAssetsDistributionItem alloc] init];
    myAssetsDistributionItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:myAssetsDistributionItem];
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
