//
//  MyAssetsDistributionCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/7.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "MyAssetsDistributionCell.h"

#define space 7

@implementation MyAssetsDistributionCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 360;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = JSeparatorInset1;
    self.backgroundColor = JWhiteColor;
    
    [self.contentView addSubview:self.cicleView];
    
    [self.contentView addSubview:self.availableButton];
    [self.contentView addSubview:self.profitButton];
    [self.contentView addSubview:self.frozenButton];
    [self.contentView addSubview:self.principalButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.cicleView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:JMiddleSpacing];
    [self.cicleView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [self.cicleView autoSetDimensionsToSize:CGSizeMake(200, 200)];
    
    
    NSArray *views = @[self.availableButton,self.profitButton,self.frozenButton,self.principalButton];
    [views autoDistributeViewsAlongAxis:ALAxisVertical alignedTo:ALAttributeVertical withFixedSpacing:70 insetSpacing:YES];
    [[views firstObject] autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:JMiddleSpacing];
}

- (UIButton *)availableButton {
    if (!_availableButton) {
        _availableButton = [UIButton newAutoLayoutView];
//        _availableButton.backgroundColor = JRedColor;
    }
    return _availableButton;
}

- (UIButton *)profitButton {
    if (!_profitButton) {
        _profitButton = [UIButton newAutoLayoutView];
//        _profitButton.backgroundColor = JRedColor;
    }
    return _profitButton;
}

- (UIButton *)frozenButton {
    if (!_frozenButton) {
        _frozenButton = [UIButton newAutoLayoutView];
//        _frozenButton.backgroundColor = JRedColor;
    }
    return _frozenButton;
}

- (UIButton *)principalButton {
    if (!_principalButton) {
        _principalButton = [UIButton newAutoLayoutView];
//        _principalButton.backgroundColor = JRedColor;
    }
    return _principalButton;
}

- (XYPieChartView *)cicleView {
    if (!_cicleView) {
        _cicleView = [XYPieChartView newAutoLayoutView];
        
     NSMutableArray *pieChartArray = [NSMutableArray arrayWithObjects:@{@"title":@"餐饮", @"percent":@"33.2", @"amount":@"10234"}, @{@"title":@"购物", @"percent":@"26.8", @"amount":@"9820"} ,@{@"title":@"娱乐", @"percent":@"5.5", @"amount":@"1450"} ,@{@"title":@"零食", @"percent":@"35.5", @"amount":@"9700"}, nil];
        NSMutableArray *pieChartPercentArray = [NSMutableArray arrayWithObjects:@"33.2", @"26.8", @"5.5", @"35.5", nil];
        NSMutableArray *colorArray = [NSMutableArray arrayWithObjects:JRedColor,JOrangeColor,JGrayColor,JOrangeColor5,nil];

        CGRect pieChartFrame = CGRectMake(0, 0, 200, 200);
        
        // 初始化饼图
        _cicleView = [[XYPieChartView alloc] initWithFrame:pieChartFrame withPieChartTypeArray:pieChartArray withPercentArray:pieChartPercentArray withColorArray:colorArray];
        
//        _cicleView.delegate = self;
        
        // 当有一项数据的百分比小于你所校验的数值时，会将该项数值百分比移出饼图展示（校验数值从0~100）
        [_cicleView setCheckLessThanPercent:10];
        
        //刷新
        [_cicleView reloadChart];
        
        //设置圆心标题
        [_cicleView setAmountText:@"总资产"];
        
    }
    return _cicleView;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    NSMutableAttributedString *available = [NSString setAttributeOfFirstString:@"可用余额  " firstFont:JFont3 firstColor:JLightGrayColor5 secondString:@"123456.00" secondFont:JFont3 secondColor:JBlackColor1];
    [self.availableButton setAttributedTitle:available forState:0];
    
    NSMutableAttributedString *profit = [NSString setAttributeOfFirstString:@"待收收益  " firstFont:JFont3 firstColor:JLightGrayColor5 secondString:@"123456.00" secondFont:JFont3 secondColor:JBlackColor1];
    [self.profitButton setAttributedTitle:profit forState:0];
    
    NSMutableAttributedString *frozon = [NSString setAttributeOfFirstString:@"冻结总额  " firstFont:JFont3 firstColor:JLightGrayColor5 secondString:@"123456.00" secondFont:JFont3 secondColor:JBlackColor1];
    [self.frozenButton setAttributedTitle:frozon forState:0];
    
    NSMutableAttributedString *principal = [NSString setAttributeOfFirstString:@"待收本金  " firstFont:JFont3 firstColor:JLightGrayColor5 secondString:@"123456.00" secondFont:JFont3 secondColor:JBlackColor1];
    [self.principalButton setAttributedTitle:principal forState:0];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
