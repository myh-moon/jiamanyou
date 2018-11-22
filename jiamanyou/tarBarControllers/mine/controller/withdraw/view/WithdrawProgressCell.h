//
//  WithdrawProgressCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/8/8.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "BaseCell.h"
#import "WithdrawProgressItem.h"

@interface WithdrawProgressCell : BaseCell

@property (nonatomic,strong) UILabel *bankNameLabel;
@property (nonatomic,strong) UILabel *progressLabel;

@property (nonatomic,strong,readwrite) WithdrawProgressItem *item;

@end
