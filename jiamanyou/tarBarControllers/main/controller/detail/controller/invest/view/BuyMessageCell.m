//
//  BuyMessageCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/3.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "BuyMessageCell.h"

@implementation BuyMessageCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 150;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = JSeparatorInset1;
    
    [self.contentView addSubview:self.codeLabel];
    [self.contentView addSubview:self.rateLabel];
    [self.contentView addSubview:self.surplusLabel];
    [self.contentView  addSubview:self.durationLabel];
    [self.contentView addSubview:self.buyProgressView];
    [self.contentView addSubview:self.progressLabel];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.codeLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:JMiddleSpacing];
    [self.codeLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:JMiddleSpacing];
    
    [self.rateLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.codeLabel];
    [self.rateLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.codeLabel withOffset:JBigSpacing];
    [self.rateLabel autoSetDimension:ALDimensionWidth toSize:130];
    
    [self.surplusLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.rateLabel withOffset:30];
    [self.surplusLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.rateLabel];
    
    [self.durationLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.surplusLabel];
    [self.durationLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.surplusLabel withOffset:JMiddleSpacing];
    
    [self.buyProgressView autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.rateLabel];
    [self.buyProgressView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.rateLabel withOffset:JBigSpacing];
    [self.buyProgressView autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:self.progressLabel withOffset:-JSmallSpacing];
    [self.buyProgressView autoSetDimension:ALDimensionHeight toSize:7];
    
    [self.progressLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:JMiddleSpacing];
    [self.progressLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.buyProgressView];
}

- (UILabel *)codeLabel {
    if (!_codeLabel) {
        _codeLabel = [UILabel newAutoLayoutView];
        _codeLabel.textColor = JBlackColor1;
        _codeLabel.font = JFont5;
    }
    return _codeLabel;
}

- (UILabel *)rateLabel {
    if (!_rateLabel) {
        _rateLabel = [UILabel newAutoLayoutView];
        _rateLabel.numberOfLines = 0;
    }
    return _rateLabel;
}

- (UILabel *)surplusLabel {
    if (!_surplusLabel) {
        _surplusLabel = [UILabel newAutoLayoutView];
    }
    return _surplusLabel;
}

- (UILabel *)durationLabel {
    if (!_durationLabel) {
        _durationLabel = [UILabel newAutoLayoutView];
    }
    return _durationLabel;
}

- (UIProgressView *)buyProgressView {
    if (!_buyProgressView) {
        _buyProgressView = [UIProgressView newAutoLayoutView];
        _buyProgressView.tintColor = JOrangeColor1;
        _buyProgressView.trackTintColor  = JOrangeColor2;
    }
    return _buyProgressView;
}

- (UILabel *)progressLabel {
    if (!_progressLabel) {
        _progressLabel = [UILabel newAutoLayoutView];
        _progressLabel.textColor = JLightGrayColor;
        _progressLabel.font = JFont4;
    }
    return _progressLabel;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.codeLabel.text = @"苏A揽胜-010期";
    self.rateLabel.attributedText = [NSString setAttributeOfFirstString:@"12%\n" firstFont:[UIFont systemFontOfSize:20] firstColor:JOrangeColor1 secondString:@"预期年化收益率" secondFont:JFont5 secondColor:JLightGrayColor align:0 space:JSmallSpacing];
    
    self.surplusLabel.attributedText = [NSString setAttributeOfFirstString:@"剩余可投  " firstFont:JFont3 firstColor:JBlackColor1 secondString:@"400000.00" secondFont:JFont5 secondColor:JOrangeColor1 thirdString:@"  元" thirdFont:JFont3 thirdColor:JBlackColor1];
    
    self.durationLabel.attributedText = [NSString setAttributeOfFirstString:@"投资期限  " firstFont:JFont3 firstColor:JBlackColor1 secondString:@"97" secondFont:JFont5 secondColor:JOrangeColor1 thirdString:@"  天" thirdFont:JFont3 thirdColor:JBlackColor1];
    
    self.buyProgressView.progress = 0.2;
    
    self.progressLabel.text = @"20%";
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
