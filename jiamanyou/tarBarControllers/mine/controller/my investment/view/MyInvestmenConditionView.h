//
//  MyInvestmenConditionView.h
//  jiamanyou
//
//  Created by jiamanu on 2018/8/6.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyInvestmenConditionView : UIView

@property (nonatomic,assign) BOOL didSetupConstraonts;

@property (nonatomic,strong) UIButton *allButton;  //全部
@property (nonatomic,strong) UIButton *investingButton;  //投资中
@property (nonatomic,strong) UIButton *completedButton;  //已回款
@property (nonatomic,strong) UIButton *backingButton; //回款中

@property (nonatomic,strong) UILabel *orangeLabel;
@property (nonatomic,strong) NSLayoutConstraint *leftOrangeConstraints;
@property (nonatomic,strong) NSLayoutConstraint *widthOrangeConstraints;


@property (nonatomic,strong) void (^didSelectedBtn)(NSInteger tag);

@end
