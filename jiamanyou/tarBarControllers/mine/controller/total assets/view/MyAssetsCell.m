//
//  MyAssetsCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/6.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "MyAssetsCell.h"

@implementation MyAssetsCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 98;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.backgroundColor = JWhiteColor;
    self.separatorInset = UIEdgeInsetsZero;
    
    [self.contentView addSubview:self.assetsLabel];
    
    [self setNeedsUpdateConstraints];
}


- (void)layoutCellConstraints {
    [self.assetsLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:JMiddleSpacing];
    [self.assetsLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
}

- (UILabel *)assetsLabel {
    if (!_assetsLabel) {
        _assetsLabel = [UILabel newAutoLayoutView];
        _assetsLabel.numberOfLines = 0;
    }
    return _assetsLabel;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.assetsLabel.attributedText = [NSString setAttributeOfFirstString:@"总资产(元)\n" firstFont:JFont4 firstColor:JBlackColor1 secondString:@"12,397.00" secondFont:[UIFont systemFontOfSize:32] secondColor:JBlackColor1 align:0 space:JMiddleSpacing];
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
