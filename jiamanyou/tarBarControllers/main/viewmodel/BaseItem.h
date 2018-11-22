//
//  BaseItem.h
//  jiamanyou
//
//  Created by jiamanu on 2018/8/2.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "RETableViewItem.h"

@interface BaseItem : RETableViewItem

@property (nonatomic,strong)  void (^didSelectedBtn)(NSInteger tag);
@property (nonatomic,strong)  void (^didEditing)(NSString *text);

@end
