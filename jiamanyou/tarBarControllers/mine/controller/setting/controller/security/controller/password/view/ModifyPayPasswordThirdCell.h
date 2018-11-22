//
//  ModifyPayPasswordThirdCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/11/16.
//  Copyright © 2018 jiamanyou. All rights reserved.
//

#import "BaseCell.h"
#import "ModifyPayPasswordThirdItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface ModifyPayPasswordThirdCell : BaseCell

@property (nonatomic,strong) UIImageView *successImageView;
@property (nonatomic,strong) UILabel *remindLabel;
@property (nonatomic,strong) UIButton *successButton;

@property (nonatomic,strong,readwrite) ModifyPayPasswordThirdItem *item;

@end

NS_ASSUME_NONNULL_END
