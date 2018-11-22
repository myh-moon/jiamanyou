//
//  MainFeatureCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/1.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "MainFeatureCell.h"

@implementation MainFeatureCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 100;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = JSeparatorInset1;
//    self.backgroundColor = JBlackColor;
    
    [self.contentView addSubview:self.featureImageButton1];
    [self.contentView addSubview:self.featureImageButton2];
    [self.contentView addSubview:self.featureImageButton3];

    [self.contentView addSubview:self.featureButton1];
    [self.contentView addSubview:self.featureButton2];
    [self.contentView addSubview:self.featureButton3];

    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    NSArray *views = @[self.featureImageButton1,self.featureImageButton2,self.featureImageButton3];
    [views autoDistributeViewsAlongAxis:ALAxisHorizontal alignedTo:ALAttributeHorizontal withFixedSize:51 insetSpacing:YES];
    
    [[views firstObject] autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:JMiddleSpacing];
    //        [[views firstObject] autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [views autoSetViewsDimension:ALDimensionHeight toSize:51];
    
    NSArray *views1 = @[self.featureButton1,self.featureButton2,self.featureButton3];
    [views1 autoAlignViewsToAxis:ALAxisHorizontal];
    
    [self.featureButton1 autoAlignAxis:ALAxisVertical toSameAxisOfView:self.featureImageButton1];
    [self.featureButton1 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.featureImageButton1 withOffset:5];
    
    [self.featureButton2 autoAlignAxis:ALAxisVertical toSameAxisOfView:self.featureImageButton2];
    
    [self.featureButton3 autoAlignAxis:ALAxisVertical toSameAxisOfView:self.featureImageButton3];
}

- (UIButton *)featureImageButton1 {
    if (!_featureImageButton1) {
        _featureImageButton1 = [UIButton newAutoLayoutView];
        _featureImageButton1.layer.cornerRadius = 25.5;
        _featureImageButton1.backgroundColor = JRedColor;
    }
    return _featureImageButton1;
}

- (UIButton *)featureImageButton2 {
    if (!_featureImageButton2) {
        _featureImageButton2 = [UIButton newAutoLayoutView];
        _featureImageButton2.layer.cornerRadius = 25.5;
        _featureImageButton2.backgroundColor = JRedColor;
        
    }
    return _featureImageButton2;
}

- (UIButton *)featureImageButton3 {
    if (!_featureImageButton3) {
        _featureImageButton3 = [UIButton newAutoLayoutView];
        _featureImageButton3.layer.cornerRadius = 25.5;
        _featureImageButton3.backgroundColor = JLightGrayColor;
    }
    return _featureImageButton3;
}

- (UIButton *)featureButton1 {
    if (!_featureButton1) {
        _featureButton1 = [UIButton newAutoLayoutView];
        [_featureButton1 setTitleColor:JLightGrayColor forState:0];
        _featureButton1.titleLabel.font = JFont3;
        [_featureButton1 setTitle:@"灵活投资" forState:0];
    }
    return _featureButton1;
}

- (UIButton *)featureButton2 {
    if (!_featureButton2) {
        _featureButton2 = [UIButton newAutoLayoutView];
        [_featureButton2 setTitleColor:JLightGrayColor forState:0];
        _featureButton2.titleLabel.font = JFont3;
        [_featureButton2 setTitle:@"资金托管" forState:0];
    }
    return _featureButton2;
}

- (UIButton *)featureButton3 {
    if (!_featureButton3) {
        _featureButton3 = [UIButton newAutoLayoutView];
        [_featureButton3 setTitleColor:JLightGrayColor forState:0];
        _featureButton3.titleLabel.font = JFont3;
        [_featureButton3 setTitle:@"专业风控" forState:0];
    }
    return _featureButton3;
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
