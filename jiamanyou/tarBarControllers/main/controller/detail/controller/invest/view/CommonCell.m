//
//  CommonCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/3.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "CommonCell.h"

@implementation CommonCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 50;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    [self.contentView addSubview:self.leftButton];
    [self.contentView addSubview:self.rightButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.leftButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:JMiddleSpacing];
    [self.leftButton autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    [self.rightButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:JMiddleSpacing];
    [self.rightButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.leftButton];
}

- (UIButton *)leftButton {
    if (!_leftButton) {
        _leftButton = [UIButton newAutoLayoutView];
        [_leftButton setTitleColor:JBlackColor1 forState:0];
        _leftButton.titleLabel.font = JFont5;
    }
    return _leftButton;
}

- (UIButton *)rightButton {
    if (!_rightButton) {
        _rightButton = [UIButton newAutoLayoutView];
        [_rightButton setTitleColor:JLightGrayColor forState:0];
        _rightButton.titleLabel.font = JFont5;
        [_rightButton swapImage];
    }
    return _rightButton;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    if (self.item.sepeTag == 0) {
        self.separatorInset = JSeparatorInset1;
    }else if(self.item.sepeTag == 1){
        self.separatorInset = JSeparatorInset2;
    }else if(self.item.sepeTag == 2){
        self.separatorInset = JSeparatorInset3;
    }else{
        self.separatorInset = UIEdgeInsetsZero;
    }
    
    [self.leftButton setTitle:self.item.leftString forState:0];
    [self.rightButton setTitle:self.item.rightString forState:0];
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
