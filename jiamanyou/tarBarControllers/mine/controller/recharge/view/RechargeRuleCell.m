//
//  RechargeRuleCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/8.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "RechargeRuleCell.h"

@implementation RechargeRuleCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 40;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = JSeparatorInset1;
    self.backgroundColor = JBackGroundColor;
    
    [self.contentView addSubview:self.ruleLabel];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.ruleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:JMiddleSpacing];
    [self.ruleLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
}

- (UILabel *)ruleLabel {
    if (!_ruleLabel) {
        _ruleLabel = [UILabel newAutoLayoutView];
        _ruleLabel.textColor = JLightGrayColor11;
        _ruleLabel.font = JFont3;
        _ruleLabel.text = @"第三方支付扣款";
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
