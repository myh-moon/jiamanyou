//
//  PacketViewController.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/6.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "PacketViewController.h"

#import "PacketConditionView.h"

#import "PacketItem.h"
#import "SeperateItem.h"

@interface PacketViewController ()

@property (nonatomic,strong) RETableViewManager *packetManager;
@property (nonatomic,strong) UITableView *packetTableView;
@property (nonatomic,strong) PacketConditionView *packetConditionView;

@end

@implementation PacketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我的红包";
    
    [self.view addSubview:self.packetConditionView];
    [self.view addSubview:self.packetTableView];
    
    [self.view setNeedsUpdateConstraints];
    
    self.packetManager = [[RETableViewManager alloc] initWithTableView:self.packetTableView];
    
    self.packetManager[@"PacketItem"] = @"PacketCell";
    self.packetManager[@"SeperateItem"] = @"SeperateCell";
    
    [self setupPacketTableView];
}

- (PacketConditionView *)packetConditionView {
    if (!_packetConditionView) {
        _packetConditionView = [PacketConditionView newAutoLayoutView];
    }
    return _packetConditionView;
}

- (UITableView *)packetTableView {
    if (!_packetTableView) {
        _packetTableView = [UITableView newAutoLayoutView];
        _packetTableView.backgroundColor = JBackGroundColor;
    }
    return _packetTableView;
}


- (void)updateViewConstraints {
    if (!self.didSetupConstraints) {
        
        [self.packetConditionView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeBottom];
        [self.packetConditionView autoSetDimension:ALDimensionHeight toSize:55];
        
        [self.packetTableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
        [self.packetTableView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.packetConditionView];
        
        self.didSetupConstraints = YES;
    }
    [super updateViewConstraints];
}

- (void) setupPacketTableView {
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.packetManager addSection:section];
    
    SeperateItem *seperateItem = [[SeperateItem alloc] init];
    seperateItem.selectionStyle = UITableViewCellSelectionStyleNone;
    seperateItem.cellHeight = JBigSpacing;
    [section addItem:seperateItem];
    
    for (NSInteger i=0; i<10; i++) {
        PacketItem *packetItem = [[PacketItem alloc] init];
        packetItem.selectionStyle = UITableViewCellSelectionStyleNone;
        [section addItem:packetItem];
        
        SeperateItem *sepeItem = [[SeperateItem alloc] init];
        sepeItem.cellHeight = JMiddleSpacing;
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
