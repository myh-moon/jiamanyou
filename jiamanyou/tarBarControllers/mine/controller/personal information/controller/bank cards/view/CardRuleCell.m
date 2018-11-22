//
//  CardRuleCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/7.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "CardRuleCell.h"

@implementation CardRuleCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 40;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.backgroundColor = JBackGroundColor;
    self.separatorInset = JSeparatorInset1;
    
    [self.contentView addSubview:self.ruleLabel];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.ruleLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [self.ruleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:JMiddleSpacing];
}

- (UILabel *)ruleLabel {
    if (!_ruleLabel) {
        _ruleLabel = [UILabel newAutoLayoutView];
        _ruleLabel.text = @"请绑定持卡人本人的银行卡";
        _ruleLabel.textColor = JLightGrayColor11;
        _ruleLabel.font = JFont3;
    }
    return _ruleLabel;
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
