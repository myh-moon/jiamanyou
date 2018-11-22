//
//  CommonItem.h
//  jiamanyou
//
//  Created by jiamanu on 2018/8/3.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "RETableViewItem.h"

@interface CommonItem : RETableViewItem

@property (nonatomic,assign) NSInteger sepeTag;  //0-无分割线。 1-左边15。 2-左右各15

@property (nonatomic,copy) NSString *leftString;
@property (nonatomic,copy) NSString *rightString;

@end
