//
//  AuthentyViewController.m
//  jiamanyou
//
//  Created by jiamanu on 2018/11/19.
//  Copyright © 2018 jiamanyou. All rights reserved.
//

#import "AuthentyViewController.h"

@interface AuthentyViewController ()

@property (nonatomic,strong) NSMutableDictionary *authentyDic;
@property (nonatomic,strong) NSString *stepString;

@end

@implementation AuthentyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"实名认证";
    self.navigationItem.leftBarButtonItem = self.backBarButtonItem;
    
    self.stepString = @"1";
    
    [self setupAuthentyTableView];
}

#pragma mark - getter
- (NSMutableDictionary *)authentyDic {
    if (!_authentyDic) {
        _authentyDic = [NSMutableDictionary dictionary];
    }
    return _authentyDic;
}

#pragma mark - method
- (void) setupAuthentyTableView {
    RETableViewSection *section = [RETableViewSection section];
    section.footerHeight = 0;
    section.headerHeight = 0;
    [self.jiaManager addSection:section];
    
    if ([self.stepString isEqualToString:@"1"]) {
        
    }else if ([self.stepString isEqualToString:@"2"]){
        
    }else if ([self.stepString isEqualToString:@"3"]){
        
    }
    
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
