//
//  ProcessCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/8/2.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "BaseCell.h"
#import "ProcessItem.h"

@interface ProcessCell : BaseCell

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *progressLabel;
@property (nonatomic,strong) UIProgressView *detailProgressView;

@property (nonatomic,strong,readwrite) ProcessItem *item;

@end
