//
//  SettingElseCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/8/7.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "BaseCell.h"

#import "SettingElseItem.h"

@interface SettingElseCell : BaseCell

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIButton *typeButton;
@property (nonatomic,strong) UIButton *actButton;

@property (nonatomic,strong,readwrite) SettingElseItem *item;

@end
