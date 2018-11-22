//
//  CardNameCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/8/7.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "BaseCell.h"
#import "CardNameItem.h"

@interface CardNameCell : BaseCell

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *contentLabel;

@property (nonatomic,strong,readwrite) CardNameItem *item;

@end
