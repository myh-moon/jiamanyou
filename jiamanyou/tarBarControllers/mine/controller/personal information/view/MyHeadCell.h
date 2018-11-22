//
//  MyHeadCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/8/7.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "BaseCell.h"
#import "MyHeadItem.h"

@interface MyHeadCell : BaseCell

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIButton *headButton;

@property (nonatomic,strong,readwrite) MyHeadItem *item;

@end
