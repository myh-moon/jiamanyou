//
//  RechargeLimitCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/8.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "RechargeLimitCell.h"

@implementation RechargeLimitCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 50;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = JSeparatorInset1;
    self.backgroundColor = JBackGroundColor;
    
    [self.contentView addSubview:self.limitButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.limitButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:JMiddleSpacing];
    [self.limitButton autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
}

- (UIButton *)limitButton {
    if (!_limitButton) {
        _limitButton = [UIButton newAutoLayoutView];
        [_limitButton setTitle:@"查看各银行限额" forState:0];
        _limitButton.titleLabel.font = JFont3;
        [_limitButton setTitleColor:JLightGrayColor1 forState:0];
        [_limitButton swapImage];
        
        JWeakSelf;
        [_limitButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(56);
            }
        }];
        
        
        
        
    }
    return _limitButton;
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
