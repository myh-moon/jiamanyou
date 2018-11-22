//
//  ProductMoreMessagesAuthentyCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/11/15.
//  Copyright © 2018 jiamanyou. All rights reserved.
//

#import "BaseCell.h"
#import "ProductMoreMessagesAuthentyItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface ProductMoreMessagesAuthentyCell : BaseCell <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UICollectionView *authentyCollectionView;

@property (nonatomic,strong,readwrite) ProductMoreMessagesAuthentyItem *item;

@end

NS_ASSUME_NONNULL_END
