//
//  ProductMoreMessagesCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/11/15.
//  Copyright © 2018 jiamanyou. All rights reserved.
//

#import "BaseCell.h"
#import "ProductMoreMessagesItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface ProductMoreMessagesCell : BaseCell

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIButton *selectButton;

@property (nonatomic,strong,readwrite) ProductMoreMessagesItem *item;

@end

NS_ASSUME_NONNULL_END
