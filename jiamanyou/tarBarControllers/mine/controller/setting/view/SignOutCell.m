//
//  SignOutCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/7.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "SignOutCell.h"

@implementation SignOutCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 45;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.backgroundColor = JBackGroundColor;
    self.separatorInset = JSeparatorInset1;
    
    [self.contentView addSubview:self.signOutButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.signOutButton autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, JMiddleSpacing, 0, JMiddleSpacing)];
}

- (UIButton *)signOutButton {
    if (!_signOutButton) {
        _signOutButton = [UIButton newAutoLayoutView];
        _signOutButton.titleLabel.font = JFont7;
        [_signOutButton setTitle:@"退出登录" forState:0];
        [_signOutButton setTitleColor:JOrangeColor1 forState:0];
        _signOutButton.layer.cornerRadius = 3;
        _signOutButton.layer.borderWidth = 0.5;
        _signOutButton.layer.borderColor = JLightGrayColor10.CGColor;
        _signOutButton.backgroundColor = JWhiteColor;
        
        JWeakSelf;
        [_signOutButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(999);
            }
        }];
    }
    return _signOutButton;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
