//
//  HotCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/8/2.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "BaseCell.h"
#import "HotItem.h"

@interface HotCell : BaseCell

@property (nonatomic,strong) UILabel *codeLabel;
@property (nonatomic,strong) UIButton *processButton;
@property (nonatomic,strong) UILabel *lineLabel;
@property (nonatomic,strong) UILabel *rateLabel;
@property (nonatomic,strong) UILabel *durationLabel;
@property (nonatomic,strong) UILabel *moneyLabel;



//@property (nonatomic,strong) UILabel *rateLabel1;
//@property (nonatomic,strong) UILabel *durationLabel1;
//@property (nonatomic,strong) UILabel *moneyLabel1;

@property (nonatomic,strong,readwrite) HotItem *item;
@end
