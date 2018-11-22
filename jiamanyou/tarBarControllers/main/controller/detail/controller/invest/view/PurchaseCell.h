//
//  PurchaseCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/8/3.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "BaseCell.h"
#import "PurchaseItem.h"

@interface PurchaseCell : BaseCell

@property (nonatomic,strong) UIButton *purchaseButton;
@property (nonatomic,strong) UIButton *agreementButton;

@property (nonatomic,strong,readwrite) PurchaseItem *item;

@end
