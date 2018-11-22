//
//  ModifyNickNameViewController.m
//  jiamanyou
//
//  Created by jiamanu on 2018/11/19.
//  Copyright © 2018 jiamanyou. All rights reserved.
//

#import "ModifyNickNameViewController.h"
#import "UIViewController+DismissKeyboard.h"

#import "ModifyNickNameItem.h"

@interface ModifyNickNameViewController ()

@property (nonatomic,strong) NSMutableDictionary *nickDic;

@end

@implementation ModifyNickNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"修改用户名";
    self.navigationItem.leftBarButtonItem = self.backBarButtonItem;
    
    self.jiaManager[@"ModifyNickNameItem"] = @"ModifyNickNameCell";
    
    [self setupModifyNickNameTableView];
    
    [self setupForDismissKeyboard];
}

#pragma mark - getter
- (NSMutableDictionary *)nickDic {
    if (!_nickDic) {
        _nickDic = [NSMutableDictionary dictionary];
    }
    return _nickDic;
}

#pragma  mark - method
- (void) setupModifyNickNameTableView {
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.jiaManager addSection:section];
    
    ModifyNickNameItem *nickItem = [[ModifyNickNameItem alloc] init];
    nickItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:nickItem];
    JWeakSelf;
    nickItem.didEditing = ^(NSString *text) {
        [weakself.nickDic setValue:text forKey:@"nick"];
    };
}

//修改用户名
- (void) confirmToModifyNickName {
    
    [self performSelector:@selector(ssssssssssss) withObject:nil afterDelay:1];
    
    return;
    
    NSString *nickString = @"";
    
    JWeakSelf;
    [self requestDataPostWithString:nickString params:self.nickDic successBlock:^(id responseObject) {
        
    } andFailBlock:^(NSError *error) {
        
    }];
}

- (void)back {
    [self confirmToModifyNickName];
}

- (void) ssssssssssss {
    [self.navigationController popViewControllerAnimated:YES];
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
