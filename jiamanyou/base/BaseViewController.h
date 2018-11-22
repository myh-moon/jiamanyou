//
//  BaseViewController.h
//  jiamanyou
//
//  Created by jiamanu on 2018/8/1.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

@property (nonatomic,assign) BOOL didSetupConstraints;

@property (nonatomic,strong) UIBarButtonItem *backBarButtonItem;
@property (nonatomic,strong) UIButton *rightNavButton;

- (void) back;

- (void) rightNavAction;

- (void) layoutConstraints;

@end
