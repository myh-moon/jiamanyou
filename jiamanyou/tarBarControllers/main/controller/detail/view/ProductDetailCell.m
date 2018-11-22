//
//  ProductDetailCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/11/19.
//  Copyright © 2018 jiamanyou. All rights reserved.
//

#import "ProductDetailCell.h"

@implementation ProductDetailCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 170;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = JSeparatorInset1;
    self.backgroundColor = JOrangeColor1;
    
    [self.contentView addSubview:self.rateLabel];
    [self.contentView addSubview:self.durationLabel];
    [self.contentView addSubview:self.moneyLabel];
    [self.contentView addSubview:self.activityLabel];

    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    NSArray *views = @[self.rateLabel,self.durationLabel,self.moneyLabel];
    [views autoAlignViewsToAxis:ALAxisHorizontal];
    [[views firstObject] autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:JBigSpacing];
    
    [self.rateLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:JMiddleSpacing];
    
    [self.durationLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
    
    [self.moneyLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:JMiddleSpacing];
    
    [self.activityLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:JMiddleSpacing];
    [self.activityLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.rateLabel];
    [self.activityLabel autoSetDimensionsToSize:CGSizeMake(110, 25)];
}

- (UILabel *)rateLabel {
    if (!_rateLabel) {
        _rateLabel = [UILabel newAutoLayoutView];
        _rateLabel.numberOfLines = 0;
    }
    return _rateLabel;
}

- (UILabel *)durationLabel {
    if (!_durationLabel) {
        _durationLabel = [UILabel newAutoLayoutView];
        _durationLabel.numberOfLines = 0;
    }
    return _durationLabel;
}

- (UILabel *)moneyLabel {
    if (!_moneyLabel) {
        _moneyLabel = [UILabel newAutoLayoutView];
        _moneyLabel.numberOfLines = 0;
    }
    return _moneyLabel;
}

- (UILabel *)activityLabel {
    if (!_activityLabel) {
        _activityLabel = [UILabel newAutoLayoutView];
        _activityLabel.text = @"起购金额100元";
        _activityLabel.font = JFont3;
        _activityLabel.textColor  =JWhiteColor;
        _activityLabel.backgroundColor = UIColorFromRGB1(0xffffff, 0.15);
        _activityLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _activityLabel;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.rateLabel.attributedText = [NSString setAttributeOfFirstString:@"历史年化利率(%)\n" firstFont:JFont2 firstColor:JWhiteColor secondString:@"8" secondFont:[UIFont fontWithName:@"PingFangSC-Semibold" size:32] secondColor:JWhiteColor align:0 space:JSmallSpacing];
    
    
    self.durationLabel.attributedText = [NSString setAttributeOfFirstString:@"最低持有期(天)\n" firstFont:JFont2 firstColor:JWhiteColor secondString:@"97" secondFont:[UIFont fontWithName:@"PingFangSC-Semibold" size:32] secondColor:JWhiteColor align:0 space:JSmallSpacing];
    
    self.moneyLabel.attributedText = [NSString setAttributeOfFirstString:@"项目金额(万元)\n" firstFont:JFont2 firstColor:JWhiteColor secondString:@"8" secondFont:[UIFont fontWithName:@"PingFangSC-Semibold" size:32] secondColor:JWhiteColor align:0 space:JSmallSpacing];

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
