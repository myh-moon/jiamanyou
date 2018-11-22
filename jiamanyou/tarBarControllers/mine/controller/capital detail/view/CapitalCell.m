//
//  CapitalCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/6.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "CapitalCell.h"

@implementation CapitalCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 70;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.backgroundColor = JWhiteColor;
    self.separatorInset = UIEdgeInsetsZero;
    
    [self.contentView addSubview:self.typeLabel];
    [self.contentView addSubview:self.moneyLabel];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.typeLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:JMiddleSpacing];
    [self.typeLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    [self.moneyLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:JMiddleSpacing];
    [self.moneyLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.typeLabel];
}

- (UILabel *)typeLabel {
    if (!_typeLabel) {
        _typeLabel = [UILabel newAutoLayoutView];
        _typeLabel.numberOfLines = 0;
    }
    return _typeLabel;
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
    
    self.typeLabel.attributedText = [NSString setAttributeOfFirstString:self.item.typeString firstFont:JFont5 firstColor:JBlackColor2 secondString:self.item.timeString secondFont:JFont10 secondColor:JLightGrayColor align:0 space:5];
    
    self.moneyLabel.attributedText = [NSString setAttributeOfFirstString:self.item.moneyString firstFont:JFont5 firstColor:JLightGrayColor secondString:self.item.resultString secondFont:JFont10 secondColor:JLightGrayColor align:2 space:5];
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
