//
//  DeadlineCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/8/2.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "BaseCell.h"
#import "DeadlineItem.h"

@interface DeadlineCell : BaseCell

@property (nonatomic,strong) UILabel *deadlineLabel;

@property (nonatomic,strong,readwrite) DeadlineItem *item;
@end
