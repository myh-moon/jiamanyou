//
//  RechargeRuleCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/8/8.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "BaseCell.h"
#import "RechargeRuleItem.h"

@interface RechargeRuleCell : BaseCell

@property (nonatomic,strong) UILabel *ruleLabel;
@property (nonatomic,strong,readwrite) RechargeRuleItem *item;

@end
