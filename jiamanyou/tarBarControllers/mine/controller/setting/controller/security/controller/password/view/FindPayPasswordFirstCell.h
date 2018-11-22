//
//  FindPayPasswordFirstCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/11/15.
//  Copyright © 2018 jiamanyou. All rights reserved.
//

#import "BaseCell.h"
#import "FindPayPasswordFirstItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface FindPayPasswordFirstCell : BaseCell

@property (nonatomic,strong) UITextField *cardTextField;
@property (nonatomic,strong) UIButton *validateButton;

@property (nonatomic,strong,readwrite) FindPayPasswordFirstItem *item;

@end

NS_ASSUME_NONNULL_END
