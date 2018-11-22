//
//  ProcessCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/2.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "ProcessCell.h"


@implementation ProcessCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 90;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = JSeparatorInset2;

    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.progressLabel];
    [self.contentView addSubview:self.detailProgressView];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:JMiddleSpacing];
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:JMiddleSpacing];
    
    [self.progressLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:JMiddleSpacing];
    [self.progressLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.titleLabel withOffset:4];
    
    [self.detailProgressView autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.titleLabel];
    [self.detailProgressView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.progressLabel withOffset:JSmallSpacing];
    [self.detailProgressView autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.progressLabel];
    [self.detailProgressView autoSetDimension:ALDimensionHeight toSize:10];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel newAutoLayoutView];
        _titleLabel.font = JFont5;
        _titleLabel.text = @"产品进度";
        _titleLabel.textColor = JBlackColor1;
    }
    return _titleLabel;
}

- (UILabel *)progressLabel {
    if (!_progressLabel) {
        _progressLabel = [UILabel newAutoLayoutView];
    }
    return _progressLabel;
}

- (UIProgressView *)detailProgressView {
    if (!_detailProgressView) {
        _detailProgressView = [UIProgressView newAutoLayoutView];
        _detailProgressView.tintColor = JOrangeColor1;
        _detailProgressView.trackTintColor = JOrangeColor2;
//        _detailProgressView.progressViewStyle = UIProgressViewStyleBar;
        _detailProgressView.layer.cornerRadius = 10;
        _detailProgressView.backgroundColor = JRedColor;
    }
    return _detailProgressView;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.progressLabel.attributedText = [NSString setAttributeOfFirstString:@"已投标 " firstFont:JFont3 firstColor:JLightGrayColor5 secondString:@"20%" secondFont:JFont3 secondColor:JOrangeColor];
    
    self.detailProgressView.progress = 0.6;
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
