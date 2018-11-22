//
//  MyAssetsDistributionCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/8/7.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "BaseCell.h"
#import "XYPieChartView.h"
#import "MyAssetsDistributionItem.h"

@interface MyAssetsDistributionCell : BaseCell 

@property (nonatomic,strong) UIButton *availableButton;  //可用余额
@property (nonatomic,strong) UIButton  *profitButton;   //待收收益
@property (nonatomic,strong) UIButton *frozenButton;  //冻结本金
@property (nonatomic,strong) UIButton *principalButton;  //代收本金

@property (nonatomic,strong) XYPieChartView *cicleView;//分布图

@property (nonatomic,strong,readwrite) MyAssetsDistributionItem *item;

@end
