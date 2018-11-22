//
//  ProductMoreMessagesPersonCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/11/15.
//  Copyright © 2018 jiamanyou. All rights reserved.
//

#import "BaseCell.h"
#import "ProductMoreMessagesPersonItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface ProductMoreMessagesPersonCell : BaseCell<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UICollectionView *personCollectionView;

@property (nonatomic,strong,readwrite) ProductMoreMessagesPersonItem *item;

@end

NS_ASSUME_NONNULL_END
