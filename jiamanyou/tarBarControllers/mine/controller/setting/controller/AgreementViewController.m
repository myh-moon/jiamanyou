//
//  AgreementViewController.m
//  jiamanyou
//
//  Created by jiamanu on 2018/11/19.
//  Copyright © 2018 jiamanyou. All rights reserved.
//

#import "AgreementViewController.h"

@interface AgreementViewController ()

@property (nonatomic,strong) UIWebView *agreementWebView;

@end

@implementation AgreementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.agreeString;
    self.navigationItem.leftBarButtonItem = self.backBarButtonItem;
    
    [self.view addSubview:self.agreementWebView];
    
    [self.view setNeedsUpdateConstraints];
}

- (void)layoutConstraints {
    [self.agreementWebView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
}

- (UIWebView *)agreementWebView {
    if (!_agreementWebView) {
        _agreementWebView = [UIWebView newAutoLayoutView];
    }
    return _agreementWebView;
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
