//
//  InvestViewController.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/2.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "InvestViewController.h"
#import "ProductDetailViewController.h"

#import "InvestConditionView.h"

#import "InvestItem.h"
#import "InvestMessageItem.h"
#import "SeperateItem.h"

@interface InvestViewController ()

@property (nonatomic,strong) RETableViewManager *investManager;

@property (nonatomic,strong) InvestConditionView *investConditionView;
@property (nonatomic,strong) UITableView *investTableView;

@end

@implementation InvestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"投资";
    self.view.backgroundColor = JBackGroundColor;
    
    [self.view addSubview:self.investConditionView];
    [self.view addSubview:self.investTableView];
    
    [self.view setNeedsUpdateConstraints];
    
    self.investManager = [[RETableViewManager alloc] initWithTableView:self.investTableView];

    self.investManager[@"InvestItem"] = @"InvestCell";
    self.investManager[@"InvestMessageItem"] = @"InvestMessageCell";
    self.investManager[@"SeperateItem"] = @"SeperateCell";

    [self setupInvestListTableView];
}

- (InvestConditionView *)investConditionView {
    if (!_investConditionView) {
        _investConditionView = [InvestConditionView newAutoLayoutView];
    }
    return _investConditionView;
}

- (UITableView *)investTableView {
    if (!_investTableView) {
        _investTableView = [UITableView newAutoLayoutView];
        _investTableView.tableFooterView = [UIView new];
    }
    return _investTableView;
}

- (void)updateViewConstraints {
    if (!self.didSetupConstraints) {
        
        [self.investConditionView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeBottom];
        [self.investConditionView autoSetDimension:ALDimensionHeight toSize:45];
        
        [self.investTableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
        [self.investTableView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.investConditionView withOffset:JMiddleSpacing];
        
        self.didSetupConstraints = YES;
    }
    [super updateViewConstraints];
}

- (void) setupInvestListTableView {
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.investManager addSection:section];
    
//    SeperateItem *seperateItem1 = [[SeperateItem alloc] init];
//    seperateItem1.selectionStyle = UITableViewCellSelectionStyleNone;
//    seperateItem1.cellHeight = JMiddleSpacing;
//    [section addItem:seperateItem1];
//
    for (NSInteger i=0; i<10; i++) {
        JWeakSelf;
        
        InvestItem *investItem = [[InvestItem alloc] init];
        investItem.selectionStyle = UITableViewCellSelectionStyleNone;
        [section addItem:investItem];
        investItem.selectionHandler = ^(id item) {
            ProductDetailViewController *productDetailVC = [[ProductDetailViewController alloc] init];
            productDetailVC.hidesBottomBarWhenPushed = YES;
            [weakself.navigationController pushViewController:productDetailVC animated:YES];
        };
        
        InvestMessageItem *messageItem = [[InvestMessageItem alloc] init];
        messageItem.selectionStyle = UITableViewCellSelectionStyleNone;
        [section addItem:messageItem];
        messageItem.selectionHandler = ^(id item) {
            ProductDetailViewController *productDetailVC = [[ProductDetailViewController alloc] init];
            productDetailVC.hidesBottomBarWhenPushed = YES;
            [weakself.navigationController pushViewController:productDetailVC animated:YES];
        };
        
        SeperateItem *seperateItem2 = [[SeperateItem alloc] init];
        seperateItem2.selectionStyle = UITableViewCellSelectionStyleNone;
        seperateItem2.cellHeight = JMiddleSpacing;
        [section addItem:seperateItem2];
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
