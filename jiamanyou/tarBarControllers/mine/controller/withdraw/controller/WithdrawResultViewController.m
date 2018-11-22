//
//  WithdrawResultViewController.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/8.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "WithdrawResultViewController.h"
#import "WithdrawProgressViewController.h"


#import "WithdrawResultItem.h"

@interface WithdrawResultViewController ()

@end

@implementation WithdrawResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"提现";
    self.navigationItem.leftBarButtonItem = self.backBarButtonItem;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightNavButton];
    [self.rightNavButton setTitle:@"提现进度" forState:0];
    
    self.jiaManager[@"WithdrawResultItem"] = @"WithdrawResultCell";
    
    [self setupWithdrawResultTableView];
}

- (void)rightNavAction {
    WithdrawProgressViewController *withdrawProgressVC = [[WithdrawProgressViewController alloc] init];
    [self.navigationController pushViewController:withdrawProgressVC animated:YES];
}

- (void) setupWithdrawResultTableView {
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.jiaManager addSection:section];
    
    WithdrawResultItem *resultItem = [[WithdrawResultItem alloc] init];
    resultItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:resultItem];
    resultItem.didSelectedBtn = ^(NSInteger tag) {
        NSLog(@"提现完成");
    };
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
