//
//  MyProfitCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/8/6.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "BaseCell.h"
#import "MyProfitItem.h"

@interface MyProfitCell : BaseCell

@property (nonatomic,strong) UILabel *principalLabel;  //本金
@property (nonatomic,strong) UILabel *profitLabel;  //对应的收益
@property (nonatomic,strong) UILabel *lineLabel;

@property (nonatomic,strong,readwrite) MyProfitItem *item;

@end
