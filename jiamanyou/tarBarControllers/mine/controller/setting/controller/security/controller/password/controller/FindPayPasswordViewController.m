//
//  FindPayPasswordViewController.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/8.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "FindPayPasswordViewController.h"
#import "FindPayPasswordItem.h"
#import "FindPayPasswordFirstItem.h"
#import "FindPayPasswordSecondItem.h"

@interface FindPayPasswordViewController ()

@property (nonatomic,strong) NSString *stepString;
@property (nonatomic,strong) NSMutableDictionary *findPasswordDic;
@property (nonatomic,strong) NSTimer *passwordTimer;
@property (nonatomic,strong) NSString *timeString;


@end

@implementation FindPayPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"找回支付密码";
    self.navigationItem.leftBarButtonItem = self.backBarButtonItem;
    
    self.stepString = @"1";
    self.timeString = @"获取";
    
    self.jiaManager[@"FindPayPasswordItem"] = @"FindPayPasswordCell";
    self.jiaManager[@"FindPayPasswordFirstItem"] = @"FindPayPasswordFirstCell";
    self.jiaManager[@"FindPayPasswordSecondItem"] = @"FindPayPasswordSecondCell";

    [self setupFindPayPasswordTableView];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [_passwordTimer invalidate];
    _passwordTimer = nil;
}

#pragma mark - init
- (NSMutableDictionary *)findPasswordDic {
    if (!_findPasswordDic) {
        _findPasswordDic = [NSMutableDictionary dictionary];
    }
    return _findPasswordDic;
}

#pragma mark - method
- (void) setupFindPayPasswordTableView {
    [self.jiaManager removeAllSections];
    
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.jiaManager addSection:section];
    
    FindPayPasswordItem *findPayPasswordItem = [[FindPayPasswordItem alloc] init];
    findPayPasswordItem.selectionStyle = UITableViewCellSelectionStyleNone;
    findPayPasswordItem.stepString = self.stepString;
    [section addItem:findPayPasswordItem];
    
    JWeakSelf;
    if ([self.stepString isEqualToString:@"1"]) {
        FindPayPasswordFirstItem *firstItem = [[FindPayPasswordFirstItem alloc] init];
        firstItem.selectionStyle = UITableViewCellSelectionStyleNone;
        [section addItem:firstItem];
        firstItem.didEditing = ^(NSString *text) {
            [weakself.findPasswordDic setValue:text forKey:@""];
        };
        firstItem.didSelectedBtn = ^(NSInteger tag) {
            weakself.stepString = @"2";
            [weakself setupFindPayPasswordTableView];
            [weakself.jiaTableView reloadData];
        };
    }else{
        FindPayPasswordSecondItem *secondItem = [[FindPayPasswordSecondItem alloc] init];
        secondItem.selectionStyle = UITableViewCellSelectionStyleNone;
        secondItem.timeString = self.timeString;
        [section addItem:secondItem];
        secondItem.didEditing = ^(NSString *text) {
            [weakself.findPasswordDic setValue:text forKey:@""];
        };
        secondItem.didSelectedBtn = ^(NSInteger tag) {
            if (tag == 11) {//获取验证码
                [weakself getCodeOfFindPassword];
            }else{//提交
                
            }
        };
        
        RACSignal *timeSignal = [RACSignal combineLatest:@[RACObserve(self, timeString)] reduce:^id(NSString *time){
            if ([time isEqualToString:@"获取"]) {
                secondItem.timeString = @"获取";
            }else{
                secondItem.timeString = time;
            }
            return @"12";
        }];
        
        [timeSignal subscribeNext:^(id x) {
            
        }];
        
    }
}

//获取验证码
- (void) getCodeOfFindPassword {
    
    _passwordTimer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(startTime) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_passwordTimer forMode:NSRunLoopCommonModes];
    
    return;
    
    NSString *findString = @"";
    
    JWeakSelf;
    [self requestDataPostWithString:findString params:self.findPasswordDic successBlock:^(id responseObject) {
        
    } andFailBlock:^(NSError *error) {
        
    }];
    
}

//倒计时
- (void) startTime {
    NSInteger value = 0;
    if ([self.timeString isEqualToString:@"获取"]) {
        value = 5;
    }else{
        value = [self.timeString integerValue];
    }
    
    value -- ;
    if (value > 0) {
        self.timeString = [NSString stringWithFormat:@"%d",value];
    }else{
        [_passwordTimer invalidate];
        _passwordTimer = nil;
        self.timeString = @"获取";
    }
    
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
