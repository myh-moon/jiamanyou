//
//  ModifyPayPasswordViewController.m
//  jiamanyou
//
//  Created by jiamanu on 2018/11/16.
//  Copyright © 2018 jiamanyou. All rights reserved.
//

#import "ModifyPayPasswordViewController.h"

#import "ModifyPayPasswordFirstItem.h"
#import "ModifyPayPasswordSecondItem.h"
#import "ModifyPayPasswordThirdItem.h"

@interface ModifyPayPasswordViewController ()

@property (nonatomic,strong) NSMutableDictionary *modifyPasswordDic;
@property (nonatomic,strong) NSString *stepString;

@end

@implementation ModifyPayPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"身份验证";
    self.navigationItem.leftBarButtonItem = self.backBarButtonItem;
    
    self.stepString = @"1";
    
    self.jiaManager[@"ModifyPayPasswordFirstItem"] = @"ModifyPayPasswordFirstCell";
    self.jiaManager[@"ModifyPayPasswordSecondItem"] = @"ModifyPayPasswordSecondCell";
    self.jiaManager[@"ModifyPayPasswordThirdItem"] = @"ModifyPayPasswordThirdCell";
    
    [self setupModifyPayPasswordTableView];
}

#pragma mark - init
- (NSMutableDictionary *)modifyPasswordDic {
    if (!_modifyPasswordDic) {
        _modifyPasswordDic = [NSMutableDictionary dictionary];
    }
    return _modifyPasswordDic;
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
        ModifyPayPasswordFirstItem *firstItem = [[ModifyPayPasswordFirstItem alloc] init];
        firstItem.selectionStyle = UITableViewCellSelectionStyleNone;
        [section addItem:firstItem];
        firstItem.didEditing = ^(NSString *text) {
            if (text.length == 6) {
                [weakself.modifyPasswordDic setValue:text forKey:@"pass1"];
                
                [weakself performSelector:@selector(confirmToVerifyPaymentPassword) withObject:nil afterDelay:0.5];
            }
        };
    }else if([self.stepString isEqualToString:@"2"]){
        ModifyPayPasswordSecondItem *secondItem = [[ModifyPayPasswordSecondItem alloc] init];
        secondItem.selectionStyle = UITableViewCellSelectionStyleNone;
        [section addItem:secondItem];
        secondItem.didEditing = ^(NSString *text) {
            if (text.length == 6) {
                [weakself.modifyPasswordDic setValue:text forKey:@"pass2"];
                
                [weakself performSelector:@selector(confirmToResetPaymentPassword) withObject:nil afterDelay:0.5];
            }
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

//弹出密码支付框
- (void) showPasswordForm {
    
}

//验证支付密码
- (void) confirmToVerifyPaymentPassword {
    self.stepString = @"2";
    [self setupModifyPayPasswordTableView];
    [self.jiaTableView reloadData];
    
    return;
    
    NSString *verifyString = @"";
    
    JWeakSelf;
    [self requestDataPostWithString:verifyString params:self.modifyPasswordDic successBlock:^(id responseObject) {
        
    } andFailBlock:^(NSError *error) {
        
    }];
}

//重新设置支付密码
- (void) confirmToResetPaymentPassword {
    
    self.stepString = @"3";
    [self setupModifyPayPasswordTableView];
    [self.jiaTableView reloadData];
    
    return;
    
    NSString *setString = @"";
    
    JWeakSelf;
    [self requestDataPostWithString:setString params:self.modifyPasswordDic successBlock:^(id responseObject) {
        
    } andFailBlock:^(NSError *error) {
        
    }];
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
