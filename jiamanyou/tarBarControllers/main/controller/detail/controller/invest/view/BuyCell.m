//
//  BuyCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/3.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "BuyCell.h"

@implementation BuyCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return JCellHeight;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = JSeparatorInset1;
    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.contentTextField];
    [self.contentView addSubview:self.unitLabel];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    NSArray *views = @[self.titleLabel,self.contentTextField,self.unitLabel];
    [views autoAlignViewsToAxis:ALAxisHorizontal];
    
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:JMiddleSpacing];
    [self.titleLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    [self.contentTextField autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.titleLabel withOffset:JMiddleSpacing];
    //        [self.contentTextField autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:self.unitLabel withOffset:-JMiddleSpacing];
    [self.contentTextField autoSetDimension:ALDimensionWidth toSize:JWindowWidth-150];
    
    [self.unitLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:JMiddleSpacing];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel newAutoLayoutView];
        _titleLabel.textColor = JBlackColor1;
        _titleLabel.font = JFont5;
    }
    return _titleLabel;
}

- (UITextField *)contentTextField {
    if (!_contentTextField) {
        _contentTextField = [UITextField newAutoLayoutView];
        _contentTextField.font = JFont5;
        _contentTextField.textColor = JBlackColor1;
    }
    return _contentTextField;
}

- (UILabel *)unitLabel {
    if (!_unitLabel) {
        _unitLabel = [UILabel newAutoLayoutView];
        _unitLabel.textColor = JBlackColor1;
        _unitLabel.font = JFont5;
    }
    return _unitLabel;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.titleLabel.text = self.item.titleString;
    self.unitLabel.text = self.item.unitString;
    
    
    NSMutableAttributedString *placeHolder = [[NSMutableAttributedString alloc] initWithString:self.item.contentPlaceholder];
    [placeHolder addAttributes:@{NSFontAttributeName:JFont5,NSForegroundColorAttributeName:JLightGrayColor} range:NSMakeRange(0, self.item.contentPlaceholder.length)];
    
    self.contentTextField.attributedPlaceholder = placeHolder;
    
//    self.contentTextField.placeholder = self.item.contentPlaceholder;
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
