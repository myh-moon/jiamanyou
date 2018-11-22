//
//  WithdrawMoneyCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/8/8.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "BaseCell.h"
#import "WithdrawMoneyItem.h"

@interface WithdrawMoneyCell : BaseCell

@property (nonatomic,strong) UILabel *moneyLabel;
@property (nonatomic,strong) UIButton *withdrawButton;

@property (nonatomic,strong,readwrite) WithdrawMoneyItem *item;

@end
