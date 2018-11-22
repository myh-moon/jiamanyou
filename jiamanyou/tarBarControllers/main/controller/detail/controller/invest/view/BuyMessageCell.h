//
//  BuyMessageCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/8/3.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "BaseCell.h"
#import "BuyMessageItem.h"

@interface BuyMessageCell : BaseCell

@property (nonatomic,strong) UILabel *codeLabel;
@property (nonatomic,strong) UILabel *rateLabel;
@property (nonatomic,strong) UILabel *surplusLabel;
@property (nonatomic,strong) UILabel *durationLabel;

@property (nonatomic,strong) UIProgressView *buyProgressView;
@property (nonatomic,strong) UILabel *progressLabel;

@property (nonatomic,strong) BuyMessageItem *item;

@end
