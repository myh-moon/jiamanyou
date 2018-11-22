//
//  MyInvestmentCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/8/6.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "BaseCell.h"
#import "MyInvestmentItem.h"

@interface MyInvestmentCell : BaseCell

@property (nonatomic,strong) UILabel *statusLabel;
@property (nonatomic,strong) UILabel *dateLabel;
@property (nonatomic,strong) UILabel *periodsLabel;
@property (nonatomic,strong) UILabel *lineLabel;
@property (nonatomic,strong) UILabel *rateLabel;
@property (nonatomic,strong) UILabel *moneyLabel;

@property (nonatomic,strong,readwrite) MyInvestmentItem *item;

@end
