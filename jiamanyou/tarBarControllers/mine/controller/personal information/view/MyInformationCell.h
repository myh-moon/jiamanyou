//
//  MyInformationCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/8/7.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "BaseCell.h"
#import "MyInformationItem.h"

@interface MyInformationCell : BaseCell

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *contentLabel;

@property (nonatomic,strong,readwrite) MyInformationItem *item;

@end
