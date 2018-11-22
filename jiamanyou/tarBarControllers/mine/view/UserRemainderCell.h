//
//  UserRemainderCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/8/6.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "BaseCell.h"
#import "UserRemainderItem.h"

@interface UserRemainderCell : BaseCell

@property (nonatomic,strong) UILabel *remainderLabel;
@property (nonatomic,strong) UIButton *withdrawButton;
@property (nonatomic,strong) UIButton *rechargeButton;

@property (nonatomic,strong,readwrite) UserRemainderItem *item;

@end
