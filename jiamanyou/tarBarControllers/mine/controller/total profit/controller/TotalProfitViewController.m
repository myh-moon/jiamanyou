//
//  TotalProfitViewController.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/6.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "TotalProfitViewController.h"

#import "MyProfitNameItem.h"
#import "MyProfitItem.h"
#import "SeperateItem.h"


@interface TotalProfitViewController ()

@end

@implementation TotalProfitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"累计收益";
    self.navigationItem.leftBarButtonItem = self.backBarButtonItem;
    
    self.jiaManager[@"MyProfitNameItem"] = @"MyProfitNameCell";
    self.jiaManager[@"MyProfitItem"] = @"MyProfitCell";
    self.jiaManager[@"SeperateItem"] = @"SeperateCell";
    
    [self setupTotalProfitTableView];
}

- (void) setupTotalProfitTableView {
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.jiaManager addSection:section];
    
    SeperateItem *seperateItem = [[SeperateItem alloc] init];
    seperateItem.cellHeight = JBigSpacing;
    seperateItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:seperateItem];
    
    
    for (NSInteger i=0; i<10; i++) {
        MyProfitNameItem *myProfitNameItem = [[MyProfitNameItem alloc] init];
        myProfitNameItem.selectionStyle = UITableViewCellSelectionStyleNone;
        [section addItem:myProfitNameItem];
        
        MyProfitItem *myProfitItem = [[MyProfitItem alloc] init];
        myProfitItem.selectionStyle = UITableViewCellSelectionStyleNone;
        [section addItem:myProfitItem];
        
        SeperateItem *sepeItem = [[SeperateItem alloc] init];
        sepeItem.cellHeight = JBigSpacing;
        sepeItem.selectionStyle = UITableViewCellSelectionStyleNone;
        [section addItem:sepeItem];
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
