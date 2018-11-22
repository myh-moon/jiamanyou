//
//  CycleCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/2.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "CycleCell.h"

@implementation CycleCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 136;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = JSeparatorInset2;
    
    [self.contentView addSubview:self.titleLabel];
    
    [self.contentView addSubview:self.stepLabel1];
    [self.contentView addSubview:self.stepLabel2];
    [self.contentView addSubview:self.stepLabel3];
    
    [self.contentView addSubview:self.point1];
    [self.contentView addSubview:self.point2];
    [self.contentView addSubview:self.point3];
    
    [self.contentView addSubview:self.lineLabel1];
    [self.contentView addSubview:self.lineLabel2];
    [self.contentView addSubview:self.lineLabel3];
    
    [self.contentView addSubview:self.firstLabel];
    [self.contentView addSubview:self.secondLabel];
    [self.contentView addSubview:self.thirdLabel];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:JBigSpacing];
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft  withInset:JMiddleSpacing];
    
    //开始购买 - 计算收益-
    NSArray *views = @[self.stepLabel1,self.stepLabel2,self.stepLabel3];
    [views autoAlignViewsToAxis:ALAxisHorizontal];
    
    [[views firstObject] autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.titleLabel withOffset:JMiddleSpacing];
    [[views firstObject] autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.titleLabel];
    
    [self.stepLabel2 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.stepLabel1 withOffset:30];
    
    [self.stepLabel3 autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:40];
    
    //point
    NSArray *views1 = @[self.point1,self.point2,self.point3];
    [views1 autoAlignViewsToAxis:ALAxisHorizontal];
    [views1 autoMatchViewsDimension:ALDimensionWidth];
    [views1 autoMatchViewsDimension:ALDimensionHeight];
    
    [[views1 firstObject] autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.stepLabel1 withOffset:8];
    [[views1 firstObject] autoSetDimensionsToSize:CGSizeMake(15, 15)];
    
    [self.point1 autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.stepLabel1];
    [self.point2 autoAlignAxis:ALAxisVertical toSameAxisOfView:self.stepLabel2];
    [self.point3 autoAlignAxis:ALAxisVertical toSameAxisOfView:self.stepLabel3];
    
    
    //line
    NSArray *views2 = @[self.lineLabel1,self.lineLabel2,self.lineLabel3];
    [views2 autoAlignViewsToAxis:ALAxisHorizontal];
    [[views2 firstObject] autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.point1];
    [views2 autoMatchViewsDimension:ALDimensionHeight];
    [[views2 firstObject] autoSetDimension:ALDimensionHeight toSize:3];
    
    [self.lineLabel1 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.point1 withOffset:5];
    [self.lineLabel1 autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:self.point2 withOffset:-5];
    
    [self.lineLabel2 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.point2 withOffset:5];
    [self.lineLabel2 autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:self.point3 withOffset:-5];
    
    [self.lineLabel3 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.point3 withOffset:5];
    [self.lineLabel3 autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:JMiddleSpacing];
    
    //first-second-third
    NSArray *views3 = @[self.firstLabel,self.secondLabel,self.thirdLabel];
    [views3 autoAlignViewsToAxis:ALAxisHorizontal];
    [[views3  firstObject] autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.point1 withOffset:8];
    
    [self.firstLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.point1];
    [self.secondLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:self.point2];
    [self.thirdLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:self.point3];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel newAutoLayoutView];
        _titleLabel.text = @"产品周期";
        _titleLabel.textColor = JBlackColor1;
        _titleLabel.font = JFont5;
    }
    return _titleLabel;
}

- (UILabel *)stepLabel1 {
    if (!_stepLabel1) {
        _stepLabel1 = [UILabel newAutoLayoutView];
        _stepLabel1.textColor = JLightGrayColor5;
        _stepLabel1.text = @"购买";
        _stepLabel1.font = JFont3;
    }
    return _stepLabel1;
}
- (UILabel *)stepLabel2 {
    if (!_stepLabel2) {
        _stepLabel2 = [UILabel newAutoLayoutView];
        _stepLabel2.textColor = JLightGrayColor5;
        _stepLabel2.text = @"开始计算收益";
        _stepLabel2.font = JFont3;
    }
    return _stepLabel2;
}
- (UILabel *)stepLabel3 {
    if (!_stepLabel3) {
        _stepLabel3 = [UILabel newAutoLayoutView];
        _stepLabel3.textColor = JLightGrayColor5;
        _stepLabel3.text = @"按月付息，到期利随本清";
        _stepLabel3.font = JFont3;
    }
    return _stepLabel3;
}

- (UILabel *)point1 {
    if (!_point1) {
        _point1 = [UILabel newAutoLayoutView];
        _point1.backgroundColor = JOrangeColor1;
        _point1.layer.cornerRadius = 7.5;
        _point1.layer.masksToBounds = YES;
    }
    return _point1;
}

- (UILabel *)point2 {
    if (!_point2) {
        _point2 = [UILabel newAutoLayoutView];
        _point2.backgroundColor = JOrangeColor1;
        _point2.layer.cornerRadius = 7.5;
        _point2.layer.masksToBounds = YES;
    }
    return _point2;
}

- (UILabel *)point3 {
    if (!_point3) {
        _point3 = [UILabel newAutoLayoutView];
        _point3.backgroundColor = JOrangeColor1;
        _point3.layer.cornerRadius = 7.5;
        _point3.layer.masksToBounds = YES;
    }
    return _point3;
}


- (UILabel *)lineLabel1 {
    if (!_lineLabel1) {
        _lineLabel1 = [UILabel newAutoLayoutView];
        _lineLabel1.backgroundColor = JOrangeColor1;
    }
    return _lineLabel1;
}

- (UILabel *)lineLabel2 {
    if (!_lineLabel2) {
        _lineLabel2 = [UILabel newAutoLayoutView];
        _lineLabel2.backgroundColor = JOrangeColor1;
    }
    return _lineLabel2;
}

- (UILabel *)lineLabel3 {
    if (!_lineLabel3) {
        _lineLabel3 = [UILabel newAutoLayoutView];
        _lineLabel3.backgroundColor = JOrangeColor1;
    }
    return _lineLabel3;
}

- (UILabel *)firstLabel {
    if (!_firstLabel) {
        _firstLabel = [UILabel newAutoLayoutView];
        _firstLabel.textColor = JLightGrayColor5;
        _firstLabel.text = @"今天";
        _firstLabel.font = JFont3;
    }
    return _firstLabel;
}

- (UILabel *)secondLabel {
    if (!_secondLabel) {
        _secondLabel = [UILabel newAutoLayoutView];
        _secondLabel.textColor = JLightGrayColor5;
        _secondLabel.text = @"第二天";
        _secondLabel.font = JFont3;
    }
    return _secondLabel;
}

- (UILabel *)thirdLabel {
    if (!_thirdLabel) {
        _thirdLabel = [UILabel newAutoLayoutView];
        _thirdLabel.textColor = JLightGrayColor5;
        _thirdLabel.text = @"第97天";
        _thirdLabel.font = JFont3;
    }
    return _thirdLabel;
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
