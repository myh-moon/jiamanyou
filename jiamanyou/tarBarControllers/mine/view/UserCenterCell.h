//
//  UserCenterCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/8/3.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "BaseCell.h"
#import "UserCenterItem.h"

@interface UserCenterCell : BaseCell

@property (nonatomic,strong) UIButton *userHeadButton;
@property (nonatomic,strong) UIButton  *userNickButton;
@property (nonatomic,strong) UIButton *settingButton;
@property (nonatomic,strong) UIButton *assetsButton;
@property (nonatomic,strong) UIButton *dailyProfitButton;
@property (nonatomic,strong) UIButton *totalProfitButton;

@property (nonatomic,strong,readwrite) UserCenterItem *item;

@end
