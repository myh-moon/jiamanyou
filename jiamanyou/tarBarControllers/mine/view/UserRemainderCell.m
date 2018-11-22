//
//  UserRemainderCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/6.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "UserRemainderCell.h"

@implementation UserRemainderCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 85;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = JSeparatorInset1;
    self.backgroundColor = JWhiteColor;
    
    [self.contentView addSubview:self.remainderLabel];
    [self.contentView addSubview:self.withdrawButton];
    [self.contentView addSubview:self.rechargeButton];
    
    [self setNeedsUpdateConstraints];
}


- (void)layoutCellConstraints {
    [self.remainderLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:JMiddleSpacing];
    [self.remainderLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    NSArray *views = @[self.withdrawButton,self.rechargeButton];
    [views autoSetViewsDimensionsToSize:CGSizeMake(75, 30)];
    [views autoAlignViewsToAxis:ALAxisHorizontal];
    [[views firstObject] autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.remainderLabel];
    
    [self.withdrawButton autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:self.rechargeButton withOffset:-JSmallSpacing];
    [self.rechargeButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:JMiddleSpacing];
    
}

- (UILabel *)remainderLabel {
    if (!_remainderLabel) {
        _remainderLabel = [UILabel newAutoLayoutView];
        _remainderLabel.numberOfLines = 0;
    }
    return _remainderLabel;
}

- (UIButton *)withdrawButton {
    if (!_withdrawButton) {
        _withdrawButton = [UIButton newAutoLayoutView];
        _withdrawButton.backgroundColor = JWhiteColor;
        _withdrawButton.layer.cornerRadius = 4;
        _withdrawButton.layer.borderColor = JRedColor.CGColor;
        _withdrawButton.layer.borderWidth = 1;
        [_withdrawButton setTitle:@"提现" forState:0];
        [_withdrawButton setTitleColor:JRedColor forState:0];
        _withdrawButton.titleLabel.font = JFont5;
        
        JWeakSelf;
        [_withdrawButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(33);
            }
        }];
    }
    return _withdrawButton;
}

- (UIButton *)rechargeButton {
    if (!_rechargeButton) {
        _rechargeButton = [UIButton newAutoLayoutView];
        _rechargeButton.backgroundColor = JRedColor;
        _rechargeButton.layer.cornerRadius = 4;
        [_rechargeButton setTitle:@"充值" forState:0];
        [_rechargeButton setTitleColor:JWhiteColor forState:0];
        _rechargeButton.titleLabel.font = JFont5;
        
        JWeakSelf;
        [_rechargeButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(34);
            }
        }];
    }
    return _rechargeButton;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.remainderLabel.attributedText = [NSString setAttributeOfFirstString:@"可用余额(元)\n" firstFont:JFont5 firstColor:JBlackColor1 secondString:@"12345.78" secondFont:JFont20 secondColor:JRedColor align:0 space:JSmallSpacing];
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
