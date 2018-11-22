//
//  MyInvestmentCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/6.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "MyInvestmentCell.h"

@implementation MyInvestmentCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 120;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.contentView.backgroundColor = JWhiteColor;
    self.separatorInset = JSeparatorInset1;
    
    [self.contentView addSubview:self.statusLabel];
    [self.contentView addSubview:self.dateLabel];
    [self.contentView addSubview:self.periodsLabel];
    [self.contentView addSubview:self.lineLabel];
    [self.contentView addSubview:self.rateLabel];
    [self.contentView addSubview:self.moneyLabel];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.statusLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:JMiddleSpacing];
    [self.statusLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:JMiddleSpacing];
    [self.statusLabel autoSetDimensionsToSize:CGSizeMake(70, 26)];
    
    [self.dateLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.statusLabel];
    [self.dateLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.statusLabel withOffset:JSmallSpacing];
    
    [self.periodsLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.statusLabel];
    [self.periodsLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.statusLabel withOffset:JSmallSpacing];
    
    [self.lineLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [self.lineLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [self.lineLabel autoSetDimensionsToSize:CGSizeMake(1, 70)];
    
    [self.rateLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.lineLabel withOffset:35];
    [self.rateLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.dateLabel];
    
    [self.moneyLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.periodsLabel];
    [self.moneyLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.rateLabel];
}

- (UILabel *)statusLabel {
    if (!_statusLabel) {
        _statusLabel = [UILabel newAutoLayoutView];
        _statusLabel.font = JFont5;
        _statusLabel.layer.borderWidth  = 0.5;
        _statusLabel.layer.cornerRadius = 13;
        _statusLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _statusLabel;
}

- (UILabel *)dateLabel {
    if (!_dateLabel) {
        _dateLabel = [UILabel newAutoLayoutView];
        _dateLabel.textColor = JLightGrayColor6;
        _dateLabel.font = JFont3;
    }
    return _dateLabel;
}

- (UILabel *)periodsLabel {
    if (!_periodsLabel) {
        _periodsLabel = [UILabel newAutoLayoutView];
        _periodsLabel.numberOfLines = 0;
    }
    return _periodsLabel;
}

- (UILabel *)lineLabel {
    if (!_lineLabel) {
        _lineLabel = [UILabel newAutoLayoutView];
        _lineLabel.backgroundColor = JLightGrayColor3;
    }
    return _lineLabel;
}

- (UILabel *)rateLabel {
    if (!_rateLabel) {
        _rateLabel = [UILabel newAutoLayoutView];
        _rateLabel.text = @"回款利息";
        _rateLabel.textColor = JLightGrayColor2;
        _rateLabel.font = JFont2;
    }
    return _rateLabel;
}

- (UILabel *)moneyLabel {
    if (!_moneyLabel) {
        _moneyLabel = [UILabel newAutoLayoutView];
        _moneyLabel.numberOfLines = 0;
    }
    return _moneyLabel;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.statusLabel.text = @"回款中";
    self.statusLabel.textColor = JOrangeColor4;
    self.statusLabel.layer.borderColor = JOrangeColor4.CGColor;
    
    self.dateLabel.text = @"2018-09-09";
    self.periodsLabel.attributedText = [NSString setAttributeOfFirstString:@"苏A揽胜-009期\n" firstFont:JFont4 firstColor:JBlackColor2 secondString:@"第9期 / 共12期" secondFont:JFont2 secondColor:JLightGrayColor2 align:0 space:JMiddleSpacing];
    
    self.moneyLabel.attributedText = [NSString setAttributeOfFirstString:@"456.00" firstFont:[UIFont systemFontOfSize:25] firstColor:JBlackColor1 secondString:@"元\n" secondFont:JFont5 secondColor:JBlackColor1 thirdString:@"回款本金(元) 12,000.00" thirdFont:JFont2 thirdColor:JLightGrayColor2 align:0 space:JSmallSpacing];
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
