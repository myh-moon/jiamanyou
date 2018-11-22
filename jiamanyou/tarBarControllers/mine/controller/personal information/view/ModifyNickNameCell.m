//
//  ModifyNickNameCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/11/19.
//  Copyright © 2018 jiamanyou. All rights reserved.
//

#import "ModifyNickNameCell.h"

@implementation ModifyNickNameCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 100;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = JSeparatorInset1;
    self.backgroundColor = JBackGroundColor;
    
    [self.contentView addSubview:self.borderView];
    [self.borderView addSubview:self.titleLabel];
    [self.borderView addSubview:self.nickTextField];
    [self.contentView addSubview:self.remindLabel];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.borderView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(JSmallSpacing, JMiddleSpacing, 0, JMiddleSpacing) excludingEdge:ALEdgeBottom];
    [self.borderView autoSetDimension:ALDimensionHeight toSize:JCellHeight];
    
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:JMiddleSpacing];
    [self.titleLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    [self.nickTextField autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.titleLabel];
    [self.nickTextField autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.titleLabel];
    [self.nickTextField autoSetDimension:ALDimensionWidth toSize:200];
    
    [self.remindLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.borderView withOffset:JMiddleSpacing];
    [self.remindLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:self.borderView];
}

- (UIView *)borderView {
    if (!_borderView) {
        _borderView = [UIView newAutoLayoutView];
        _borderView.backgroundColor = JWhiteColor;
        _borderView.layer.cornerRadius = 2;
        
        _borderView.layer.borderColor = JOrangeColor6.CGColor;
        _borderView.layer.borderWidth = 0.5;
    }
    return _borderView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel newAutoLayoutView];
        _titleLabel.text = @"用户名：";
        _titleLabel.textColor = JBlackColor1;
        _titleLabel.font = JFont5;
    }
    return _titleLabel;
}

- (UITextField *)nickTextField {
    if (!_nickTextField) {
        _nickTextField = [UITextField newAutoLayoutView];
        
        _nickTextField.placeholder = @"用户名";
        _nickTextField.textColor = JBlackColor1;
        _nickTextField.font = JFont5;
        
        JWeakSelf;
        [_nickTextField.rac_textSignal subscribeNext:^(NSString *text) {
            if (weakself.item.didEditing) {
                weakself.item.didEditing(text);
            }
        }];
    }
    return _nickTextField;
}

- (UILabel *)remindLabel {
    if (!_remindLabel) {
        _remindLabel = [UILabel newAutoLayoutView];
        _remindLabel.text = @"以英文字母或汉字开头，限4～16个字符，一个汉字为2个字符";
        _remindLabel.textColor = JLightGrayColor1;
        _remindLabel.font = JFont2;
    }
    return _remindLabel;
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
