//
//  RechargeCardCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/8/8.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "BaseCell.h"
#import "RechargeCardItem.h"

@interface RechargeCardCell : BaseCell

@property (nonatomic,strong) UIButton *cardMessageButton;
@property (nonatomic,strong) UIButton *actButton;

@property (nonatomic,strong,readwrite) RechargeCardItem *item;

@end
