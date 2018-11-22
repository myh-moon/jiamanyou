//
//  ModifyLoginPasswordTextCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/11/16.
//  Copyright © 2018 jiamanyou. All rights reserved.
//

#import "BaseCell.h"
#import "ModifyLoginPasswordTextItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface ModifyLoginPasswordTextCell : BaseCell

@property (nonatomic,strong) UITextField *passwordTextField;

@property (nonatomic,strong,readwrite) ModifyLoginPasswordTextItem *item;

@end

NS_ASSUME_NONNULL_END
