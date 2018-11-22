//
//  CapitalCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/8/6.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "BaseCell.h"
#import "CapitalItem.h"

@interface CapitalCell : BaseCell

@property (nonatomic,strong) UILabel *typeLabel;
@property (nonatomic,strong) UILabel *moneyLabel;

@property (nonatomic,strong,readwrite) CapitalItem *item;

@end
