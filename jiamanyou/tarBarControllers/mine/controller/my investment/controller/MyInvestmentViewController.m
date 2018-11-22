//
//  MyInvestmentViewController.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/6.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "MyInvestmentViewController.h"

#import "MyInvestmenConditionView.h"

#import "MyInvestmentItem.h"
#import "SeperateItem.h"

@interface MyInvestmentViewController ()

@property (nonatomic,strong) RETableViewManager *myInvestmentManager;
@property (nonatomic,strong) MyInvestmenConditionView *investConditionView;
@property (nonatomic,strong) UITableView *myInvestmentTableView;

@end

@implementation MyInvestmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我的投资";
    self.navigationItem.leftBarButtonItem = self.backBarButtonItem;
    
    [self.view addSubview:self.investConditionView];
    [self.view addSubview:self.myInvestmentTableView];
    
    [self.view setNeedsUpdateConstraints];
    
    self.myInvestmentManager = [[RETableViewManager alloc] initWithTableView:self.myInvestmentTableView];

    self.myInvestmentManager[@"MyInvestmentItem"] = @"MyInvestmentCell";
    self.myInvestmentManager[@"SeperateItem"] = @"SeperateCell";
    
    [self setupMyInvestmentTableView];
}

- (MyInvestmenConditionView *)investConditionView {
    if (!_investConditionView) {
        _investConditionView = [MyInvestmenConditionView newAutoLayoutView];
    }
    return _investConditionView;
}

- (UITableView *)myInvestmentTableView {
    if (!_myInvestmentTableView) {
        _myInvestmentTableView = [UITableView newAutoLayoutView];
        _myInvestmentTableView.backgroundColor = JBackGroundColor;
    }
    return _myInvestmentTableView;
}

- (void)updateViewConstraints {
    if (!self.didSetupConstraints) {
        
        [self.investConditionView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeBottom];
        [self.investConditionView autoSetDimension:ALDimensionHeight toSize:55];
        
        [self.myInvestmentTableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
        [self.myInvestmentTableView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.investConditionView];
        
        self.didSetupConstraints = YES;
    }
    [super updateViewConstraints];
}

- (void) setupMyInvestmentTableView {
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.myInvestmentManager addSection:section];
    
    SeperateItem *seperateItem = [[SeperateItem alloc] init];
    seperateItem.cellHeight = JMiddleSpacing;
    seperateItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:seperateItem];
    
    for (NSInteger i=0; i<10; i++) {
        MyInvestmentItem *myInvestmentItem = [[MyInvestmentItem alloc] init];
        myInvestmentItem.selectionStyle = UITableViewCellSelectionStyleNone;
        [section addItem:myInvestmentItem];
        
        SeperateItem *sepeItem = [[SeperateItem alloc] init];
        sepeItem.cellHeight = JSmallSpacing;
        sepeItem.selectionStyle = UITableViewCellSelectionStyleNone;
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
