//
//  RechargeMoneyCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/8.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "RechargeMoneyCell.h"

@implementation RechargeMoneyCell
+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 40;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = JSeparatorInset1;
    self.backgroundColor = JBackGroundColor;
    
    [self.contentView addSubview:self.moneyLabel];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.moneyLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:JMiddleSpacing];
    [self.moneyLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
}

- (UILabel *)moneyLabel {
    if (!_moneyLabel) {
        _moneyLabel = [UILabel newAutoLayoutView];
    }
    return _moneyLabel;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.moneyLabel.attributedText = [NSString setAttributeOfFirstString:@"可投金额  " firstFont:JFont3 firstColor:JLightGrayColor6 secondString:@"123456.00" secondFont:JFont3 secondColor:JOrangeColor1 thirdString:@"  元" thirdFont:JFont3 thirdColor:JLightGrayColor6];
    
    
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
