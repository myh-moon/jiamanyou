//
//  ModifyLoginPasswordCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/11/16.
//  Copyright © 2018 jiamanyou. All rights reserved.
//

#import "ModifyLoginPasswordCell.h"

@implementation ModifyLoginPasswordCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return JCellHeight;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = JSeparatorInset3;
    self.backgroundColor = JBackGroundColor;
    
    [self.contentView addSubview:self.titleLabel];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:JMiddleSpacing];
    [self.titleLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel newAutoLayoutView];
        _titleLabel.textColor = JBlackColor1;
        _titleLabel.font = JFont5;
    }
    return _titleLabel;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.titleLabel.text = @"12345678923";
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
