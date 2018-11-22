//
//  BaseViewController.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/1.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "BaseViewController.h"
#import "UIImage+Color.h"

@interface BaseViewController ()<UIGestureRecognizerDelegate>

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航条的字体颜色
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:JBlackColor,NSFontAttributeName:JFont7}];
    
    //去除系统效果
    //    self.navigationController.navigationBar.translucent = NO;
    
    //设置导航栏颜色
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:JWhiteColor] forBarMetrics:UIBarMetricsDefault];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //    if (@available(iOS 11.0, * )) {
    //        scrollview.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    //    }else{
    //        self.automaticallyAdjustsScrollViewInsets = NO;
    //    }
    
    //右滑返回
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    
    //自动布局
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
}

- (UIBarButtonItem *)backBarButtonItem {
    if (!_backBarButtonItem) {
        
        UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
        [backBtn setTitle:@"back" forState:0];
        [backBtn setTitleColor:JRedColor forState:0];
        backBtn.titleLabel.font = JFont4;
        [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        _backBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    }
    return _backBarButtonItem;
}

- (void) back {
    [self.navigationController popViewControllerAnimated:YES];
}

- (UIButton *)rightNavButton {
    if (!_rightNavButton) {
        _rightNavButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
        [_rightNavButton setTitleColor:JBlackColor1 forState:0];
        _rightNavButton.titleLabel.font = JFont4;
        [_rightNavButton addTarget:self action:@selector(rightNavAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightNavButton;
}

- (void)rightNavAction {
    
}

- (void)updateViewConstraints {
    if (!self.didSetupConstraints) {
        [self layoutConstraints];
        self.didSetupConstraints = YES;
    }
    [super updateViewConstraints];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
