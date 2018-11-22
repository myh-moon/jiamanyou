//
//  ProductDetailViewController.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/2.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "ProductDetailViewController.h"
#import "ProductBuyViewController.h" //去投资
#import "ProductMoreMessagesViewController.h" //查看更多信息

#import "ProductInvestView.h"

#import "ProductDetailItem.h"
#import "DeadlineItem.h"
#import "NoteItem.h"
#import "ProcessItem.h"
#import "CycleItem.h"
#import "RuleItem.h"
#import "RecordItem.h"
#import "MoreMessageItem.h"

@interface ProductDetailViewController ()

@property (nonatomic,strong) RETableViewManager *detailManager;
@property (nonatomic,strong) UITableView *productDetailTableView;
@property (nonatomic,strong) ProductInvestView *investView;

@end

@implementation ProductDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"详情";
    self.navigationItem.leftBarButtonItem = self.backBarButtonItem;
    
    [self.view addSubview:self.productDetailTableView];
    [self.view addSubview:self.investView];
    
    [self.view setNeedsUpdateConstraints];
    
    
    self.detailManager  = [[RETableViewManager alloc] initWithTableView:self.productDetailTableView];
    self.detailManager[@"ProductDetailItem"] = @"ProductDetailCell";
    self.detailManager[@"DeadlineItem"] = @"DeadlineCell";
    self.detailManager[@"NoteItem"] = @"NoteCell";
    self.detailManager[@"ProcessItem"] = @"ProcessCell";
    self.detailManager[@"CycleItem"] = @"CycleCell";
    self.detailManager[@"RuleItem"] = @"RuleCell";
    self.detailManager[@"RecordItem"] = @"RecordCell";
    self.detailManager[@"MoreMessageItem"] = @"MoreMessageCell";
    
    [self setupProductDetailTableView];
}

- (void)updateViewConstraints {
    if (!self.didSetupConstraints) {
        
        [self.productDetailTableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 50, 0) excludingEdge:ALEdgeTop];
        [self.productDetailTableView autoPinToTopLayoutGuideOfViewController:self withInset:0];
        
        [self.investView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
        [self.investView autoSetDimension:ALDimensionHeight toSize:50];
        
        self.didSetupConstraints = YES;
    }
    [super updateViewConstraints];
}

- (UITableView *)productDetailTableView {
    if (!_productDetailTableView) {
        _productDetailTableView = [UITableView newAutoLayoutView];
        _productDetailTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, JWindowWidth, JSmallSpacing)];
        _productDetailTableView.showsVerticalScrollIndicator = NO;
    }
    return _productDetailTableView;
}

- (UIView *)investView {
    if (!_investView) {
        _investView = [ProductInvestView newAutoLayoutView];
        _investView.backgroundColor = JWhiteColor;
        
        JWeakSelf;
        [_investView setDidSelectedAction:^(NSInteger tag) {
            if (tag == 111) {//计算收益
                
            }else{//投资
                ProductBuyViewController *productBuyVC = [[ProductBuyViewController alloc] init];
                [weakself.navigationController pushViewController:productBuyVC animated:YES];
            }
        }];
    }
    return _investView;
}

- (void) setupProductDetailTableView {
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.detailManager addSection:section];
    
    //详情
    ProductDetailItem *item0 = [[ProductDetailItem alloc] init];
    item0.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:item0];
    
    //截止日期
    DeadlineItem *deadlineItem = [[DeadlineItem alloc] init];
    deadlineItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:deadlineItem];
    
    //产品说明
    NoteItem *noteItem  = [[NoteItem alloc] init];
    noteItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:noteItem];
    
    //进度
    ProcessItem *processItem = [[ProcessItem alloc] init];
    processItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:processItem];
    
    //还款流程
    CycleItem *cycleItem = [[CycleItem alloc] init];
    cycleItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:cycleItem];
    
    //收益规则
    RuleItem *profitItem = [[RuleItem alloc] init];
    profitItem.cellHeight = 75;
    profitItem.titleString = @"收益规则";
    profitItem.contentString = @"现在买入，第二个自然日开始计算收益。";
    profitItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:profitItem];
    
    //转出规则
    RuleItem *withdrawItem = [[RuleItem alloc] init];
    withdrawItem.cellHeight = 75;
    withdrawItem.titleString = @"转出规则";
    withdrawItem.contentString = @"需手动转出，转出后资金将在3个工作日内到账。";
    withdrawItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:withdrawItem];
    
    //基本情况
    RuleItem *baseItem = [[RuleItem alloc] init];
    baseItem.cellHeight = 95;
    baseItem.titleString = @"基本情况";
    baseItem.contentString = @"夏先生是江苏江阴人，在伽满优平台汽车抵押借款，用于扩大经营，借款期限97天。";
    baseItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:baseItem];
    
    //风控审核
    RuleItem *riskItem = [[RuleItem alloc] init];
    riskItem.cellHeight = 95;
    riskItem.titleString = @"风控审核";
    riskItem.contentString = @"车辆评估真实可信，资料信息提供齐全，登记手续正规有效，经综合评定予以批准。";
    riskItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:riskItem];
    
    //投资记录
    RecordItem *recordItem = [[RecordItem alloc] init];
    recordItem.selectionStyle = UITableViewCellSelectionStyleNone;
    recordItem.cellHeight = 180;
    recordItem.colorType = @"0";
    [section addItem:recordItem];
        
    //查看更多信息
    MoreMessageItem *moreItem = [[MoreMessageItem alloc] init];
    moreItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:moreItem];
    JWeakSelf;
    moreItem.selectionHandler = ^(id item) {
        ProductMoreMessagesViewController *productMoreMessagesVC = [[ProductMoreMessagesViewController alloc] init];
        [weakself.navigationController pushViewController:productMoreMessagesVC animated:YES];
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
