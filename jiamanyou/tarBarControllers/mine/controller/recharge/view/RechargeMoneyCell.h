//
//  RechargeMoneyCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/8/8.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "BaseCell.h"
#import "RechargeMoneyItem.h"

@interface RechargeMoneyCell : BaseCell

@property (nonatomic,strong) UILabel *moneyLabel;

@property (nonatomic,strong,readwrite) RechargeMoneyItem *item;

@end
