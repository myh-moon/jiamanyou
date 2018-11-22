//
//  SettingCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/7.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "SettingCell.h"

@implementation SettingCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 50;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.backgroundColor = JWhiteColor;
    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.actButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:JMiddleSpacing];
    [self.titleLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    [self.actButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:JMiddleSpacing];
    [self.actButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.titleLabel];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel newAutoLayoutView];
        _titleLabel.textColor = JBlackColor1;
        _titleLabel.font = JFont5;
    }
    return _titleLabel;
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
    
    self.separatorInset = self.item.seperateType ? JSeparatorInset3 : JSeparatorInset1;
    
    self.titleLabel.text = self.item.titleString;
    [self.actButton setTitle:self.item.actString forState:0];
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
