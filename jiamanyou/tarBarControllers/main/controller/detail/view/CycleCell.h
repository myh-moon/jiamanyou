//
//  CycleCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/8/2.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "BaseCell.h"
#import "CycleItem.h"

@interface CycleCell : BaseCell

@property (nonatomic,strong) UILabel *titleLabel;

//购买-开始计算收益 -按月付息，到期还本
@property (nonatomic,strong) UILabel *stepLabel1;
@property (nonatomic,strong) UILabel *stepLabel2;
@property (nonatomic,strong) UILabel *stepLabel3;

//圆点
@property (nonatomic,strong) UILabel *point1;
@property (nonatomic,strong) UILabel *point2;
@property (nonatomic,strong) UILabel *point3;

//横线
@property (nonatomic,strong) UILabel *lineLabel1;
@property (nonatomic,strong) UILabel *lineLabel2;
@property (nonatomic,strong) UILabel *lineLabel3;

//第一天 - 第二天 - 最后一天
@property (nonatomic,strong) UILabel *firstLabel;
@property (nonatomic,strong) UILabel *secondLabel;
@property (nonatomic,strong) UILabel *thirdLabel;

@property (nonatomic,strong,readwrite) CycleItem *item;

@end
