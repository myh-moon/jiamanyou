//
//  BuyCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/8/3.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "BaseCell.h"
#import "BuyItem.h"

@interface BuyCell : BaseCell

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UITextField *contentTextField;
@property (nonatomic,strong) UILabel *unitLabel;

@property (nonatomic,strong,readwrite) BuyItem *item;
@end
