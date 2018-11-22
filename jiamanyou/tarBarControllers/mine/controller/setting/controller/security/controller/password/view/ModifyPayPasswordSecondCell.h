//
//  ModifyPayPasswordSecondCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/11/16.
//  Copyright © 2018 jiamanyou. All rights reserved.
//

#import "BaseCell.h"
#import "LYSecurityField.h"
#import "ModifyPayPasswordSecondItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface ModifyPayPasswordSecondCell : BaseCell 

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) LYSecurityField *passwordTextField;
@property (nonatomic,strong) UILabel *remindLabel;

@property (nonatomic,strong,readwrite) ModifyPayPasswordSecondItem *item;

@end

NS_ASSUME_NONNULL_END
