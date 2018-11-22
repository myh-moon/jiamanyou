//
//  ModifyNickNameCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/11/19.
//  Copyright © 2018 jiamanyou. All rights reserved.
//

#import "BaseCell.h"
#import "ModifyNickNameItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface ModifyNickNameCell : BaseCell

@property (nonatomic,strong) UIView *borderView;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UITextField *nickTextField;
@property (nonatomic,strong) UILabel *remindLabel;

@property (nonatomic,strong,readwrite) ModifyNickNameItem *item;

@end

NS_ASSUME_NONNULL_END
