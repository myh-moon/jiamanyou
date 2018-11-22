//
//  InvestCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/8/8.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "BaseCell.h"
#import "InvestItem.h"

@interface InvestCell : BaseCell

@property (nonatomic,strong) UIButton *codeButton;
@property (nonatomic,strong) UILabel *quotaLabel;

@property (nonatomic,strong,readwrite) InvestItem *item;

@end
