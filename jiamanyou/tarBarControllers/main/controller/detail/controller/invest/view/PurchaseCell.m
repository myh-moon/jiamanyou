//
//  PurchaseCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/3.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "PurchaseCell.h"

@implementation PurchaseCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 120;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = JSeparatorInset1;
    self.backgroundColor = JBackGroundColor;
    
    [self.contentView addSubview:self.purchaseButton];
    [self.contentView addSubview:self.agreementButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.purchaseButton autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(JBigSpacing, JMiddleSpacing, 0, JMiddleSpacing) excludingEdge:ALEdgeBottom];
    [self.purchaseButton autoSetDimension:ALDimensionHeight toSize:45];
    
    [self.agreementButton autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.purchaseButton];
    [self.agreementButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.purchaseButton withOffset:JMiddleSpacing];
}

- (UIButton *)purchaseButton {
    if (!_purchaseButton) {
        _purchaseButton = [UIButton newAutoLayoutView];
//        _purchaseButton.backgroundColor = JLightGrayColor7;
                _purchaseButton.backgroundColor = JOrangeColor1;
        [_purchaseButton setTitle:@"立即购买" forState:0];
        [_purchaseButton setTitleColor:JWhiteColor forState:0];
        _purchaseButton.titleLabel.font = JFont7;
    }
    return _purchaseButton;
}

- (UIButton *)agreementButton {
    if (!_agreementButton) {
        _agreementButton = [UIButton newAutoLayoutView];
        
        NSMutableAttributedString *agree = [NSString setAttributeOfFirstString:@"已阅读并同意" firstFont:JFont3 firstColor:JLightGrayColor secondString:@"《伽满优服务协议》" secondFont:JFont3 secondColor:JOrangeColor1];
        [self.agreementButton setAttributedTitle:agree forState:0];
    }
    return _agreementButton;
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
