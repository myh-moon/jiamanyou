//
//  ModifyLoginPasswordTextCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/11/16.
//  Copyright © 2018 jiamanyou. All rights reserved.
//

#import "ModifyLoginPasswordTextCell.h"

@implementation ModifyLoginPasswordTextCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return JCellHeight;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = JSeparatorInset3;
    self.backgroundColor = JBackGroundColor;
    
    [self.contentView addSubview:self.passwordTextField];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.passwordTextField autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:JMiddleSpacing];
    [self.passwordTextField autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:JMiddleSpacing];
    [self.passwordTextField autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
}

- (UITextField *)passwordTextField {
    if (!_passwordTextField) {
        _passwordTextField = [UITextField newAutoLayoutView];
        _passwordTextField.textColor = JLightGrayColor;
        _passwordTextField.font = JFont5;
        
        JWeakSelf;
        [_passwordTextField.rac_textSignal subscribeNext:^(NSString *text) {
            if (weakself.item.didEditing) {
                weakself.item.didEditing(text);
            }
        }];
    }
    return _passwordTextField;
}

- (void)cellWillAppear{
    [super cellWillAppear];
    
    self.passwordTextField.placeholder = self.item.placeHolderString;
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
