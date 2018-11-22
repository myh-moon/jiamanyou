//
//  MoreMessageCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/8/3.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "BaseCell.h"
#import "MoreMessageItem.h"

@interface MoreMessageCell : BaseCell

@property (nonatomic,strong) UIButton *moreButton;
@property (nonatomic,strong,readwrite) MoreMessageItem *item;

@end
