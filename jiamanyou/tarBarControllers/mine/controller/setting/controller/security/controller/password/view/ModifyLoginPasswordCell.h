//
//  ModifyLoginPasswordCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/11/16.
//  Copyright © 2018 jiamanyou. All rights reserved.
//

#import "BaseCell.h"
#import "ModifyLoginPasswordItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface ModifyLoginPasswordCell : BaseCell

@property (nonatomic,strong) UILabel *titleLabel;

@property (nonatomic,strong,readwrite) ModifyLoginPasswordItem *item;

@end

NS_ASSUME_NONNULL_END
