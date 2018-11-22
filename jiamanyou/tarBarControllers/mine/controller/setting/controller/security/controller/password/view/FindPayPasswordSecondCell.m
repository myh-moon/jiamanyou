//
//  FindPayPasswordSecondCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/11/15.
//  Copyright © 2018 jiamanyou. All rights reserved.
//

#import "FindPayPasswordSecondCell.h"

@implementation FindPayPasswordSecondCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 200;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = JSeparatorInset1;
    self.backgroundColor = JBackGroundColor;
    
    [self.contentView addSubview:self.phoneTextField];
    [self.contentView addSubview:self.getCodeButton];
    [self.contentView addSubview:self.validateButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.phoneTextField autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:JMiddleSpacing];
    [self.phoneTextField autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:self.getCodeButton withOffset:-JSmallSpacing];
    [self.phoneTextField autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:JMiddleSpacing];
    [self.phoneTextField autoSetDimension:ALDimensionHeight toSize:45];
    
    [self.getCodeButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:JMiddleSpacing];
    [self.getCodeButton autoSetDimension:ALDimensionWidth toSize:120];
    [self.getCodeButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.phoneTextField];
    [self.getCodeButton autoMatchDimension:ALDimensionHeight toDimension:ALDimensionHeight ofView:self.phoneTextField];
    
    [self.validateButton autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.phoneTextField];
    [self.validateButton autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.getCodeButton];
    [self.validateButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.phoneTextField withOffset:35];
    [self.validateButton autoSetDimension:ALDimensionHeight toSize:JCellHeight];
}

- (UITextField *)phoneTextField {
    if (!_phoneTextField) {
        _phoneTextField = [UITextField newAutoLayoutView];
        _phoneTextField.layer.borderColor = JLightGrayColor9.CGColor;
        _phoneTextField.font = JFont4;
        _phoneTextField.layer.borderWidth = 0.5;
        _phoneTextField.layer.cornerRadius = 3;
        _phoneTextField.backgroundColor = JWhiteColor;
        _phoneTextField.leftViewMode = UITextFieldViewModeAlways;
        _phoneTextField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, JBigSpacing, 0)];
        
        _phoneTextField.placeholder = @"请输入手机验证码";
        
        JWeakSelf;
        [_phoneTextField.rac_textSignal subscribeNext:^(NSString *text) {
            if (weakself.item.didEditing) {
                weakself.item.didEditing(text);
            }
        }];
    }
    return _phoneTextField;
}

- (UIButton *)getCodeButton {
    if (!_getCodeButton) {
        _getCodeButton = [UIButton newAutoLayoutView];
        _getCodeButton.titleLabel.font = JFont5;
        [_getCodeButton setTitleColor:JWhiteColor forState:0];

        JWeakSelf;
        [_getCodeButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(11);
            }
        }];
    }
    return _getCodeButton;
}

- (UIButton *)validateButton {
    if (!_validateButton) {
        _validateButton = [UIButton newAutoLayoutView];
        [_validateButton setTitle:@"验证" forState:0];
        [_validateButton setTitleColor:JWhiteColor forState:0];
        _validateButton.backgroundColor = JOrangeColor1;
        _validateButton.titleLabel.font = JFont7;
        
        JWeakSelf;
        [_validateButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(12);
            }
        }];
    }
    return _validateButton;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.phoneTextField.placeholder = @"请输入手机验证码";
        
    JWeakSelf;
    [[RACObserve(self.item, timeString) takeUntil:[self rac_prepareForReuseSignal]] subscribeNext:^(NSString *time) {
        if ([time containsString:@"获取"]) {
            [weakself.getCodeButton setTitle:@"获取验证码" forState:0];
            weakself.getCodeButton.backgroundColor = JOrangeColor1;
            weakself.getCodeButton.userInteractionEnabled = YES;
        }else{
            NSString *sdsd = [NSString stringWithFormat:@"已发送  %@s",time];
            [weakself.getCodeButton setTitle:sdsd forState:0];
            weakself.getCodeButton.backgroundColor = JLightGrayColor7;
            weakself.getCodeButton.userInteractionEnabled = NO;
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
