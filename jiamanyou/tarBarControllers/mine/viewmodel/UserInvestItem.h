//
//  UserInvestItem.h
//  jiamanyou
//
//  Created by jiamanu on 2018/8/6.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "RETableViewItem.h"

@interface UserInvestItem : RETableViewItem

@property (nonatomic,copy) NSString *titleString;
@property (nonatomic,copy) NSString *actionString;
@property (nonatomic,assign) NSInteger seperateType;  // 分割线样式  //0-无分割线 1-左边。2-左右

@end
