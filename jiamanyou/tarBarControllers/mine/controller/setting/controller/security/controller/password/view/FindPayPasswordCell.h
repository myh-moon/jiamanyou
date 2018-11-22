//
//  FindPayPasswordCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/8/8.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "BaseCell.h"
#import "FindPayPasswordItem.h"

@interface FindPayPasswordCell : BaseCell

@property (nonatomic,strong) UIImageView *firstImageView;
@property (nonatomic,strong) UIImageView *secondImageView;
@property (nonatomic,strong) UILabel *lineLabel;
@property (nonatomic,strong) UILabel *firstILabel;
@property (nonatomic,strong) UILabel *secondILabel;

@property (nonatomic,strong,readwrite) FindPayPasswordItem *item;


@end
