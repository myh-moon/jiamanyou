//
//  RecordCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/8/3.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "BaseCell.h"
#import "RecordItem.h"

@interface RecordCell : BaseCell

//@property (nonatomic,strong) UILabel *orangeLabel;
//@property (nonatomic,strong) UILabel *titleLabel;

//@property (nonatomic,strong) UIView *recordCollectionView;
@property (nonatomic,strong) UILabel *investPersonLabel;
@property (nonatomic,strong) UILabel *investMoneyLabel;
@property (nonatomic,strong) UILabel *investTimeLabel;

@property (nonatomic,strong,readwrite) RecordItem *item;

@end
