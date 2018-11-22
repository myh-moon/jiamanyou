//
//  RechargeCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/8/8.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "BaseCell.h"

#import "RechargeItem.h"

@interface RechargeCell : BaseCell

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UITextField *moneyTextField;
@property (nonatomic,strong) UILabel *unitLabel;

@property (nonatomic,strong,readwrite) RechargeItem *item;

@end
