//
//  PacketCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/8/6.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "BaseCell.h"
#import "PacketItem.h"

@interface PacketCell : BaseCell

@property (nonatomic,strong) UIImageView *packetBackImageView;
@property (nonatomic,strong) UILabel *sourceLabel;
@property (nonatomic,strong) UILabel *moneyLabel;
@property (nonatomic,strong) UILabel *dayLabel;
@property (nonatomic,strong) UILabel *deadlineLabel;

@property (nonatomic,strong) PacketItem *item;

@end
