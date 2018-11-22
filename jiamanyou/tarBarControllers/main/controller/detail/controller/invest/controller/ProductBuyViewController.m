//
//  ProductBuyViewController.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/3.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "ProductBuyViewController.h"

#import "BuyMessageItem.h"
#import "SeperateItem.h"
#import "CommonItem.h"
#import "BuyItem.h"
#import "ProfitItem.h"
#import "PurchaseItem.h"

@interface ProductBuyViewController ()

@end

@implementation ProductBuyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"购买";
    self.navigationItem.leftBarButtonItem = self.backBarButtonItem;
    
    self.jiaManager[@"BuyMessageItem"] = @"BuyMessageCell";
    self.jiaManager[@"SeperateItem"] = @"SeperateCell";
    self.jiaManager[@"CommonItem"] = @"CommonCell";
    self.jiaManager[@"BuyItem"] = @"BuyCell";
    self.jiaManager[@"ProfitItem"] = @"ProfitCell";
    self.jiaManager[@"PurchaseItem"] = @"PurchaseCell";
    
    [self setupInvestTableView];
}


- (void) setupInvestTableView {
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.jiaManager addSection:section];
    
    SeperateItem *seperateItem = [[SeperateItem alloc] init];
    seperateItem.cellHeight = JMiddleSpacing;
    seperateItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:seperateItem];
    
    //购买标详情
    BuyMessageItem *messageItem = [[BuyMessageItem alloc] init];
    messageItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:messageItem];
    
    SeperateItem *seperateItem1 = [[SeperateItem alloc] init];
    seperateItem1.cellHeight = JMiddleSpacing;
    seperateItem1.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:seperateItem1];
    
    //红包
    CommonItem *envelopeItem = [[CommonItem alloc] init];
    envelopeItem.selectionStyle = UITableViewCellSelectionStyleNone;
    envelopeItem.leftString = @"我的红包";
    envelopeItem.rightString = @"不使用红包";
    [section addItem:envelopeItem];
    
    //购买金额
    BuyItem *buyItem = [[BuyItem alloc] init];
    buyItem.selectionStyle = UITableViewCellSelectionStyleNone;
    buyItem.titleString = @"够买金额";
    buyItem.contentPlaceholder = @"100元起投";
    buyItem.unitString = @"元";
    [section addItem:buyItem];
    
    
    //预计收益
    ProfitItem *profitItem = [[ProfitItem alloc] init];
    profitItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:profitItem];
    
    //立即购买
    PurchaseItem *purchaseItem = [[PurchaseItem alloc] init];
    purchaseItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:purchaseItem];
    
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
