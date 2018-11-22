//
//  RechargeCardCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/8.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "RechargeCardCell.h"

@implementation RechargeCardCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 100;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = JSeparatorInset1;
    self.backgroundColor = JWhiteColor;
    
    [self.contentView addSubview:self.cardMessageButton];
    [self.contentView addSubview:self.actButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.cardMessageButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:JMiddleSpacing];
    [self.cardMessageButton autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    [self.actButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.cardMessageButton];
    [self.actButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:JMiddleSpacing];
}

- (UIButton *)cardMessageButton {
    if (!_cardMessageButton) {
        _cardMessageButton = [UIButton newAutoLayoutView];
        _cardMessageButton.titleLabel.numberOfLines = 0;
    }
    return _cardMessageButton;
}

- (UIButton *)actButton {
    if (!_actButton) {
        _actButton = [UIButton newAutoLayoutView];
        [_actButton setImage:[UIImage imageNamed:@""] forState:0];
    }
    return _actButton;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    NSMutableAttributedString *cardMessage = [NSString setAttributeOfFirstString:@"交通银行\n" firstFont:JFont5 firstColor:JBlackColor1 secondString:@"6222 **** **** *** 5197" secondFont:JFont5 secondColor:JLightGrayColor align:0 space:5];
    [self.cardMessageButton setAttributedTitle:cardMessage forState:0];
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
