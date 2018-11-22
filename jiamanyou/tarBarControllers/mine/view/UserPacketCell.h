//
//  UserPacketCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/8/6.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "BaseCell.h"
#import "UserPacketItem.h"

@interface UserPacketCell : BaseCell

@property (nonatomic,strong) UIButton *packetButton;   //红包
@property (nonatomic,strong) UIButton *collectionButton;  //代收

@property (nonatomic,strong,readwrite) UserPacketItem *item;


@end
