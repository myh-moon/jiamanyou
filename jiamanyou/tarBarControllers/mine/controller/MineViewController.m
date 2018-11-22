//
//  MineViewController.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/2.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "MineViewController.h"
#import "CapitalViewController.h" //交易记录
#import "PacketViewController.h" //红包
#import "TotalProfitViewController.h" //累计收益
#import "MyInvestmentViewController.h" //我的投资
#import "MyAssetsViewController.h" //我的资产
#import "SettingViewController.h" //设置
#import "MyInformationViewController.h" //用户信息
#import "RechargeViewController.h" //充值
#import "WithdrawViewController.h" //提现
#import "DailyProfitViewController.h"  //每日收益


#import "UserCenterItem.h"
#import "UserPacketItem.h"
#import "UserRemainderItem.h"
#import "SeperateItem.h"
#import "UserManageItem.h"
#import "UserInvestItem.h"

@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"我的";
    self.jiaTableView.backgroundColor = JWhiteColor;
    
    self.jiaManager[@"UserCenterItem"] = @"UserCenterCell";
    self.jiaManager[@"UserPacketItem"] = @"UserPacketCell";
    self.jiaManager[@"UserRemainderItem"] = @"UserRemainderCell";
    self.jiaManager[@"SeperateItem"] = @"SeperateCell";
    self.jiaManager[@"UserManageItem"] = @"UserManageCell";
    self.jiaManager[@"UserInvestItem"] = @"UserInvestCell";
    
    [self setupMineTableView];
}

- (void) setupMineTableView {
    
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.jiaManager addSection:section];
    
    JWeakSelf;
    //user messages
    UserCenterItem *userCenterItem = [[UserCenterItem alloc] init];
    userCenterItem.selectionStyle =UITableViewCellSelectionStyleNone;
    [section addItem:userCenterItem];
    [userCenterItem setDidSelectedBtn:^(NSInteger tag) {
        if (tag == 92) {
            MyInformationViewController *myInformationVC = [[MyInformationViewController alloc] init];
            myInformationVC.hidesBottomBarWhenPushed = YES;
            [weakself.navigationController pushViewController:myInformationVC animated:YES];
        }else if (tag == 93) {
            SettingViewController *settingVC = [[SettingViewController alloc] init];
            settingVC.hidesBottomBarWhenPushed = YES;
            [weakself.navigationController pushViewController:settingVC animated:YES];
        }else if (tag == 94) {
            MyAssetsViewController *myAssetsVC = [[MyAssetsViewController alloc] init];
            myAssetsVC.hidesBottomBarWhenPushed = YES;
            [weakself.navigationController pushViewController:myAssetsVC animated:YES];
        }else if (tag == 95) {
            DailyProfitViewController *dailyProfitVC = [[DailyProfitViewController alloc] init];
            [weakself.navigationController pushViewController:dailyProfitVC animated:YES];
        }else if (tag == 96){
            TotalProfitViewController *totalProfitVC = [[TotalProfitViewController alloc] init];
            totalProfitVC.hidesBottomBarWhenPushed = YES;
            [weakself.navigationController pushViewController:totalProfitVC animated:YES];
        }
    }];
    
    //packet  and collection
    UserPacketItem *packetItem = [[UserPacketItem alloc] init];
    packetItem.selectionStyle  =UITableViewCellSelectionStyleNone;
    [section addItem:packetItem];
    [packetItem setDidSelectedBtn:^(NSInteger tag) {
        if (tag == 123) {
            PacketViewController *packetVC = [[PacketViewController alloc] init];
            packetVC.hidesBottomBarWhenPushed = YES;
            [weakself.navigationController pushViewController:packetVC animated:YES];
        }
    }];
    
    //remainder and withdraw and recharge
    UserRemainderItem *remainderItem = [[UserRemainderItem alloc] init];
    remainderItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:remainderItem];
    remainderItem.didSelectedBtn = ^(NSInteger tag) {
        if (tag == 33) {
            WithdrawViewController *withdrawVC = [[WithdrawViewController alloc] init];
            withdrawVC.hidesBottomBarWhenPushed = YES;
            [weakself.navigationController pushViewController:withdrawVC animated:YES];
        }else if (tag == 34){
            RechargeViewController *rechargeVC = [[RechargeViewController alloc] init];
            rechargeVC.hidesBottomBarWhenPushed = YES;
            [weakself.navigationController pushViewController:rechargeVC animated:YES];
        }
    };
    
    
    
    //seperate
    SeperateItem *sepeItem = [[SeperateItem alloc] init];
    sepeItem.selectionStyle = UITableViewCellSelectionStyleNone;
    sepeItem.cellHeight = JSmallSpacing;
    [section addItem:sepeItem];
    
    //manage
    UserManageItem *manageItem = [[UserManageItem alloc] init];
    manageItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:manageItem];
    
    //invest
    UserInvestItem *investItem = [[UserInvestItem alloc] init];
    investItem.selectionStyle = UITableViewCellSelectionStyleNone;
    investItem.titleString = @"投资";
    investItem.actionString = @"投资情况";
    [section addItem:investItem];
    investItem.selectionHandler = ^(id item) {
        MyInvestmentViewController *myInvestmentVC = [[MyInvestmentViewController alloc] init];
        myInvestmentVC.hidesBottomBarWhenPushed = YES;
        [weakself.navigationController pushViewController:myInvestmentVC animated:YES];
    };
    
    //capital details
    UserInvestItem *capitalItem = [[UserInvestItem alloc] init];
    capitalItem.selectionStyle = UITableViewCellSelectionStyleNone;
    capitalItem.titleString = @"资金";
    capitalItem.actionString = @"资金明细";
    [section addItem:capitalItem];
    capitalItem.selectionHandler = ^(id item) {
        CapitalViewController *capitalVC = [[CapitalViewController alloc] init];
        capitalVC.hidesBottomBarWhenPushed = YES;
        [weakself.navigationController pushViewController:capitalVC animated:YES];
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
