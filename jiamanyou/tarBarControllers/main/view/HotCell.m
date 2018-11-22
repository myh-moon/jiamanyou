//
//  HotCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/2.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "HotCell.h"
#import "NSString+Attribute.h"

@implementation HotCell

+(CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 160;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.backgroundColor = JWhiteColor;
    self.separatorInset = JSeparatorInset1;
    
    [self.contentView addSubview:self.codeLabel];
    [self.contentView addSubview:self.processButton];
    [self.contentView addSubview:self.lineLabel];
    [self.contentView addSubview:self.rateLabel];
    [self.contentView addSubview:self.durationLabel];
    [self.contentView addSubview:self.moneyLabel];
    
//    [self.contentView addSubview:self.rateLabel1];
//    [self.contentView addSubview:self.durationLabel1];
//    [self.contentView addSubview:self.moneyLabel1];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.codeLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:JMiddleSpacing];
    [self.codeLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:JMiddleSpacing];
    
    [self.processButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:JMiddleSpacing];
    [self.processButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.codeLabel];
    
    [self.lineLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.codeLabel withOffset:JMiddleSpacing];
    [self.lineLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.codeLabel];
    [self.lineLabel autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [self.lineLabel autoSetDimension:ALDimensionHeight toSize:1];
    
    NSArray *views = @[self.rateLabel,self.durationLabel,self.moneyLabel];
    [views autoDistributeViewsAlongAxis:ALAxisHorizontal alignedTo:ALAttributeHorizontal withFixedSpacing:0];
    [[views firstObject] autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.lineLabel withOffset:JMiddleSpacing*2];
    //        [[views firstObject] autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:JMiddleSpacing];
    //        [[views lastObject] autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:JMiddleSpacing];
    
    //        NSArray *views1 = @[self.rateLabel1,self.durationLabel1,self.moneyLabel1];
    //        [views1 autoAlignViewsToAxis:ALAxisHorizontal];
    //
    //        [[views1 firstObject] autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.rateLabel1 withOffset:JMiddleSpacing];
    //
    //        [self.rateLabel1 autoAlignAxis:ALAxisVertical toSameAxisOfView:self.rateLabel];
    //        [self.durationLabel1 autoAlignAxis:ALAxisVertical toSameAxisOfView:self.durationLabel];
    //        [self.moneyLabel1 autoAlignAxis:ALAxisVertical toSameAxisOfView:self.moneyLabel];
}

- (UILabel *)codeLabel {
    if (!_codeLabel) {
        _codeLabel = [UILabel newAutoLayoutView];
        _codeLabel.textColor = JGrayColor;
        _codeLabel.font = JFont6;
    }
    return _codeLabel;
}

- (UIButton *)processButton {
    if (!_processButton) {
        _processButton = [UIButton newAutoLayoutView];
        [_processButton swapImage];
        _processButton.userInteractionEnabled = NO;
    }
    return _processButton;
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
//        _rateLabel.textColor = JOrangeColor;
//        _rateLabel.font = JFont7;
        //        _rateLabel.textAlignment = NSTextAlignmentCenter;
        _rateLabel.numberOfLines = 0;
    }
    return _rateLabel;
}

- (UILabel *)durationLabel {
    if (!_durationLabel) {
        _durationLabel = [UILabel newAutoLayoutView];
//        _durationLabel.textColor = JOrangeColor;
//        _durationLabel.font = JFont7;
//        _durationLabel.textAlignment = NSTextAlignmentCenter;
        _durationLabel.numberOfLines = 0;
    }
    return _durationLabel;
}

- (UILabel *)moneyLabel {
    if (!_moneyLabel) {
        _moneyLabel = [UILabel newAutoLayoutView];
//        _moneyLabel.textColor = JOrangeColor;
//        _moneyLabel.font = JFont7;
//        _moneyLabel.textAlignment= NSTextAlignmentCenter;
        _moneyLabel.numberOfLines = 0;
    }
    return _moneyLabel;
}

//- (UILabel *)rateLabel1 {
//    if (!_rateLabel1) {
//        _rateLabel1 = [UILabel newAutoLayoutView];
//        _rateLabel1.font = JFont2;
//        _rateLabel1.textColor = JLightGrayColor2;
//        _rateLabel1.text = @"历史年化利率";
//    }
//    return _rateLabel1;
//}
//
//- (UILabel *)durationLabel1 {
//    if (!_durationLabel1) {
//        _durationLabel1 = [UILabel newAutoLayoutView];
//        _durationLabel1.font = JFont2;
//        _durationLabel1.textColor = JLightGrayColor2;
//        _durationLabel1.text = @"送手机";
//    }
//    return _durationLabel1;
//}
//
//- (UILabel *)moneyLabel1 {
//    if (!_moneyLabel1) {
//        _moneyLabel1 = [UILabel newAutoLayoutView];
//        _moneyLabel1.font = JFont2;
//        _moneyLabel1.textColor = JLightGrayColor2;
//        _moneyLabel1.text = @"项目金额";
//    }
//    return _moneyLabel1;
//}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.codeLabel.text = @"苏A揽胜-010期";

    NSMutableAttributedString *process = [NSString setAttributeOfFirstString:@"已投标  " firstFont:JFont3 firstColor:JLightGrayColor secondString:@"50%  " secondFont:JFont3 secondColor:JOrangeColor];
    [self.processButton setAttributedTitle:process forState:0];
    
    self.rateLabel.attributedText = [NSString setAttributeOfFirstString:@"12%\n" firstFont:JFont7 firstColor:JOrangeColor secondString:@"历史年化利率" secondFont:JFont2 secondColor:JLightGrayColor2 align:1 space:JSmallSpacing];
    self.durationLabel.attributedText = [NSString setAttributeOfFirstString:@"33天\n" firstFont:JFont7 firstColor:JOrangeColor secondString:@"项目期限" secondFont:JFont2 secondColor:JLightGrayColor2 align:1 space:JSmallSpacing];
    self.moneyLabel.attributedText = [NSString setAttributeOfFirstString:@"20万\n" firstFont:JFont7 firstColor:JOrangeColor secondString:@"项目金额" secondFont:JFont2 secondColor:JLightGrayColor2 align:1 space:JSmallSpacing];
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
