//
//  DeadlineCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/2.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "DeadlineCell.h"

@implementation DeadlineCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 50;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = JSeparatorInset1;
    self.backgroundColor = JWhiteColor;
    
    [self.contentView addSubview:self.deadlineLabel];
    
    [self setNeedsUpdateConstraints];

}

- (void)layoutCellConstraints {
    [self.deadlineLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [self.deadlineLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
}

- (UILabel *)deadlineLabel {
    if (!_deadlineLabel) {
        _deadlineLabel = [UILabel newAutoLayoutView];
        _deadlineLabel.text = @"距离项目截止日期：";
        _deadlineLabel.textColor = JOrangeColor;
        _deadlineLabel.font = JFont5;
    }
    return _deadlineLabel;
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
