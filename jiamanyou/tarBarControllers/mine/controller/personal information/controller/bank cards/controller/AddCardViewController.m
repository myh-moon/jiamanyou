//
//  AddCardViewController.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/7.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "AddCardViewController.h"
#import "UIViewController+DismissKeyboard.h"

#import "CardRuleItem.h"
#import "CardNameItem.h"
#import "CardNumberItem.h"
#import "CardCommitItem.h"

@interface AddCardViewController ()

@property (nonatomic,strong) NSMutableDictionary *cardAddDic;

@end

@implementation AddCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"添加银行卡";
    self.navigationItem.leftBarButtonItem = self.backBarButtonItem;
    
    self.jiaManager[@"CardRuleItem"] = @"CardRuleCell";
    self.jiaManager[@"CardNameItem"] = @"CardNameCell";
    self.jiaManager[@"CardNumberItem"] = @"CardNumberCell";
    self.jiaManager[@"CardCommitItem"] = @"CardCommitCell";

    [self setupAddCardTableView];
    
    [self setupForDismissKeyboard];
}

#pragma mark - init
- (NSMutableDictionary *)cardAddDic {
    if (!_cardAddDic) {
        _cardAddDic = [NSMutableDictionary dictionary];
    }
    return _cardAddDic;
}

#pragma mark - method
- (void) setupAddCardTableView {
    RETableViewSection *section = [RETableViewSection section];
    section.footerHeight = 0;
    section.headerHeight = 0;
    [self.jiaManager addSection:section];
    
    CardRuleItem *ruleItem = [[CardRuleItem alloc] init];
    ruleItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:ruleItem];
    
    CardNameItem *nameItem = [[CardNameItem alloc] init];
    nameItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:nameItem];
    
    JWeakSelf;
    CardNumberItem *numberItem = [[CardNumberItem alloc] init];
    numberItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:numberItem];
    numberItem.didEditing = ^(NSString *text) {
        [weakself.cardAddDic setValue:text forKey:@"number"];
    };
    
    CardCommitItem *commitItem = [[CardCommitItem alloc] init];
    commitItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:commitItem];
    commitItem.didSelectedBtn = ^(NSInteger tag) {
        [weakself showHint:@"绑定"];
        [weakself bindBankCard];
    };
    
}

//绑定银行卡
- (void) bindBankCard {
    NSString *bindString =@"";
    
    JWeakSelf;
    [self requestDataPostWithString:bindString params:self.cardAddDic successBlock:^(id responseObject) {
        
    } andFailBlock:^(NSError *error) {
        
    }];
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
