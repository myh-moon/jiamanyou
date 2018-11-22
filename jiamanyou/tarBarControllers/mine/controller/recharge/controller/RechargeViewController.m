//
//  RechargeViewController.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/8.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "RechargeViewController.h"
#import "RechargeResultViewController.h"

#import "RechargeRuleItem.h"
#import "RechargeCardItem.h"
#import "RechargeMoneyItem.h"
#import "RechargeItem.h"
#import "RechargeLimitItem.h"
#import "RechargeCommitItem.h"

@interface RechargeViewController ()

@property (nonatomic,strong) NSMutableDictionary *rechargeDic;

@end

@implementation RechargeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"充值";
    self.navigationItem.leftBarButtonItem = self.backBarButtonItem;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightNavButton];
    [self.rightNavButton setTitle:@"客服" forState:0];
    
    self.jiaManager[@"RechargeRuleItem"] = @"RechargeRuleCell";
    self.jiaManager[@"RechargeCardItem"] = @"RechargeCardCell";
    self.jiaManager[@"RechargeMoneyItem"] = @"RechargeMoneyCell";
    self.jiaManager[@"RechargeItem"] = @"RechargeCell";
    self.jiaManager[@"RechargeLimitItem"] = @"RechargeLimitCell";
    self.jiaManager[@"RechargeCommitItem"] = @"RechargeCommitCell";
    
    [self setupRechargeTableView];
}

#pragma mark - getter
- (NSMutableDictionary *)rechargeDic {
    if (!_rechargeDic) {
        _rechargeDic = [NSMutableDictionary dictionary];
    }
    return _rechargeDic;
}

#pragma mark - method
- (void)rightNavAction {
    NSLog(@"打电话给客服咨询");
}

- (void) setupRechargeTableView {
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.jiaManager addSection:section];
    
    RechargeRuleItem *ruleItem = [[RechargeRuleItem alloc] init];
    ruleItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:ruleItem];
    
    RechargeCardItem *cardMessageItem = [[RechargeCardItem alloc] init];
    cardMessageItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:cardMessageItem];
    
    RechargeMoneyItem *moneyItem = [[RechargeMoneyItem alloc] init];
    moneyItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:moneyItem];
    
    RechargeItem *rechargeItem = [[RechargeItem alloc] init];
    rechargeItem.selectionStyle = UITableViewCellSelectionStyleNone;
    rechargeItem.titleString = @"充值金额";
    rechargeItem.placeHolderString = @"不少于10元";
    [section addItem:rechargeItem];
    JWeakSelf;
    rechargeItem.didEditing = ^(NSString *text) {
        [weakself.rechargeDic setValue:text forKey:@"money"];
    };
    
    RechargeLimitItem *limitItem = [[RechargeLimitItem alloc] init];
    limitItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:limitItem];
    
    RechargeCommitItem *commitItem = [[RechargeCommitItem alloc] init];
    commitItem.selectionStyle = UITableViewCellSelectionStyleNone;
    commitItem.commitString = @"确定充值";
    [section addItem:commitItem];

    commitItem.didSelectedBtn = ^(NSInteger tag) {
        [weakself confirmToRechargeMoney];
    };
}

//充值
- (void) confirmToRechargeMoney {
    RechargeResultViewController *rechargeResultVC = [[RechargeResultViewController alloc] init];
    [self.navigationController pushViewController:rechargeResultVC animated:YES];
    
    return;
    
    NSString *rechargeString = @"";
    
    JWeakSelf;
    [self requestDataPostWithString:rechargeString params:self.rechargeDic successBlock:^(id responseObject) {
        
    } andFailBlock:^(NSError *error) {
    
    }];
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
