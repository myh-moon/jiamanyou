//
//  SettingViewController.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/7.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "SettingViewController.h"
#import "SecurityViewController.h"  //安全管理
#import "CustomFeedbackViewController.h"  //客户反馈
#import "AgreementViewController.h" //协议

#import "SeperateItem.h"
#import "SettingItem.h"
#import "SettingElseItem.h"
#import "SignOutItem.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"设置";
    self.navigationItem.leftBarButtonItem = self.backBarButtonItem;
    
    self.jiaManager[@"SeperateItem"] = @"SeperateCell";
    self.jiaManager[@"SettingItem"] = @"SettingCell";
    self.jiaManager[@"SettingElseItem"] = @"SettingElseCell";
    self.jiaManager[@"SignOutItem"] = @"SignOutCell";

    [self setupSettingTableView];
}

- (void) setupSettingTableView {
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.jiaManager addSection:section];
    
    SeperateItem *seperateItem1 = [[SeperateItem alloc] init];
    seperateItem1.cellHeight = JBigSpacing;
    seperateItem1.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:seperateItem1];
    
    JWeakSelf;
    SettingItem *securityItem = [[SettingItem alloc] init];
    securityItem.selectionStyle = UITableViewCellSelectionStyleNone;
    securityItem.titleString = @"安全管理";
    securityItem.actString = @"密码修改  ";
    securityItem.seperateType = 1;
    [section addItem:securityItem];
    securityItem.selectionHandler = ^(id item) {
        SecurityViewController *securityVC = [[SecurityViewController alloc] init];
        [weakself.navigationController pushViewController:securityVC animated:YES];
    };
    
    SettingElseItem *accountItem = [[SettingElseItem alloc] init];
    accountItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:accountItem];
    
    SeperateItem *seperateItem2 = [[SeperateItem alloc] init];
    seperateItem2.cellHeight = JSmallSpacing;
    seperateItem2.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:seperateItem2];
    
    SettingItem *feedbackItem = [[SettingItem alloc] init];
    feedbackItem.selectionStyle = UITableViewCellSelectionStyleNone;
    feedbackItem.titleString = @"客服反馈";
    feedbackItem.actString = @"";
    feedbackItem.seperateType = 1;
    [section addItem:feedbackItem];
    feedbackItem.selectionHandler = ^(id item) {
        CustomFeedbackViewController *customFeedbackVC = [[CustomFeedbackViewController alloc] init];
        [weakself.navigationController pushViewController:customFeedbackVC animated:YES];
    };
    
    SettingItem *agreementItem = [[SettingItem alloc] init];
    agreementItem.selectionStyle = UITableViewCellSelectionStyleNone;
    agreementItem.titleString = @"伽满优用户协议";
    agreementItem.actString = @"";
    agreementItem.seperateType = 0;
    [section addItem:agreementItem];
    agreementItem.selectionHandler = ^(id item) {
        AgreementViewController *agreementVC = [[AgreementViewController alloc] init];
        agreementVC.agreeString = @"伽满优用户协议";
        [weakself.navigationController pushViewController:agreementVC animated:YES];
    };
    
    SeperateItem *seperateItem3 = [[SeperateItem alloc] init];
    seperateItem3.cellHeight = 40;
    seperateItem3.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:seperateItem3];
    
    SignOutItem *signOutItem = [[SignOutItem alloc] init];
    signOutItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:signOutItem];
    signOutItem.didSelectedBtn = ^(NSInteger tag) {
        NSLog(@"退出");
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
