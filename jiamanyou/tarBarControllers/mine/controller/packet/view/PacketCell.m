//
//  PacketCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/6.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "PacketCell.h"

@implementation PacketCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 136;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = JSeparatorInset1;
    self.backgroundColor = JBackGroundColor;
    
    [self.contentView addSubview:self.packetBackImageView];
    [self.contentView addSubview:self.sourceLabel];
    [self.contentView addSubview:self.moneyLabel];
    [self.contentView addSubview:self.dayLabel];
    [self.contentView addSubview:self.deadlineLabel];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.packetBackImageView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, JMiddleSpacing, 0, JMiddleSpacing)];
    
    [self.sourceLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:JMiddleSpacing * 2];
    [self.sourceLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:JBigSpacing];
    
    [self.moneyLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:JMiddleSpacing];
    [self.moneyLabel autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [self.moneyLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.sourceLabel];
    
    [self.dayLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.sourceLabel];
    [self.dayLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    [self.dayLabel autoSetDimension:ALDimensionHeight toSize:35];
    
    [self.deadlineLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.dayLabel];
    [self.deadlineLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:JMiddleSpacing*2];
}

- (UIImageView *)packetBackImageView {
    if (!_packetBackImageView) {
        _packetBackImageView = [UIImageView newAutoLayoutView];
        _packetBackImageView.backgroundColor = JWhiteColor;
    }
    return _packetBackImageView;
}

- (UILabel *)sourceLabel {
    if (!_sourceLabel) {
        _sourceLabel = [UILabel newAutoLayoutView];
        _sourceLabel.numberOfLines = 0;
    }
    return _sourceLabel;
}

- (UILabel *)moneyLabel {
    if (!_moneyLabel) {
        _moneyLabel = [UILabel newAutoLayoutView];
    }
    return _moneyLabel;
}

- (UILabel *)dayLabel {
    if (!_dayLabel) {
        _dayLabel = [UILabel newAutoLayoutView];
        _dayLabel.font = JFont3;
        _dayLabel.textColor = JOrangeColor1;
    }
    return _dayLabel;
}

- (UILabel *)deadlineLabel {
    if (!_deadlineLabel) {
        _deadlineLabel = [UILabel newAutoLayoutView];
        _deadlineLabel.font = JFont3;
        _deadlineLabel.textColor = JOrangeColor3;
    }
    return _deadlineLabel;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    NSString *source = @"来源：新手红包\n";
    
    self.sourceLabel.attributedText = [NSString setAttributeOfFirstString:source firstFont:JFont6 firstColor:JBlackColor1 secondString:@"投资金额>=1000元可用\n投资期限>=97天可用" secondFont:JFont2 secondColor:JLightGrayColor align:0 space:8];
    
    self.moneyLabel.attributedText = [NSString setAttributeOfFirstString:@"¥" firstFont:JFont20 firstColor:JOrangeColor1 secondString:@"120" secondFont:[UIFont systemFontOfSize:50] secondColor:JOrangeColor1];
    
    self.dayLabel.text = @"10天后过期";
    self.deadlineLabel.text = @"有效期至：2017-12-10";
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
