//
//  VolumeCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/8/2.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "BaseCell.h"
#import "VolumeItem.h"

@interface VolumeCell : BaseCell<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) UIButton *volumeButton;  //累计交易量


@property (nonatomic,strong) UIView *volumeBackView;
@property (nonatomic,strong) UIImageView *volumeImageView;
@property (nonatomic,strong) UICollectionView *volumeCollectionView;

@property (nonatomic,strong,readwrite) VolumeItem *item;

@end
