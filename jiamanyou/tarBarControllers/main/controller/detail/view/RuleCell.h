//
//  RuleCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/8/3.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "BaseCell.h"
#import "RuleItem.h"

@interface RuleCell : BaseCell

@property (nonatomic,strong) UILabel *orangeLabel;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *contentLabel;

@property (nonatomic,strong,readwrite) RuleItem *item;

@end
