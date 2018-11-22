//
//  SecurityViewController.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/7.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "SecurityViewController.h"

#import "ModifyPayPasswordViewController.h"
#import "FindPayPasswordViewController.h"
#import "ModifyLoginPasswordViewController.h"

#import "SettingItem.h"
#import "SeperateItem.h"

@interface SecurityViewController ()

@end

@implementation SecurityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"安全管理";
    self.navigationItem.leftBarButtonItem = self.backBarButtonItem;
    
    self.jiaManager[@"SettingItem"] = @"SettingCell";
    self.jiaManager[@"SeperateItem"] = @"SeperateCell";
    
    [self setupSecurityTableView];
}

- (void) setupSecurityTableView {
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.jiaManager addSection:section];
    
    SeperateItem *seperateItem1 = [[SeperateItem alloc] init];
    seperateItem1.cellHeight = JBigSpacing;
    seperateItem1.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:seperateItem1];
    
    JWeakSelf;
    SettingItem *modifyItem = [[SettingItem alloc] init];
    modifyItem.selectionStyle = UITableViewCellSelectionStyleNone;
    modifyItem.titleString = @"修改支付密码";
    modifyItem.seperateType = 1;
    [section addItem:modifyItem];
    modifyItem.selectionHandler = ^(id item) {
        ModifyPayPasswordViewController *modifyPayPasswordVC = [[ModifyPayPasswordViewController alloc] init];
        [weakself.navigationController pushViewController:modifyPayPasswordVC animated:YES];
    };
    
    SettingItem *findItem = [[SettingItem alloc] init];
    findItem.selectionStyle = UITableViewCellSelectionStyleNone;
    findItem.titleString = @"找回支付密码";
    findItem.seperateType = 0;
    [section addItem:findItem];
    findItem.selectionHandler = ^(id item) {
        FindPayPasswordViewController *findPayPasswordVC = [[FindPayPasswordViewController alloc] init];
        [weakself.navigationController pushViewController:findPayPasswordVC animated:YES];
    };
    
    SeperateItem *seperateItem2 = [[SeperateItem alloc] init];
    seperateItem2.cellHeight = JBigSpacing;
    seperateItem2.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:seperateItem2];
    
    SettingItem *loginItem = [[SettingItem alloc] init];
    loginItem.selectionStyle = UITableViewCellSelectionStyleNone;
    loginItem.titleString = @"修改登录密码";
    loginItem.seperateType = 0;
    [section addItem:loginItem];
    loginItem.selectionHandler = ^(id item) {
        ModifyLoginPasswordViewController *modifyLoginPasswordVC = [[ModifyLoginPasswordViewController alloc] init];
        [weakself.navigationController pushViewController:modifyLoginPasswordVC animated:YES];
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
