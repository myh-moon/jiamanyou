//
//  ModifyLoginPasswordCodeCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/11/16.
//  Copyright © 2018 jiamanyou. All rights reserved.
//

#import "BaseCell.h"
#import "ModifyLoginPasswordCodeItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface ModifyLoginPasswordCodeCell : BaseCell

@property (nonatomic,strong) UITextField *codeTextField;
@property (nonatomic,strong) UIButton *getCodeButton;

@property (nonatomic,strong,readwrite) ModifyLoginPasswordCodeItem *item;

@end

NS_ASSUME_NONNULL_END
