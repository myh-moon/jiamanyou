//
//  FindPayPasswordCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/8.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "FindPayPasswordCell.h"

@implementation FindPayPasswordCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 120;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = JSeparatorInset1;
    self.backgroundColor = JBackGroundColor;
    
    [self.contentView addSubview:self.firstImageView];
    [self.contentView addSubview:self.secondImageView];
    [self.contentView addSubview:self.lineLabel];
    [self.contentView addSubview:self.firstILabel];
    [self.contentView addSubview:self.secondILabel];
    
    [self setNeedsUpdateConstraints];
}

- (void) layoutCellConstraints {
    NSArray *views = @[self.firstImageView,self.secondImageView];
    [views autoDistributeViewsAlongAxis:ALAxisHorizontal alignedTo:ALAttributeHorizontal withFixedSize:35 insetSpacing:YES];
    [views autoMatchViewsDimension:ALDimensionWidth];
    [views autoMatchViewsDimension:ALDimensionHeight];
    
    [[views firstObject] autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:35];
    [[views firstObject] autoSetDimensionsToSize:CGSizeMake(35, 35)];
    
    [self.lineLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.firstImageView withOffset:5];
    [self.lineLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:self.secondImageView withOffset:-5];
    [self.lineLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.firstImageView];
    [self.lineLabel autoSetDimension:ALDimensionHeight toSize:1];
    
    NSArray *views1 = @[self.firstILabel,self.secondILabel];
    [views1 autoAlignViewsToAxis:ALAxisHorizontal];
    [[views1 firstObject] autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.firstImageView withOffset:JMiddleSpacing];
    
    [self.firstILabel autoAlignAxis:ALAxisVertical toSameAxisOfView:self.firstImageView];
    [self.secondILabel autoAlignAxis:ALAxisVertical toSameAxisOfView:self.secondImageView];
}

- (UIImageView *)firstImageView {
    if (!_firstImageView) {
        _firstImageView = [UIImageView newAutoLayoutView];
//        _firstImageView.backgroundColor = JRedColor;
        _firstImageView.layer.cornerRadius = 17.5;
        _firstImageView.layer.masksToBounds = YES;
    }
    return _firstImageView;
}

- (UIImageView *)secondImageView {
    if (!_secondImageView) {
        _secondImageView = [UIImageView newAutoLayoutView];
//        _secondImageView.backgroundColor = JLightGrayColor2;
        _secondImageView.layer.cornerRadius = 17.5;
        _secondImageView.layer.masksToBounds = YES;
    }
    return _secondImageView;
}

- (UILabel *)lineLabel {
    if (!_lineLabel) {
        _lineLabel = [UILabel newAutoLayoutView];
        _lineLabel.backgroundColor = JLightGrayColor12;
    }
    return _lineLabel;
}

- (UILabel *)firstILabel {
    if (!_firstILabel) {
        _firstILabel = [UILabel newAutoLayoutView];
        _firstILabel.text = @"身份证验证";
//        _firstILabel.textColor = JOrangeColor5;
        _firstILabel.font =  JFont3;
    }
    return _firstILabel;
}

- (UILabel *)secondILabel {
    if (!_secondILabel) {
        _secondILabel = [UILabel newAutoLayoutView];
        _secondILabel.text = @"手机号验证";
//        _secondILabel.textColor = JLightGrayColor;
        _secondILabel.font =  JFont3;
    }
    return _secondILabel;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    JWeakSelf;
    [[RACObserve(self.item, stepString) takeUntil:[self rac_prepareForReuseSignal]] subscribeNext:^(NSString *step) {
        if ([step isEqualToString:@"1"]) {
            weakself.firstImageView.backgroundColor = JOrangeColor;
            weakself.secondImageView.backgroundColor = JLightGrayColor;
            
            weakself.firstILabel.textColor = JOrangeColor;
            weakself.secondILabel.textColor = JLightGrayColor;
        }else{
            weakself.firstImageView.backgroundColor = JLightGrayColor;
            weakself.secondImageView.backgroundColor = JOrangeColor;
            
            weakself.firstILabel.textColor = JLightGrayColor;
            weakself.secondILabel.textColor = JOrangeColor;
        }
    }];
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
