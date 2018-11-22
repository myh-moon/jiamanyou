//
//  WithdrawResultCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/8.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "WithdrawResultCell.h"

@implementation WithdrawResultCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return JWindowHeight - 64;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = JSeparatorInset1;
    self.backgroundColor = JBackGroundColor;
    
    [self.contentView addSubview:self.signImageView];
    [self.contentView addSubview:self.ruleLabel];
    [self.contentView addSubview:self.finishButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    NSArray *views = @[self.signImageView,self.ruleLabel,self.finishButton];
    [views autoAlignViewsToAxis:ALAxisVertical];
    
    [self.signImageView autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [self.signImageView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:150];
    [self.signImageView autoSetDimensionsToSize:CGSizeMake(166, 135)];
    
    [self.ruleLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.signImageView withOffset:JMiddleSpacing];
    
    [self.finishButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.ruleLabel withOffset:60];
    [self.finishButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:JMiddleSpacing];
    [self.finishButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:JMiddleSpacing];
    [self.finishButton autoSetDimension:ALDimensionHeight toSize:45];
    
}

- (UIImageView *)signImageView {
    if (!_signImageView) {
        _signImageView = [UIImageView newAutoLayoutView];
        _signImageView.backgroundColor = JRedColor;
    }
    return _signImageView;
}

- (UILabel *)ruleLabel {
    if (!_ruleLabel) {
        _ruleLabel = [UILabel newAutoLayoutView];
        _ruleLabel.numberOfLines = 0;
    }
    return _ruleLabel;
}

- (UIButton *)finishButton {
    if (!_finishButton) {
        _finishButton = [UIButton newAutoLayoutView];
        [_finishButton setTitle:@"我知道了" forState:0];
        [_finishButton setTitleColor:JWhiteColor forState:0];
        _finishButton.titleLabel.font = JFont7;
        _finishButton.backgroundColor = JOrangeColor1;
        
        JWeakSelf;
        [_finishButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(89);
            }
        }];
    }
    return _finishButton;
}

- (void)cellWillAppear  {
    [super cellWillAppear];
    
    NSString *firstString = @"成功提现  ";
    NSString *secondString = @"120000";
    NSString *thirdString = @"  元\n";
    NSString *fourthString = @"(预计1-2个工作日到账)";
    
    NSString *str = [NSString stringWithFormat:@"%@%@%@%@",firstString,secondString,thirdString,fourthString];
    NSMutableAttributedString *setAttributeString = [[NSMutableAttributedString alloc] initWithString:str];
    
    [setAttributeString addAttributes:@{NSFontAttributeName:JFont7,NSForegroundColorAttributeName:JBlackColor1} range:NSMakeRange(0, firstString.length)];
    [setAttributeString addAttributes:@{NSFontAttributeName:JFont20,NSForegroundColorAttributeName:JOrangeColor1} range:NSMakeRange(firstString.length, secondString.length)];
    [setAttributeString addAttributes:@{NSFontAttributeName:JFont7,NSForegroundColorAttributeName:JBlackColor1} range:NSMakeRange(firstString.length+secondString.length, thirdString.length)];
    [setAttributeString addAttributes:@{NSFontAttributeName:JFont4,NSForegroundColorAttributeName:JBlackColor1} range:NSMakeRange(firstString.length+secondString.length+thirdString.length, fourthString.length)];

    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = JSmallSpacing;
    style.alignment = 1;
    
    [setAttributeString addAttributes:@{NSParagraphStyleAttributeName:style} range:NSMakeRange(0, str.length)];
    
    self.ruleLabel.attributedText = setAttributeString;
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
