//
//  CardRuleCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/8/7.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "BaseCell.h"
#import "CardRuleItem.h"

@interface CardRuleCell : BaseCell

@property (nonatomic,strong) UILabel *ruleLabel;
@property (nonatomic,strong,readwrite)  CardRuleItem *item;

@end
