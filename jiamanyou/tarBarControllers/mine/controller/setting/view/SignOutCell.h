//
//  SignOutCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/8/7.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "BaseCell.h"
#import "SignOutItem.h"

@interface SignOutCell : BaseCell

@property (nonatomic,strong) UIButton *signOutButton;

@property (nonatomic,strong,readwrite) SignOutItem *item;

@end
