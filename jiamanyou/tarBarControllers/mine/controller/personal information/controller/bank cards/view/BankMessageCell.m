//
//  BankMessageCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/7.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "BankMessageCell.h"

@implementation BankMessageCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
//    return 214;
//    37
    
    return 37*2 + 14 * (JWindowWidth-JBigSpacing*2)/33;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = JSeparatorInset1;
    self.backgroundColor = JBackGroundColor;
    
    [self.contentView addSubview:self.bankBackImageView];
    [self.bankBackImageView addSubview:self.bankNameButton];
    [self.bankBackImageView addSubview:self.bankNumberLabel];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    
    //        [self.bankBackImageView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:JBigSpacing];
    //        [self.bankBackImageView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:JBigSpacing];
    //        [self.bankBackImageView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    //        [self.bankBackImageView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    //        [self.bankBackImageView autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [self.bankBackImageView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(37, JBigSpacing, 37, JBigSpacing)];
    
    [self.bankNameButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:JBigSpacing];
    [self.bankNameButton autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:JBigSpacing];
    
    [self.bankNumberLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.bankNameButton withOffset:46.5];
    [self.bankNumberLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.bankNameButton withOffset:25];
}

- (UIImageView *)bankBackImageView {
    if (!_bankBackImageView) {
        _bankBackImageView = [UIImageView newAutoLayoutView];
        _bankBackImageView.layer.cornerRadius = 10;
        _bankBackImageView.layer.masksToBounds = YES;
        _bankBackImageView.backgroundColor = JRedColor;
    }
    return _bankBackImageView;
}

- (UIButton *)bankNameButton {
    if (!_bankNameButton) {
        _bankNameButton = [UIButton newAutoLayoutView];
        _bankNameButton.titleLabel.numberOfLines = 0;
    }
    return _bankNameButton;
}

- (UILabel *)bankNumberLabel {
    if (!_bankNumberLabel) {
        _bankNumberLabel = [UILabel newAutoLayoutView];
//        _bankNumberLabel.textColor = JWhiteColor;
//        _bankNumberLabel.font = [UIFont systemFontOfSize:18];
        _bankNumberLabel.backgroundColor = JOrangeColor1;
    }
    return _bankNumberLabel;
}


- (void)cellWillAppear {
    [super cellWillAppear];
    
    NSMutableAttributedString *name = [NSString setAttributeOfFirstString:@"中国交通银行\n" firstFont:JFont5 firstColor:JWhiteColor secondString:@"储蓄卡" secondFont:JFont2 secondColor:JWhiteColor align:0 space:2];
    [self.bankNameButton setAttributedTitle:name forState:0];
    
//    self.bankNumberLabel.text = @"···· ···  1234  1234  1234";
    
//    self.bankNumberLabel.attributedText = [NSString setAttributeOfFirstString:@"···· ···· ···" firstFont:[UIFont systemFontOfSize:40] firstColor:JWhiteColor secondString:@"1234" secondFont:JFont8 secondColor:JWhiteColor];
    
    NSString *firstString = @"···· ···· ···";
    NSString *secondString = @"1234";
    NSString *str = [NSString stringWithFormat:@"%@%@",firstString,secondString];
    NSMutableAttributedString *setAttributeString = [[NSMutableAttributedString alloc] initWithString:str];
    
    [setAttributeString addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:40],NSForegroundColorAttributeName:JWhiteColor} range:NSMakeRange(0, firstString.length)];
    [setAttributeString addAttributes:@{NSFontAttributeName:JFont8,NSForegroundColorAttributeName:JWhiteColor} range:NSMakeRange(firstString.length, secondString.length)];
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.maximumLineHeight = 40;
    [setAttributeString addAttributes:@{NSParagraphStyleAttributeName:style} range:NSMakeRange(0, firstString.length+secondString.length)];

    self.bankNumberLabel.attributedText = setAttributeString;
    
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
