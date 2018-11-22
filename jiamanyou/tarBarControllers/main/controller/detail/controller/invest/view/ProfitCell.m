//
//  ProfitCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/3.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "ProfitCell.h"

@implementation ProfitCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return JCellHeight;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.backgroundColor = JBackGroundColor;
    
    self.separatorInset = JSeparatorInset1;
    
    [self.contentView addSubview:self.profitLabel];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.profitLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [self.profitLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
}

- (UILabel *)profitLabel {
    if (!_profitLabel) {
        _profitLabel = [UILabel newAutoLayoutView];
    }
    return _profitLabel;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.profitLabel.attributedText = [NSString setAttributeOfFirstString:@"预计可得收益  " firstFont:JFont3 firstColor:JLightGrayColor6 secondString:@"0.00" secondFont:JFont3 secondColor:JOrangeColor1 thirdString:@"  元" thirdFont:JFont3 thirdColor:JLightGrayColor6];
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
