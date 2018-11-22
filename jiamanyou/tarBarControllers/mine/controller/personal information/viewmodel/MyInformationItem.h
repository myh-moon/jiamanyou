//
//  MyInformationItem.h
//  jiamanyou
//
//  Created by jiamanu on 2018/8/7.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "RETableViewItem.h"

@interface MyInformationItem : RETableViewItem

@property (nonatomic,copy) NSString *titleString;
@property (nonatomic,copy) NSString *contentString;
@property (nonatomic,assign) NSInteger seperateType;

@end
