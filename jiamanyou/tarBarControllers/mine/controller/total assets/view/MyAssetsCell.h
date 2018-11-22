//
//  MyAssetsCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/8/6.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "BaseCell.h"
#import "MyAssetsItem.h"

@interface MyAssetsCell : BaseCell

@property (nonatomic,strong) UILabel *assetsLabel;

@property (nonatomic,strong,readwrite) MyAssetsItem *item;

@end
