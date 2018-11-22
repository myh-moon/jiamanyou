//
//  WithdrawProgressViewController.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/8.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "WithdrawProgressViewController.h"

#import "WithdrawProgressItem.h"
@interface WithdrawProgressViewController ()

@end

@implementation WithdrawProgressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"提现进度";
    self.navigationItem.leftBarButtonItem = self.backBarButtonItem;
    
    self.jiaManager[@"WithdrawProgressItem"] = @"WithdrawProgressCell";
    
    [self setupWithdrawProgressTableView];
}

- (void) setupWithdrawProgressTableView {
    
    for (NSInteger i=0; i<4; i++) {
        UILabel *header = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, JWindowWidth, 40)];
        header.text = @"    记录";
        header.textColor = JLightGrayColor11;
        header.font = JFont3;
        header.backgroundColor = JBackGroundColor;
        RETableViewSection *section = [RETableViewSection section];
        section.headerHeight = 40;
        section.footerHeight = 0;
        section.headerView  = header;
        [self.jiaManager addSection:section];
        
        for (NSInteger j=0; j<4; j++) {
            WithdrawProgressItem *progressItem = [[WithdrawProgressItem alloc] init];
            progressItem.selectionStyle = UITableViewCellSelectionStyleNone;
            [section addItem:progressItem];
        }
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
