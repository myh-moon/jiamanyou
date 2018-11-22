//
//  CapitalViewController.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/6.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "CapitalViewController.h"

#import "CapitalItem.h"

@interface CapitalViewController ()

@end

@implementation CapitalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"交易记录";
    self.navigationItem.leftBarButtonItem = self.backBarButtonItem;
    
    self.jiaManager[@"CapitalItem"] = @"CapitalCell";

    [self setupCapitalTableView];
}

- (void) setupCapitalTableView {
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.jiaManager addSection:section];
    
    //list
    for (NSInteger i=0; i<10; i++) {
        CapitalItem *capitalItem = [[CapitalItem alloc] init];
        capitalItem.selectionStyle = UITableViewCellSelectionStyleNone;
        capitalItem.typeString = @"充值\n";
        capitalItem.timeString = @"2018-09-09 12:12:12";
        capitalItem.moneyString = @"+12000.00\n";
        capitalItem.resultString = @"成功";
        [section addItem:capitalItem];
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
