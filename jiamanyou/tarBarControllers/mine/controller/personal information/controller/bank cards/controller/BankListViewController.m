//
//  BankListViewController.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/7.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "BankListViewController.h"
#import "AddCardViewController.h"

#import "BankMessageItem.h"
#import "BankMessageAddItem.h"

@interface BankListViewController ()

@end

@implementation BankListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的银行卡";
    self.navigationItem.leftBarButtonItem = self.backBarButtonItem;
    
    self.jiaManager[@"BankMessageItem"] = @"BankMessageCell";
    self.jiaManager[@"BankMessageAddItem"] = @"BankMessageAddCell";
    
    [self setupBankListTableView];
}

- (void) setupBankListTableView {
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.jiaManager addSection:section];
    
    JWeakSelf;
    BankMessageItem *messageItem = [[BankMessageItem alloc] init];
    messageItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:messageItem];
    
    BankMessageAddItem *item = [[BankMessageAddItem alloc] init];
    item.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:item];
    item.selectionHandler = ^(id item) {        
        AddCardViewController *addCardVC = [[AddCardViewController alloc] init];
        [weakself.navigationController pushViewController:addCardVC animated:YES];
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
