//
//  ProductDetailCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/11/19.
//  Copyright © 2018 jiamanyou. All rights reserved.
//

#import "BaseCell.h"
#import "ProductDetailItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface ProductDetailCell : BaseCell

@property (nonatomic,strong) UILabel *rateLabel;
@property (nonatomic,strong) UILabel *durationLabel;
@property (nonatomic,strong) UILabel *moneyLabel;

@property (nonatomic,strong) UILabel *activityLabel;

@property (nonatomic,strong,readwrite) ProductDetailItem *item;

@end

NS_ASSUME_NONNULL_END
