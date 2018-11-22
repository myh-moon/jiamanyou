//
//  CardNumberCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/8/7.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "BaseCell.h"
#import "CardNumberItem.h"

@interface CardNumberCell : BaseCell

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UITextField *contentTextField;

@property (nonatomic,strong,readwrite) CardNumberItem *item;

@end
