//
//  WithdrawResultCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/8/8.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "BaseCell.h"

#import "WithdrawResultItem.h"

@interface WithdrawResultCell : BaseCell

@property (nonatomic,strong) UIImageView *signImageView;
@property (nonatomic,strong) UILabel *ruleLabel;
@property (nonatomic,strong) UIButton *finishButton;

@property (nonatomic,strong,readwrite) WithdrawResultItem *item;

@end
