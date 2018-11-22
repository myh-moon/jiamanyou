//
//  CardNumberCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/7.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "CardNumberCell.h"

@implementation CardNumberCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 45;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.backgroundColor = JWhiteColor;
    self.separatorInset = JSeparatorInset1;
    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.contentTextField];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:JMiddleSpacing];
    [self.titleLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    [self.contentTextField autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.titleLabel];
    [self.contentTextField autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.titleLabel withOffset:40];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel newAutoLayoutView];
        _titleLabel.textColor = JBlackColor1;
        _titleLabel.text = @"卡号";
        _titleLabel.font = JFont5;
    }
    return _titleLabel;
}

- (UITextField *)contentTextField {
    if (!_contentTextField) {
        _contentTextField = [UITextField newAutoLayoutView];
        _contentTextField.font = JFont3;
        _contentTextField.textColor = JBlackColor1;
        _contentTextField.placeholder = @"请输入银行卡号";
        _contentTextField.keyboardType = UIKeyboardTypeNumberPad;
        
        JWeakSelf;
        [_contentTextField.rac_textSignal subscribeNext:^(NSString *text) {
            if (weakself.item.didEditing) {
                weakself.item.didEditing(text);
            }
        }];
    }
    return _contentTextField;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    
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
