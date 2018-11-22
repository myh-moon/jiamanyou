//
//  JiaViewController.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/1.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "JiaViewController.h"

@interface JiaViewController ()


@end

@implementation JiaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.jiaTableView];
    
    [self.view setNeedsUpdateConstraints];
    
    self.jiaManager = [[RETableViewManager alloc] initWithTableView:self.jiaTableView];
}

- (void)layoutConstraints {
    [self.jiaTableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
    [self.jiaTableView autoPinToTopLayoutGuideOfViewController:self withInset:0];
}

- (UITableView *)jiaTableView {
    if (!_jiaTableView) {
        _jiaTableView = [UITableView newAutoLayoutView];
        _jiaTableView.tableFooterView = [UIView new];
        _jiaTableView.showsVerticalScrollIndicator = NO;
        _jiaTableView.backgroundColor = JBackGroundColor;
    }
    return _jiaTableView;
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
