//
//  RuleCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/3.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "RuleCell.h"

@implementation RuleCell

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = JSeparatorInset2;
    
    [self.contentView addSubview:self.orangeLabel];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.contentLabel];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.orangeLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:JMiddleSpacing];
    [self.orangeLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:JMiddleSpacing];
    [self.orangeLabel autoSetDimensionsToSize:CGSizeMake(3, 15)];
    
    [self.titleLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.orangeLabel withOffset:8];
    [self.titleLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.orangeLabel];
    
    [self.contentLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.orangeLabel];
    [self.contentLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.orangeLabel withOffset:JMiddleSpacing];
    [self.contentLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:JMiddleSpacing];
}

- (UILabel *)orangeLabel {
    if (!_orangeLabel) {
        _orangeLabel = [UILabel newAutoLayoutView];
        _orangeLabel.backgroundColor = JOrangeColor1;
    }
    return _orangeLabel;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel newAutoLayoutView];
        _titleLabel.textColor = JBlackColor1;
        _titleLabel.font = JFont5;
    }
    return _titleLabel;
}

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [UILabel newAutoLayoutView];
        _contentLabel.textColor = JLightGrayColor5;
        _contentLabel.font = JFont3;
        _contentLabel.numberOfLines = 0;
    }
    return _contentLabel;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.titleLabel.text = self.item.titleString;
    self.contentLabel.text = self.item.contentString;
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
