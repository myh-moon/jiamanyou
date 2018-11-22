//
//  InvestMessageCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/8/8.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "BaseCell.h"
#import "InvestMessageItem.h"

@interface InvestMessageCell : BaseCell

@property (nonatomic,strong) UILabel *rateLabel;
@property (nonatomic,strong) UILabel *durationLabel;
@property (nonatomic,strong) UILabel *progressLabel;

@property (nonatomic,strong,readwrite) InvestMessageItem *item;

@end
