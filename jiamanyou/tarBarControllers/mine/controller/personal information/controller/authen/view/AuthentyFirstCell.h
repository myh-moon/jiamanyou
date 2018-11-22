//
//  AuthentyFirstCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/11/19.
//  Copyright © 2018 jiamanyou. All rights reserved.
//

#import "BaseCell.h"
#import "AuthentyFirstItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface AuthentyFirstCell : BaseCell

//@property (nonatomic,strong) 

@property (nonatomic,strong,readwrite) AuthentyFirstItem *item;

@end

NS_ASSUME_NONNULL_END
