//
//  RechargeCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/8.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "RechargeCell.h"
#import <NSLayoutConstraint+PureLayout.h>

@implementation RechargeCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 50;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = JSeparatorInset1;
    self.backgroundColor = JWhiteColor;
    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.moneyTextField];
    [self.contentView addSubview:self.unitLabel];
    
    [self setNeedsUpdateConstraints];
}


- (void)layoutCellConstraints {
    NSArray *views = @[self.titleLabel,self.moneyTextField,self.unitLabel];
    [views autoAlignViewsToAxis:ALAxisHorizontal];
    
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:JMiddleSpacing];
    [self.titleLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    [self.moneyTextField autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.titleLabel withOffset:JMiddleSpacing];
    [self.moneyTextField autoSetDimension:ALDimensionWidth toSize:170];
    
    [self.unitLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:JMiddleSpacing];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel newAutoLayoutView];
//        _titleLabel.text = @"充值金额";
        _titleLabel.textColor = JBlackColor1;
        _titleLabel.font = JFont5;
    }
    return _titleLabel;
}


- (UITextField *)moneyTextField {
    if (!_moneyTextField) {
        _moneyTextField = [UITextField newAutoLayoutView];
        _moneyTextField.font = JFont5;
        _moneyTextField.keyboardType = UIKeyboardTypeNumberPad;
        
        _moneyTextField.textColor = JRedColor;
        
        JWeakSelf;
        [_moneyTextField.rac_textSignal subscribeNext:^(NSString *text) {
            if (weakself.item.didEditing) {
                weakself.item.didEditing(text);
            }
        }];
    }
    return _moneyTextField;
}

- (UILabel *)unitLabel {
    if (!_unitLabel) {
        _unitLabel = [UILabel newAutoLayoutView];
        _unitLabel.text = @"元";
        _unitLabel.textColor = JBlackColor1;
        _unitLabel.font = JFont5;
    }
    return _unitLabel;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.titleLabel.text = self.item.titleString;
    self.moneyTextField.placeholder = self.item.placeHolderString;
    
    
    [[[RACObserve(self.item, moneyTextString) skip:1] takeUntil:[self rac_prepareForReuseSignal]] subscribeNext:^(NSString *text) {
        
        self.moneyTextField.text = text;
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
