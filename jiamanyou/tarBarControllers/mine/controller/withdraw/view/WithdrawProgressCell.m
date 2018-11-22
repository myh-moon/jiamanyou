//
//  WithdrawProgressCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/8.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "WithdrawProgressCell.h"

@implementation WithdrawProgressCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 90;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = UIEdgeInsetsZero;
    self.backgroundColor = JWhiteColor;
    
    [self.contentView addSubview:self.bankNameLabel];
    [self.contentView addSubview:self.progressLabel];
    
    [self setNeedsUpdateConstraints];
}


- (void)layoutCellConstraints {
    [self.bankNameLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:JMiddleSpacing];
    [self.bankNameLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    [self.progressLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.bankNameLabel];
    [self.progressLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:JMiddleSpacing];
}

- (UILabel *)bankNameLabel {
    if (!_bankNameLabel) {
        _bankNameLabel = [UILabel newAutoLayoutView];
        _bankNameLabel.numberOfLines = 0;
    }
    return _bankNameLabel;
}

- (UILabel *)progressLabel {
    if (!_progressLabel) {
        _progressLabel = [UILabel newAutoLayoutView];
        _progressLabel.numberOfLines = 0;
    }
    return _progressLabel;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.bankNameLabel.attributedText = [NSString setAttributeOfFirstString:@"提现金额(元)  " firstFont:JFont5 firstColor:JBlackColor1 secondString:@"200.00" secondFont:JFont7 secondColor:JOrangeColor1 thirdString:@"\n交通银行(尾号5197)" thirdFont:JFont3 thirdColor:JLightGrayColor align:0 space:JSmallSpacing];
    
    self.progressLabel.attributedText = [NSString setAttributeOfFirstString:@"到账中\n" firstFont:JFont5 firstColor:JOrangeColor1 secondString:@"2017-11-30 11:20" secondFont:JFont3 secondColor:JLightGrayColor align:2 space:JSmallSpacing];
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
