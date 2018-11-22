//
//  UserManageCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/6.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "UserManageCell.h"

@implementation UserManageCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 30;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = JSeparatorInset1;;
    self.backgroundColor = JWhiteColor;
    
    [self.contentView addSubview:self.orangeLabel];
    [self.contentView addSubview:self.titleLabel];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.orangeLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [self.orangeLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    [self.orangeLabel autoSetDimensionsToSize:CGSizeMake(3, 15)];
    
    [self.titleLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.orangeLabel];
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:JMiddleSpacing];
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
        _titleLabel.text = @"我的理财";
        _titleLabel.font = JFont4;
        _titleLabel.textColor = JLightGrayColor;
    }
    return _titleLabel;
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
