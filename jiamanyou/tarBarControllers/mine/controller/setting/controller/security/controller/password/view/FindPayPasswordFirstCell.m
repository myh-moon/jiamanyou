//
//  FindPayPasswordFirstCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/11/15.
//  Copyright © 2018 jiamanyou. All rights reserved.
//

#import "FindPayPasswordFirstCell.h"

@implementation FindPayPasswordFirstCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 200;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = JSeparatorInset1;
    self.backgroundColor = JBackGroundColor;
    
    [self.contentView addSubview:self.cardTextField];
    [self.contentView addSubview:self.validateButton];
}

- (void)layoutCellConstraints {
    [self.cardTextField autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:JMiddleSpacing];
    [self.cardTextField autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:JMiddleSpacing];
    [self.cardTextField autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:JMiddleSpacing];
    [self.cardTextField autoSetDimension:ALDimensionHeight toSize:45];
    
    [self.validateButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:JMiddleSpacing];
    [self.validateButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:JMiddleSpacing];
    [self.validateButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.cardTextField withOffset:35];
    [self.validateButton autoSetDimension:ALDimensionHeight toSize:JCellHeight];
}

- (UITextField *)cardTextField {
    if (!_cardTextField) {
        _cardTextField = [UITextField newAutoLayoutView];
        _cardTextField.layer.borderColor = JLightGrayColor9.CGColor;
        _cardTextField.font = JFont4;
        _cardTextField.layer.borderWidth = 0.5;
        _cardTextField.layer.cornerRadius = 3;
        _cardTextField.backgroundColor = JWhiteColor;
        _cardTextField.leftViewMode = UITextFieldViewModeAlways;
        _cardTextField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, JBigSpacing, 0)];
        
        _cardTextField.placeholder = @"请输入您的身份证号";

        
        JWeakSelf;
        [_cardTextField.rac_textSignal subscribeNext:^(NSString *text) {
            if (weakself.item.didEditing) {
                weakself.item.didEditing(text);
            }
        }];
    }
    return _cardTextField;
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
