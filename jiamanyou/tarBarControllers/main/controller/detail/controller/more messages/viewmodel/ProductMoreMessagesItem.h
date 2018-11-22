//
//  ProductMoreMessagesItem.h
//  jiamanyou
//
//  Created by jiamanu on 2018/11/15.
//  Copyright © 2018 jiamanyou. All rights reserved.
//

#import "BaseItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface ProductMoreMessagesItem : BaseItem

@property (nonatomic,assign) BOOL selected; //选中状态
@property (nonatomic,copy) NSString *titleString; 

@end

NS_ASSUME_NONNULL_END
