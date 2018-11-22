//
//  UserInvestCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/6.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "UserInvestCell.h"

@implementation UserInvestCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 80;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.backgroundColor = JWhiteColor;
    self.separatorInset = JSeparatorInset2;
    
    [self.contentView addSubview:self.titleButton];
    [self.contentView addSubview:self.actButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    NSArray *views = @[self.titleButton,self.actButton];
    [views autoAlignViewsToAxis:ALAxisHorizontal];
    [[views firstObject] autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    [self.titleButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:JMiddleSpacing];
    
    [self.actButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:JMiddleSpacing];
}

- (UIButton *)titleButton {
    if (!_titleButton) {
        _titleButton = [UIButton newAutoLayoutView];
        _titleButton.titleLabel.font = JFont5;
        [_titleButton setTitleColor:JBlackColor1 forState:0];
    }
    return _titleButton;
}

- (UIButton *)actButton {
    if (!_actButton) {
        _actButton = [UIButton newAutoLayoutView];
        _actButton.titleLabel.font = JFont5;
        [_actButton setTitleColor:JLightGrayColor forState:0];
        [_actButton swapImage];
    }
    return _actButton;
}


- (void)cellWillAppear {
    [super cellWillAppear];
    
    [self.titleButton setTitle:self.item.titleString forState:0];
    [self.actButton setTitle:self.item.actionString forState:0];
    
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
