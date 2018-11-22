//
//  SettingElseCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/7.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "SettingElseCell.h"

@implementation SettingElseCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 50;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.backgroundColor = JWhiteColor;
    self.separatorInset = JSeparatorInset1;
    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.actButton];
    [self.contentView addSubview:self.typeButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    NSArray *views = @[self.titleLabel,self.typeButton,self.actButton];
    [views autoAlignViewsToAxis:ALAxisHorizontal];
    
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:JMiddleSpacing];
    [self.titleLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    [self.actButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:JMiddleSpacing];
    
    [self.typeButton autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:self.actButton withOffset:-JSmallSpacing];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel newAutoLayoutView];
        _titleLabel.textColor = JBlackColor1;
        _titleLabel.font = JFont5;
        _titleLabel.text = @"账户资金安全";
    }
    return _titleLabel;
}

- (UIButton *)typeButton {
    if (!_typeButton) {
        _typeButton = [UIButton newAutoLayoutView];
        _typeButton.userInteractionEnabled = NO;
    }
    return _typeButton;
}

- (UIButton *)actButton {
    if (!_actButton) {
        _actButton = [UIButton newAutoLayoutView];
        [_actButton swapImage];
        _actButton.titleLabel.font = JFont3;
        [_actButton setTitleColor:JLightGrayColor forState:0];
        _actButton.userInteractionEnabled = NO;
    }
    return _actButton;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    [self.actButton setTitle:@"已保护" forState:0];
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
