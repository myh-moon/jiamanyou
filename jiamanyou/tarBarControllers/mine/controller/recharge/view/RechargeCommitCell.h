//
//  RechargeCommitCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/8/8.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "BaseCell.h"
#import "RechargeCommitItem.h"

@interface RechargeCommitCell : BaseCell

@property (nonatomic,strong) UIButton *commitButton;

@property (nonatomic,strong,readwrite) RechargeCommitItem *item;

@end
