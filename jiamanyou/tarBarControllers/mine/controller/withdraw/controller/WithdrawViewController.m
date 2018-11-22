//
//  WithdrawViewController.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/8.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "WithdrawViewController.h"
#import "WithdrawProgressViewController.h"
#import "WithdrawResultViewController.h"

#import "RechargeCardItem.h"
#import "SeperateItem.h"
#import "WithdrawMoneyItem.h"
#import "RechargeItem.h"
#import "WithdrawRuleItem.h"
#import "RechargeCommitItem.h"

@interface WithdrawViewController ()

@property (nonatomic,strong) NSMutableDictionary *withdrawDic;

@end

@implementation WithdrawViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title  = @"提现";
    self.navigationItem.leftBarButtonItem = self.backBarButtonItem;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightNavButton];
    [self.rightNavButton setTitle:@"提现进度" forState:0];
    
    self.jiaManager[@"RechargeCardItem"] = @"RechargeCardCell";
    self.jiaManager[@"SeperateItem"] = @"SeperateCell";
    self.jiaManager[@"WithdrawMoneyItem"] = @"WithdrawMoneyCell";
    self.jiaManager[@"RechargeItem"] = @"RechargeCell";
    self.jiaManager[@"WithdrawRuleItem"] = @"WithdrawRuleCell";
    self.jiaManager[@"RechargeCommitItem"] = @"RechargeCommitCell";
    
    [self setupWithdrawTableView];
 }

#pragma mark - getter
- (NSMutableDictionary *)withdrawDic {
    if (!_withdrawDic) {
        _withdrawDic = [NSMutableDictionary dictionary];
    }
    return _withdrawDic;
}

#pragma mark - method
- (void)rightNavAction {
    WithdrawProgressViewController *withdrawProgressVC = [[WithdrawProgressViewController alloc] init];
    [self.navigationController pushViewController:withdrawProgressVC animated:YES];
}

- (void) setupWithdrawTableView {
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.jiaManager addSection:section];
    
    SeperateItem *seperateItem1 = [[SeperateItem alloc] init];
    seperateItem1.selectionStyle = UITableViewCellSelectionStyleNone;
    seperateItem1.cellHeight = JSmallSpacing;
    [section addItem:seperateItem1];
    
    //卡信息
    RechargeCardItem *cardItem = [[RechargeCardItem alloc] init];
    cardItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:cardItem];
    
    //显示可提现金额
    WithdrawMoneyItem *moneyItem = [[WithdrawMoneyItem alloc] init];
    moneyItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:moneyItem];
    JWeakSelf;
    @weakify(moneyItem);
    moneyItem.didSelectedBtn = ^(NSInteger tag) {
        [weakself showHint:@"全部提现"];
        @strongify(moneyItem);
        moneyItem.moneyString = @"12312";
    };
    
    //输入提现金额
    RechargeItem *withdrawItem = [[RechargeItem alloc] init];
    withdrawItem.selectionStyle = UITableViewCellSelectionStyleNone;
    withdrawItem.titleString = @"提现金额";
    withdrawItem.placeHolderString = @"输入金额大于100元";
    [section addItem:withdrawItem];
    withdrawItem.didEditing = ^(NSString *text) {
        [weakself.withdrawDic setValue:text forKey:@"money"];
    };
    
    RACSignal *moneySignal = [RACSignal combineLatest:@[RACObserve(moneyItem, moneyString)] reduce:^id(NSString *money){
        
        withdrawItem.moneyTextString = money;
        [weakself.withdrawDic setValue:money forKey:@"money"];
        
        return @"12";
    }];
    [moneySignal subscribeNext:^(id x) {
        
    }];
    
    //规则
    WithdrawRuleItem *ruleItem = [[WithdrawRuleItem alloc] init];
    ruleItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:ruleItem];
    
    //确认提现
    RechargeCommitItem *commitItem = [[RechargeCommitItem alloc] init];
    commitItem.selectionStyle = UITableViewCellSelectionStyleNone;
    commitItem.commitString = @"确定提现";
    [section addItem:commitItem];
    commitItem.didSelectedBtn = ^(NSInteger tag) {
        [weakself confirmToWithdraw];
    };
}

- (void) confirmToWithdraw {
    
    WithdrawResultViewController *withdrawResultVC = [[WithdrawResultViewController alloc] init];
    [self.navigationController pushViewController:withdrawResultVC animated:YES];
    return;
    
    NSString *withdrawString = @"";
    
    JWeakSelf;
    [self requestDataPostWithString:withdrawString params:self.withdrawDic successBlock:^(id responseObject) {
        
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
