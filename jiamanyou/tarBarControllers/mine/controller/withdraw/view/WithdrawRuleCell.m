//
//  WithdrawRuleCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/8.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "WithdrawRuleCell.h"

@implementation WithdrawRuleCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 60;
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
    [self.ruleLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:JMiddleSpacing];
    [self.ruleLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
}

- (UILabel *)ruleLabel {
    if (!_ruleLabel) {
        _ruleLabel = [UILabel newAutoLayoutView];
        _ruleLabel.numberOfLines = 0;
        _ruleLabel.attributedText = [NSString setAttributeOfFirstString:@"手续费：" firstFont:JFont3 firstColor:JLightGrayColor secondString:@"2" secondFont:JFont3 secondColor:JOrangeColor1 thirdString:@" 元/笔(由第三方富友收取)，提现100元及以上由伽满优垫付手续费。" thirdFont:JFont3 thirdColor:JLightGrayColor align:0 space:6];
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
