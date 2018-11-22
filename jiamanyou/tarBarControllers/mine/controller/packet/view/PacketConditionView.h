//
//  PacketConditionView.h
//  jiamanyou
//
//  Created by jiamanu on 2018/8/6.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PacketConditionView : UIView

@property (nonatomic,assign) BOOL didSetupConstraints;

@property (nonatomic,strong) UIButton *validButton;
@property (nonatomic,strong) UIButton *invalidButton;
@property (nonatomic,strong) UILabel *orangeLabel;
@property (nonatomic,strong) UILabel *lineLabel;

@property (nonatomic,strong) NSLayoutConstraint *leftOrangeConstraints;

@property (nonatomic,strong) void (^didSelectedBtn)(NSInteger tag);

@end
