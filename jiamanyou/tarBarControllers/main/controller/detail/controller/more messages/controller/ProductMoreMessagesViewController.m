//
//  ProductMoreMessagesViewController.m
//  jiamanyou
//
//  Created by jiamanu on 2018/11/15.
//  Copyright © 2018 jiamanyou. All rights reserved.
//

#import "ProductMoreMessagesViewController.h"

#import "ProductMoreMessagesItem.h"
#import "ProductMoreMessagesPersonItem.h"
#import "ProductMoreMessagesAuthentyItem.h"


@interface ProductMoreMessagesViewController ()

@end

@implementation ProductMoreMessagesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"产品档案";
    
    self.jiaManager[@"ProductMoreMessagesItem"] = @"ProductMoreMessagesCell";
    self.jiaManager[@"ProductMoreMessagesPersonItem"] = @"ProductMoreMessagesPersonCell";
    self.jiaManager[@"ProductMoreMessagesAuthentyItem"] = @"ProductMoreMessagesAuthentyCell";
    
    [self setupProductMoreMessages];
}

- (void) setupProductMoreMessages {
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.jiaManager addSection:section];
    
    //借款人信息
    ProductMoreMessagesItem *messageItem = [[ProductMoreMessagesItem alloc] init];
    messageItem.selectionStyle = UITableViewCellSelectionStyleNone;
    messageItem.titleString = @"借款人信息";
    [section addItem:messageItem];
    @weakify(messageItem);
    messageItem.selectionHandler = ^(id item) {
        @strongify(messageItem);
        messageItem.selected = !messageItem.selected;
    };
    
    ProductMoreMessagesPersonItem *moreMessagesItem = [[ProductMoreMessagesPersonItem alloc] init];
    moreMessagesItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:moreMessagesItem];
    
    //个人认证
    ProductMoreMessagesItem *authentyItem = [[ProductMoreMessagesItem alloc] init];
    authentyItem.selectionStyle = UITableViewCellSelectionStyleNone;
    authentyItem.titleString = @"个人认证";
    [section addItem:authentyItem];
    @weakify(authentyItem);
    authentyItem.selectionHandler = ^(id item) {
        @strongify(authentyItem);
        authentyItem.selected = !authentyItem.selected;
    };
    
    ProductMoreMessagesAuthentyItem *authentyPhotoItem = [[ProductMoreMessagesAuthentyItem alloc] init];
    authentyPhotoItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:authentyPhotoItem];
    
    //相关文件
    ProductMoreMessagesItem *filesItem = [[ProductMoreMessagesItem alloc] init];
    filesItem.selectionStyle = UITableViewCellSelectionStyleNone;
    filesItem.titleString = @"相关文件";
    [section addItem:filesItem];
    @weakify(filesItem);
    filesItem.selectionHandler = ^(id item) {
        @strongify(filesItem);
        filesItem.selected = !filesItem.selected;
    };
    
    ProductMoreMessagesAuthentyItem *filesPhotoItem = [[ProductMoreMessagesAuthentyItem alloc] init];
    filesPhotoItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:filesPhotoItem];
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
