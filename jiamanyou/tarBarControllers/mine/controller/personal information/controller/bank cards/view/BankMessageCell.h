//
//  BankMessageCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/8/7.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "BaseCell.h"
#import "BankMessageItem.h"

@interface BankMessageCell : BaseCell

@property (nonatomic,strong) UIImageView *bankBackImageView;
@property (nonatomic,strong) UIButton *bankNameButton;
@property (nonatomic,strong) UILabel *bankNumberLabel;

@property (nonatomic,strong,readwrite) BankMessageItem *item;

@end
