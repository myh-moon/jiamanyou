//
//  RecordCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/3.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "RecordCell.h"

@implementation RecordCell

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = JSeparatorInset1;
    self.backgroundColor = JWhiteColor;
    
//    [self.contentView addSubview:self.orangeLabel];
//    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.investPersonLabel];
    [self.contentView addSubview:self.investMoneyLabel];
    [self.contentView addSubview:self.investTimeLabel];

    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
//    [self.orangeLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:JMiddleSpacing];
//    [self.orangeLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:JMiddleSpacing];
//    //        self.orangeLabel.backgroundColor = JOrangeColor1;
//    [self.orangeLabel autoSetDimensionsToSize:CGSizeMake(3, 15)];
//
//    [self.titleLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.orangeLabel withOffset:8];
//    [self.titleLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.orangeLabel];
    
    NSArray *views = @[self.investPersonLabel,self.investMoneyLabel,self.investTimeLabel];
    [views autoAlignViewsToAxis:ALAxisHorizontal];
    [[views firstObject] autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:JBigSpacing];
    [views autoSetViewsDimension:ALDimensionHeight toSize:30];
    
    [self.investPersonLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:JBigSpacing];
    [self.investPersonLabel autoSetDimension:ALDimensionWidth toSize:(JWindowWidth-JBigSpacing*2-1.5*2)*2/7];
    
    [self.investMoneyLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.investPersonLabel withOffset:1.5];
    [self.investMoneyLabel autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self.investPersonLabel];
    
    [self.investTimeLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:JBigSpacing];
    [self.investTimeLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.investMoneyLabel withOffset:1.5];
}

- (UILabel *)investPersonLabel {
    if (!_investPersonLabel) {
        _investPersonLabel = [UILabel newAutoLayoutView];
        _investPersonLabel.font = JFont3;
        _investPersonLabel.textColor = JLightGrayColor5;
        _investPersonLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _investPersonLabel;
}

- (UILabel *)investMoneyLabel {
    if (!_investMoneyLabel) {
        _investMoneyLabel = [UILabel newAutoLayoutView];
        _investMoneyLabel.font = JFont3;
        _investMoneyLabel.textColor = JLightGrayColor5;
        _investMoneyLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _investMoneyLabel;
}

- (UILabel *)investTimeLabel {
    if (!_investTimeLabel) {
        _investTimeLabel = [UILabel newAutoLayoutView];
        _investTimeLabel.font = JFont3;
        _investTimeLabel.textColor = JLightGrayColor5;
        _investTimeLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _investTimeLabel;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.investPersonLabel.text = @"投资人";
    self.investMoneyLabel.text = @"投资金额(元)";
    self.investTimeLabel.text = @"投资时间";
    
    if ([self.item.colorType isEqualToString:@"0"]) {
        self.investPersonLabel.backgroundColor = JLightGrayColor3;
        self.investPersonLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:13];
        
        self.investMoneyLabel.backgroundColor = JLightGrayColor3;
        self.investMoneyLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:13];
        
        self.investTimeLabel.backgroundColor = JLightGrayColor3;
        self.investTimeLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:13];
        
    }else{
        
        self.investPersonLabel.backgroundColor = JLightGrayColor14;
        self.investPersonLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
        
        self.investMoneyLabel.backgroundColor = JLightGrayColor14;
        self.investMoneyLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
        
        self.investTimeLabel.backgroundColor = JLightGrayColor14;
        self.investTimeLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
        
    }
}

//
//- (UILabel *)orangeLabel {
//    if (!_orangeLabel) {
//        _orangeLabel = [UILabel newAutoLayoutView];
//        _orangeLabel.backgroundColor = JOrangeColor1;
//    }
//    return _orangeLabel;
//}
//
//- (UILabel *)titleLabel {
//    if (!_titleLabel) {
//        _titleLabel = [UILabel newAutoLayoutView];
//        _titleLabel.text = @"投资记录";
//        _titleLabel.textColor = JBlackColor1;
//        _titleLabel.font = JFont5;
//    }
//    return _titleLabel;
//}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
