//
//  BankMessageAddCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/11/16.
//  Copyright © 2018 jiamanyou. All rights reserved.
//

#import "BaseCell.h"
#import "BankMessageAddItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface BankMessageAddCell : BaseCell

@property (nonatomic,strong) UIButton *addButton;

@property (nonatomic,strong,readwrite) BankMessageAddItem *item;


@end

NS_ASSUME_NONNULL_END
