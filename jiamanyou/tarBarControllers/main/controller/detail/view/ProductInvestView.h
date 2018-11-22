//
//  ProductInvestView.h
//  jiamanyou
//
//  Created by jiamanu on 2018/8/3.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductInvestView : UIView

@property (nonatomic,assign) BOOL didSetupConstraints;

@property (nonatomic,strong) UIButton *calculateButton;  //计算按钮
@property (nonatomic,strong) UIButton *investButton;  //投资按钮

@property (nonatomic,strong) void (^didSelectedAction)(NSInteger tag);

@end
