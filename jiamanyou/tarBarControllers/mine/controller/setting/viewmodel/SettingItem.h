//
//  SettingItem.h
//  jiamanyou
//
//  Created by jiamanu on 2018/8/7.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "RETableViewItem.h"

@interface SettingItem : RETableViewItem

@property (nonatomic,assign) NSInteger seperateType;  //0-无，1-左右，
@property (nonatomic,copy) NSString *titleString;
@property (nonatomic,copy) NSString *actString;

@end
