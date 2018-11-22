//
//  JiaViewController.h
//  jiamanyou
//
//  Created by jiamanu on 2018/8/1.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "NetworkViewController.h"

@interface JiaViewController : NetworkViewController <RETableViewManagerDelegate>

@property (nonatomic,strong) RETableViewManager *jiaManager;
@property (nonatomic,strong) UITableView *jiaTableView;

@end
