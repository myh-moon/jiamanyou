//
//  UserInvestCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/8/6.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "BaseCell.h"
#import "UserInvestItem.h"

@interface UserInvestCell : BaseCell

@property (nonatomic,strong) UIButton *titleButton;
@property (nonatomic,strong) UIButton *actButton;

@property (nonatomic,strong,readwrite) UserInvestItem *item;

@end
