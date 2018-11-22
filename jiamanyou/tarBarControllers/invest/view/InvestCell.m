//
//  InvestCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/8.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "InvestCell.h"

@implementation InvestCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 50;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = JSeparatorInset2;
    self.backgroundColor = JWhiteColor;
    
    [self.contentView addSubview:self.codeButton];
    [self.contentView addSubview:self.quotaLabel];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.codeButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:JMiddleSpacing];
    [self.codeButton autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    [self.quotaLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:JMiddleSpacing];
    [self.quotaLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.codeButton];
}

- (UIButton *)codeButton {
    if (!_codeButton) {
        _codeButton = [UIButton newAutoLayoutView];
        [_codeButton setTitle:@"苏A揽胜-010期" forState:0];
        [_codeButton setTitleColor:JGrayColor forState:0];
        _codeButton.titleLabel.font = JFont4;
    }
    return _codeButton;
}

- (UILabel *)quotaLabel {
    if (!_quotaLabel) {
        _quotaLabel = [UILabel newAutoLayoutView];
        _quotaLabel.text = @"5万元";
        _quotaLabel.textColor = JOrangeColor1;
        _quotaLabel.font = JFont4;
    }
    return _quotaLabel;
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
