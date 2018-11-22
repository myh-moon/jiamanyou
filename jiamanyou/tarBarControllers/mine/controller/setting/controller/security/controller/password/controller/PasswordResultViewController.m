//
//  PasswordResultViewController.m
//  jiamanyou
//
//  Created by jiamanu on 2018/11/16.
//  Copyright © 2018 jiamanyou. All rights reserved.
//

#import "PasswordResultViewController.h"
#import "ModifyPayPasswordThirdItem.h"

@interface PasswordResultViewController ()

@property (nonatomic,strong) NSString *stepString;

@end

@implementation PasswordResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.directionString;
    self.navigationItem.leftBarButtonItem = self.backBarButtonItem;
    
    self.jiaManager[@"ModifyPayPasswordThirdItem"] = @"ModifyPayPasswordThirdCell";

    [self setupPasswordResultTableView];
    
}

- (void) setupPasswordResultTableView {
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.jiaManager addSection:section];
    
//    ModifyPayPasswordThirdItem *resultItem = [[ModifyPayPasswordThirdItem alloc] init];
//    resultItem.selectionStyle = UITableViewCellSelectionStyleNone;
//    [section addItem:resultItem];
//    thirdItem.didSelectedBtn = ^(NSInteger tag) {
////        [weakself.navigationController popViewControllerAnimated:YES];
//    };
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
