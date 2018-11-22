//
//  RechargeLimitCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/8/8.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "BaseCell.h"
#import "RechargeLimitItem.h"

@interface RechargeLimitCell : BaseCell

@property (nonatomic,strong) UIButton *limitButton;

@property (nonatomic,strong,readwrite) RechargeLimitItem *item;

@end
