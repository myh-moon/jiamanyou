//
//  MyProfitCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/6.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "MyProfitCell.h"

@implementation MyProfitCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 95;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.backgroundColor = JWhiteColor;
    self.separatorInset = JSeparatorInset1;
    
    [self.contentView addSubview:self.principalLabel];
    [self.contentView addSubview:self.profitLabel];
    [self.contentView addSubview:self.lineLabel];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    NSArray *views = @[self.principalLabel,self.lineLabel,self.profitLabel];
    [views autoAlignViewsToAxis:ALAxisHorizontal];
    
    [self.principalLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:JMiddleSpacing];
    [self.principalLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    [self.lineLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [self.lineLabel autoSetDimensionsToSize:CGSizeMake(1, 54)];
    
    [self.profitLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.lineLabel withOffset:30];
}

- (UILabel *)principalLabel {
    if (!_principalLabel) {
        _principalLabel = [UILabel newAutoLayoutView];
        _principalLabel.numberOfLines = 0;
    }
    return _principalLabel;
}

- (UILabel *)lineLabel {
    if (!_lineLabel) {
        _lineLabel = [UILabel newAutoLayoutView];
        _lineLabel.backgroundColor = JLightGrayColor10;
    }
    return _lineLabel;
}

- (UILabel *)profitLabel {
    if (!_profitLabel) {
        _profitLabel = [UILabel newAutoLayoutView];
        _profitLabel.numberOfLines  = 0;
    }
    return _profitLabel;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.principalLabel.attributedText = [NSString setAttributeOfFirstString:@"投资(元)\n" firstFont:JFont5 firstColor:JBlackColor2 secondString:@"123456.00" secondFont:JFont20 secondColor:JBlackColor2 align:0 space:JMiddleSpacing];
    
    self.profitLabel.attributedText = [NSString setAttributeOfFirstString:@"收益(元)\n" firstFont:JFont5 firstColor:JBlackColor2 secondString:@"1234.88" secondFont:JFont20 secondColor:JOrangeColor1 align:0 space:JMiddleSpacing];
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
