//
//  CommonCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/8/3.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "BaseCell.h"
#import "CommonItem.h"

@interface CommonCell : BaseCell

@property (nonatomic,strong) UIButton *leftButton;
@property (nonatomic,strong) UIButton *rightButton;

@property (nonatomic,strong,readwrite) CommonItem *item;

@end
