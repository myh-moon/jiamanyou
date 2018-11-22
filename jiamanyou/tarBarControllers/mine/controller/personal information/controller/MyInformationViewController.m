//
//  MyInformationViewController.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/7.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "MyInformationViewController.h"
#import "BankListViewController.h" //银行卡操作
#import "ModifyNickNameViewController.h" //修改用户名
#import "AuthentyViewController.h"//认证

#import "UIViewController+MutipleImageChoice.h"

#import "SeperateItem.h"
#import "SettingItem.h"
#import "MyInformationItem.h"
#import "MyHeadItem.h"

@interface MyInformationViewController ()

@end

@implementation MyInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"个人信息";
    self.navigationItem.leftBarButtonItem = self.backBarButtonItem;
    
    self.jiaManager[@"SeperateItem"] = @"SeperateCell";
    self.jiaManager[@"SettingItem"] = @"SettingCell";
    self.jiaManager[@"MyInformationItem"] = @"MyInformationCell";
    self.jiaManager[@"MyHeadItem"] = @"MyHeadCell";
    
    [self setupMyInformationTableView];
}

- (void) setupMyInformationTableView {
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.jiaManager addSection:section];
    
    MyHeadItem *headItem = [[MyHeadItem alloc] init];
    headItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:headItem];
    JWeakSelf;
    @weakify(headItem);
    headItem.selectionHandler = ^(id item) {
        [weakself showHint:@"更换用户头像"];
        [weakself addImageWithMaxSelection:1 andMutipleChoise:YES andFinishBlock:^(NSArray *images) {
            @strongify(headItem);
            headItem.portraitString = images[0];
        }];
    };
    
    SettingItem *nickItem = [[SettingItem alloc] init];
    nickItem.selectionStyle = UITableViewCellSelectionStyleNone;
    nickItem.titleString = @"昵称";
    nickItem.actString = @"显示用户名 >";
    nickItem.seperateType = 1;
    [section addItem:nickItem];
    nickItem.selectionHandler = ^(id item) {
        ModifyNickNameViewController *modifyNickNameVC = [[ModifyNickNameViewController alloc] init];
        [weakself.navigationController pushViewController:modifyNickNameVC animated:YES];
    };
    
    MyInformationItem *invitatonCodeItem = [[MyInformationItem alloc] init];
    invitatonCodeItem.selectionStyle = UITableViewCellSelectionStyleNone;
    invitatonCodeItem.titleString = @"邀请码";
    invitatonCodeItem.contentString = @"1234456";
    invitatonCodeItem.seperateType = 0;
    [section addItem:invitatonCodeItem];
    
    SeperateItem *seperateItem1 = [[SeperateItem alloc] init];
    seperateItem1.selectionStyle = UITableViewCellSelectionStyleNone;
    seperateItem1.cellHeight = 15;
    [section addItem:seperateItem1];
    
    SettingItem *phoneItem = [[SettingItem alloc] init];
    phoneItem.selectionStyle = UITableViewCellSelectionStyleNone;
    phoneItem.titleString = @"手机号";
    phoneItem.actString = @"123***89";
    phoneItem.seperateType = 1;
    [section addItem:phoneItem];
    
    MyInformationItem *authentyItem = [[MyInformationItem alloc] init];
    authentyItem.selectionStyle = UITableViewCellSelectionStyleNone;
    authentyItem.titleString = @"实名认证";
    authentyItem.contentString = @"420****777";
    authentyItem.seperateType = 1;
    [section addItem:authentyItem];
    authentyItem.selectionHandler = ^(id item) {
        AuthentyViewController *authentyVC = [[AuthentyViewController alloc] init];
        [weakself.navigationController pushViewController:authentyVC animated:YES];
    };
    
    SettingItem *bankCardItem = [[SettingItem alloc] init];
    bankCardItem.selectionStyle = UITableViewCellSelectionStyleNone;
    bankCardItem.titleString = @"银行卡";
    bankCardItem.actString = @"管理银行卡";
    bankCardItem.seperateType = 0;
    [section addItem:bankCardItem];
    bankCardItem.selectionHandler = ^(id item) {
        BankListViewController *bankListVC = [[BankListViewController alloc] init];
        [weakself.navigationController pushViewController:bankListVC animated:YES];
    };
    
    SeperateItem *seperateItem2 = [[SeperateItem alloc] init];
    seperateItem2.selectionStyle = UITableViewCellSelectionStyleNone;
    seperateItem2.cellHeight = 15;
    [section addItem:seperateItem2];
    
    MyInformationItem *emailItem = [[MyInformationItem alloc] init];
    emailItem.selectionStyle = UITableViewCellSelectionStyleNone;
    emailItem.titleString = @"邮箱";
    emailItem.contentString = @"1233***@qq.com";
    emailItem.seperateType = 0;
    [section addItem:emailItem];
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
