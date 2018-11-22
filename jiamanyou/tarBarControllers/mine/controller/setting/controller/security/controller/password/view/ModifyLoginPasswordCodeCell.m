//
//  ModifyLoginPasswordCodeCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/11/16.
//  Copyright © 2018 jiamanyou. All rights reserved.
//

#import "ModifyLoginPasswordCodeCell.h"

@implementation ModifyLoginPasswordCodeCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return JCellHeight;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = UIEdgeInsetsMake(0, JMiddleSpacing, 0, 150);
    self.backgroundColor = JBackGroundColor;
    
    [self.contentView addSubview:self.codeTextField];
    [self.contentView addSubview:self.getCodeButton];

    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.codeTextField autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:JMiddleSpacing];
    [self.codeTextField autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:self.getCodeButton withOffset:-JMiddleSpacing];
    [self.codeTextField autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    [self.getCodeButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:JMiddleSpacing];
    [self.getCodeButton autoSetDimension:ALDimensionWidth toSize:120];
    [self.getCodeButton autoSetDimension:ALDimensionHeight toSize:40];
    [self.getCodeButton autoPinEdgeToSuperviewEdge:ALEdgeBottom];
}

- (UITextField *)codeTextField {
    if (!_codeTextField) {
        _codeTextField = [UITextField newAutoLayoutView];
        _codeTextField.placeholder = @"输入手机验证码";
        _codeTextField.textColor = JLightGrayColor;
        _codeTextField.font = JFont5;
        _codeTextField.keyboardType = UIKeyboardTypeNumberPad;
        
        JWeakSelf;
        [_codeTextField.rac_textSignal subscribeNext:^(NSString *text) {
            if (weakself.item.didEditing) {
                weakself.item.didEditing(text);
            }
        }];
    }
    return _codeTextField;
}

- (UIButton *)getCodeButton {
    if (!_getCodeButton) {
        _getCodeButton = [UIButton newAutoLayoutView];
        _getCodeButton.titleLabel.font = JFont5;
        _getCodeButton.layer.cornerRadius = 8;
        
        JWeakSelf;
        [_getCodeButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(12);
            }
        }];
    }
    return _getCodeButton;
}

- (void)cellWillAppear{
    [super cellWillAppear];
    
    [[RACObserve(self.item, timeString) takeUntil:[self rac_prepareForReuseSignal]] subscribeNext:^(NSString *text) {
        if ([text containsString:@"验证码"]) {
            [self.getCodeButton setTitle:text forState:0];
            self.getCodeButton.backgroundColor = JOrangeColor2;
            [self.getCodeButton setTitleColor:JRedColor1 forState:0];
            
            self.getCodeButton.userInteractionEnabled = YES;
        }else{
            NSString *aaaa = [NSString stringWithFormat:@"%@s",text];
            [self.getCodeButton setTitle:aaaa forState:0];
            self.getCodeButton.backgroundColor = JOrangeColor2;
            [self.getCodeButton setTitleColor:JLightGrayColor forState:0];
            
            self.getCodeButton.userInteractionEnabled = NO;

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
