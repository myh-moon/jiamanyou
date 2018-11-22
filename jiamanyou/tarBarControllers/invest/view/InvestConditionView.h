//
//  InvestConditionView.h
//  jiamanyou
//
//  Created by jiamanu on 2018/8/8.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InvestConditionView : UIView

@property (nonatomic,assign) BOOL didSetupConstraints;

@property (nonatomic,strong) UIButton *allButton;
@property (nonatomic,strong) UIButton *pledgeButton;  //质押车
@property (nonatomic,strong) UIButton *mortgageButton;  //抵押车

@property (nonatomic,strong) UILabel *orangeLabel;

@property (nonatomic,strong) NSLayoutConstraint *leftOrangeConstraints;

@property (nonatomic,strong) void (^didClickBtn)(NSInteger tag);

@end
