//
//  ProfitCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/8/3.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "BaseCell.h"
#import "ProfitItem.h"

@interface ProfitCell : BaseCell

@property (nonatomic,strong) UILabel *profitLabel;

@property (nonatomic,strong,readwrite) ProfitItem *item;

@end
