//
//  ModifyPayPasswordFirstCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/11/16.
//  Copyright © 2018 jiamanyou. All rights reserved.
//

#import "BaseCell.h"
#import "LYSecurityField.h"
#import "ModifyPayPasswordFirstItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface ModifyPayPasswordFirstCell : BaseCell

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) LYSecurityField *passwordTextField;

@property (nonatomic,strong,readwrite) ModifyPayPasswordFirstItem *item;

@end

NS_ASSUME_NONNULL_END
