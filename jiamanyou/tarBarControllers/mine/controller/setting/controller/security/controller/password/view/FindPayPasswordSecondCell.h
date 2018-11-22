//
//  FindPayPasswordSecondCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/11/15.
//  Copyright © 2018 jiamanyou. All rights reserved.
//

#import "BaseCell.h"
#import "FindPayPasswordSecondItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface FindPayPasswordSecondCell : BaseCell

@property (nonatomic,strong) UITextField *phoneTextField;
@property (nonatomic,strong) UIButton *getCodeButton;
@property (nonatomic,strong) UIButton *validateButton;

@property (nonatomic,strong,readwrite) FindPayPasswordSecondItem *item;

@end

NS_ASSUME_NONNULL_END
