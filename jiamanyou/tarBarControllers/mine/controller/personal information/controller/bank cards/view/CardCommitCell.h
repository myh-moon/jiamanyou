//
//  CardCommitCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/8/7.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "BaseCell.h"
#import "CardCommitItem.h"

@interface CardCommitCell : BaseCell

@property (nonatomic,strong) UIButton *commitButton;

@property (nonatomic,strong,readwrite) CardCommitItem *item;

@end
