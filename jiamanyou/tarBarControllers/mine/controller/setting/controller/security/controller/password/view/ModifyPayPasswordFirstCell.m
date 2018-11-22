//
//  ModifyPayPasswordFirstCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/11/16.
//  Copyright © 2018 jiamanyou. All rights reserved.
//

#import "ModifyPayPasswordFirstCell.h"

@implementation ModifyPayPasswordFirstCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 200;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = JSeparatorInset1;
    self.backgroundColor = JBackGroundColor;
    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.passwordTextField];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:100];
    [self.titleLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
    
    [self.passwordTextField autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.titleLabel withOffset:50];
    [self.passwordTextField autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:45];
    [self.passwordTextField autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:45];
    [self.passwordTextField autoSetDimension:ALDimensionHeight toSize:50];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel newAutoLayoutView];
        _titleLabel.text = @"请输入支付密码";
        _titleLabel.font = JFont20;
        _titleLabel.textColor = JBlackColor1;
    }
    return _titleLabel;
}

- (LYSecurityField *)passwordTextField {
    if (!_passwordTextField) {
        _passwordTextField.translatesAutoresizingMaskIntoConstraints = NO;
        _passwordTextField = [[LYSecurityField alloc] initWithNumberOfCharacters:6 securityCharacterType:SecurityCharacterTypeSecurityDot borderType:BorderTypeHaveRoundedCorner];
        
        _passwordTextField.tintColor = JLightGrayColor9;
        _passwordTextField.colorOfCharacter = JBlackColor;
        
        JWeakSelf;
        _passwordTextField.completion = ^(LYSecurityField * _Nonnull field, NSString * _Nonnull text) {
            if (weakself.item.didEditing) {
                weakself.item.didEditing(text);
            }
        };
    }
    return _passwordTextField;
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
