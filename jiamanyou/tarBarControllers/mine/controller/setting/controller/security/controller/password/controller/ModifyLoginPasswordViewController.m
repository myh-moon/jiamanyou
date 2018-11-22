//
//  ModifyLoginPasswordViewController.m
//  jiamanyou
//
//  Created by jiamanu on 2018/11/16.
//  Copyright © 2018 jiamanyou. All rights reserved.
//

#import "ModifyLoginPasswordViewController.h"
#import "UIViewController+DismissKeyboard.h"

#import "ModifyLoginPasswordItem.h"
#import "ModifyLoginPasswordCodeItem.h"
#import "ModifyLoginPasswordTextItem.h"
#import "RechargeCommitItem.h"
#import "ModifyPayPasswordThirdItem.h"

@interface ModifyLoginPasswordViewController ()

@property (nonatomic,strong) NSMutableDictionary *loginPasswordDic;
@property (nonatomic,strong) NSTimer *loginTimer;
@property (nonatomic,strong) NSString *timeString;
@property (nonatomic,strong) NSString *stepString;

@end

@implementation ModifyLoginPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"修改密码";
    self.navigationItem.leftBarButtonItem = self.backBarButtonItem;
    
    self.timeString = @"获取验证码";
    
    self.stepString = @"1";
    
    self.jiaManager[@"ModifyLoginPasswordItem"] = @"ModifyLoginPasswordCell";
    self.jiaManager[@"ModifyLoginPasswordCodeItem"] = @"ModifyLoginPasswordCodeCell";
    self.jiaManager[@"ModifyLoginPasswordTextItem"] = @"ModifyLoginPasswordTextCell";
    self.jiaManager[@"RechargeCommitItem"] = @"RechargeCommitCell";
    self.jiaManager[@"ModifyPayPasswordThirdItem"] = @"ModifyPayPasswordThirdCell";

    
    [self setupModifyPayPasswordTableView];
    
    [self setupForDismissKeyboard];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [_loginTimer invalidate];
    _loginTimer = nil;
}

#pragma mark - init
- (NSMutableDictionary *)loginPasswordDic {
    if (!_loginPasswordDic) {
        _loginPasswordDic = [NSMutableDictionary dictionary];
    }
    return _loginPasswordDic;
}

#pragma mark - method
- (void) setupModifyPayPasswordTableView {
    [self.jiaManager removeAllSections];
    
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.jiaManager addSection:section];
    
    JWeakSelf;
    if ([self.stepString isEqualToString:@"1"]) {
        //显示手机号
        ModifyLoginPasswordItem *phoneItem = [[ModifyLoginPasswordItem alloc] init];
        phoneItem.selectionStyle = UITableViewCellSelectionStyleNone;
        [section addItem:phoneItem];
        
        //获取验证码
        ModifyLoginPasswordCodeItem *codeItem = [[ModifyLoginPasswordCodeItem alloc] init];
        codeItem.selectionStyle = UITableViewCellSelectionStyleNone;
        codeItem.timeString = self.timeString;
        [section addItem:codeItem];
        codeItem.didSelectedBtn = ^(NSInteger tag) {
            [weakself getCodeOfModifyLoginPassword];
        };
        
        codeItem.didEditing = ^(NSString *text) {
            [weakself.loginPasswordDic setValue:text forKey:@"code"];
        };
        
        //监控倒计时
        RACSignal *loginSignal = [RACSignal combineLatest:@[RACObserve(self, timeString)] reduce:^id(NSString *time){
            codeItem.timeString = time;
            return @"12";
        }];
        [loginSignal subscribeNext:^(id x) {
            
        }];
        
        
        //    /输入密码
        ModifyLoginPasswordTextItem *firstItem = [[ModifyLoginPasswordTextItem alloc] init];
        firstItem.placeHolderString = @"输入新密码(不少于6位数)";
        firstItem.selectionStyle = UITableViewCellSelectionStyleNone;
        [section addItem:firstItem];
        firstItem.didEditing = ^(NSString *text) {
            [weakself.loginPasswordDic setValue:text forKey:@""];
        };
        
        // 再次输入密码
        ModifyLoginPasswordTextItem *twiceItem = [[ModifyLoginPasswordTextItem alloc] init];
        twiceItem.placeHolderString = @"再次输入新密码";
        twiceItem.selectionStyle = UITableViewCellSelectionStyleNone;
        [section addItem:twiceItem];
        twiceItem.didEditing = ^(NSString *text) {
            [weakself.loginPasswordDic setValue:text forKey:@""];
        };
        
        //提交
        RechargeCommitItem *commitItem = [[RechargeCommitItem alloc] init];
        commitItem.selectionStyle = UITableViewCellSelectionStyleNone;
        commitItem.commitString = @"确认修改";
        [section addItem:commitItem];
        commitItem.didSelectedBtn = ^(NSInteger tag) {
            [weakself showHint:@"确认修改"];
            [weakself confirmToModifyLoginPassword];
        };
        
    }else{
        ModifyPayPasswordThirdItem *thirdItem = [[ModifyPayPasswordThirdItem alloc] init];
        thirdItem.selectionStyle = UITableViewCellSelectionStyleNone;
        [section addItem:thirdItem];
        thirdItem.didSelectedBtn = ^(NSInteger tag) {
            [weakself.navigationController popViewControllerAnimated:YES];
        };
    }
}

//获取验证码
- (void) getCodeOfModifyLoginPassword {
    
    _loginTimer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(startToCountDownOfModifyLoginPassword) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_loginTimer forMode:NSRunLoopCommonModes];
    
    return;
    
    NSString *codeString = @"";
    
    JWeakSelf;
    [self requestDataPostWithString:codeString params:self.loginPasswordDic successBlock:^(id responseObject) {
        
    } andFailBlock:^(NSError *error) {
        
    }];
}

//倒计时
- (void) startToCountDownOfModifyLoginPassword {
    NSInteger value;
    if ([self.timeString containsString:@"验证码"]) {
        value = 5;
    }else{
        value = [self.timeString integerValue];
    }
    
    value--;
    if (value > 0) {
        self.timeString = [NSString stringWithFormat:@"%d",value];
    }else{
        self.timeString = @"获取验证码";
        [_loginTimer invalidate];
        _loginTimer = nil;
    }
}

//确认修改
- (void) confirmToModifyLoginPassword {
    
    [_loginTimer invalidate];
    _loginTimer = nil;
    
    self.stepString = @"2";
    [self setupModifyPayPasswordTableView];
    [self.jiaTableView reloadData];
    
    return;
    NSString *sss = @"";
    
    JWeakSelf;
    [self requestDataPostWithString:sss params:self.loginPasswordDic successBlock:^(id responseObject) {
        
    } andFailBlock:^(NSError *error) {
        
    }];
}

@end
