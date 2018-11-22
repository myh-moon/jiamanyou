//
//  UserManageCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/8/6.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "BaseCell.h"
#import "UserManageItem.h"

@interface UserManageCell : BaseCell

@property (nonatomic,strong) UILabel *orangeLabel;
@property (nonatomic,strong) UILabel *titleLabel;

@property (nonatomic,strong,readwrite) UserManageItem *item;

@end
