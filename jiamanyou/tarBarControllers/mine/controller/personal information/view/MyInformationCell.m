//
//  MyInformationCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/7.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "MyInformationCell.h"

@implementation MyInformationCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 50;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.backgroundColor = JWhiteColor;
    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.contentLabel];
     
     [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:JMiddleSpacing];
    [self.titleLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    [self.contentLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:JMiddleSpacing];
    [self.contentLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.titleLabel];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel newAutoLayoutView];
        _titleLabel.font = JFont5;
        _titleLabel.textColor = JBlackColor1;
    }
    return _titleLabel;
}

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [UILabel newAutoLayoutView];
        _contentLabel.font = JFont3;
        _contentLabel.textColor = JLightGrayColor;
    }
    return _contentLabel;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.separatorInset = self.item.seperateType ? JSeparatorInset3 : JSeparatorInset1;
    
    self.titleLabel.text =  self.item.titleString;
    self.contentLabel.text = self.item.contentString;
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
