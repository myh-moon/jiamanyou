//
//  MainViewController.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/1.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "MainViewController.h"
#import "ProductDetailViewController.h" //详情

#import "MainFeatureItem.h"
#import "VolumeItem.h"
#import "HotItem.h"
#import "SeperateItem.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"首页";

    self.jiaManager[@"MainFeatureItem"] = @"MainFeatureCell";
    self.jiaManager[@"VolumeItem"] = @"VolumeCell";
    self.jiaManager[@"HotItem"] = @"HotCell";
    self.jiaManager[@"SeperateItem"] = @"SeperateCell";
    
    [self setupMainTableView];
}

- (void) setupMainTableView {
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.jiaManager addSection:section];
    
    //banner
    RETableViewItem *item0 = [[RETableViewItem alloc] initWithTitle:@"banner"];
    item0.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:item0];
    
    //feature
    MainFeatureItem *item1 = [[MainFeatureItem alloc] init];
    item1.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:item1];
    
    //volume
    VolumeItem *item2 = [[VolumeItem alloc] init];
    item2.volumeString = @"54000万元";
    item2.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:item2];
    
    //list
    for (NSInteger i=0; i<10; i++) {
        HotItem *item3 = [[HotItem alloc] init];
        item3.selectionStyle = UITableViewCellSelectionStyleNone;
        [section addItem:item3];
        
        JWeakSelf;
        item3.selectionHandler = ^(id item) {
            ProductDetailViewController *productDetailVC = [[ProductDetailViewController alloc] init];
            productDetailVC.hidesBottomBarWhenPushed = YES;
            [weakself.navigationController pushViewController:productDetailVC animated:YES];
        };
    
        SeperateItem *sepeItem = [[SeperateItem alloc] init];
        sepeItem.selectionStyle = UITableViewCellSelectionStyleNone;
        sepeItem.cellHeight = JMiddleSpacing;
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
