//
//  ModifyPayPasswordThirdCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/11/16.
//  Copyright © 2018 jiamanyou. All rights reserved.
//

#import "ModifyPayPasswordThirdCell.h"

@implementation ModifyPayPasswordThirdCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 300;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = JSeparatorInset1;
    self.backgroundColor = JBackGroundColor;
    
    [self.contentView addSubview:self.successImageView];
    [self.contentView addSubview:self.remindLabel];
    [self.contentView addSubview:self.successButton];

    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    NSArray *views = @[self.successImageView,self.remindLabel,self.successButton];
    [views autoAlignViewsToAxis:ALAxisVertical];
    
    [self.successImageView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:80];
    [self.successImageView autoAlignAxisToSuperviewAxis:ALAxisVertical];
    
    
    [self.remindLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.successImageView withOffset:25];
    
    [self.successButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.remindLabel withOffset:65];
    [self.successButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:JMiddleSpacing];
    [self.successButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:JMiddleSpacing];
    [self.successButton autoSetDimension:ALDimensionHeight toSize:JCellHeight];
}

- (UIImageView *)successImageView {
    if (!_successImageView) {
        _successImageView = [UIImageView newAutoLayoutView];
        _successImageView.backgroundColor = JRedColor;
    }
    return _successImageView;
}

- (UILabel *)remindLabel {
    if (!_remindLabel) {
        _remindLabel = [UILabel newAutoLayoutView];
        _remindLabel.text = @"密码已修改完成";
        _remindLabel.textColor = JBlackColor1;
        _remindLabel.font = JFont8;
    }
    return _remindLabel;
}

- (UIButton *)successButton {
    if (!_successButton) {
        _successButton = [UIButton newAutoLayoutView];
        [_successButton setTitle:@"我知道了" forState:0];
        [_successButton setTitleColor:JWhiteColor forState:0];
        _successButton.titleLabel.font = JFont8;
        
        _successButton.backgroundColor = JOrangeColor1;
        
        JWeakSelf;
        [_successButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(12);
            }
        }];
    }
    return _successButton;
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
