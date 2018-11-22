//
//  WithdrawMoneyCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/8.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "WithdrawMoneyCell.h"

@implementation WithdrawMoneyCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 45;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = JSeparatorInset1;
    self.backgroundColor = JBackGroundColor;
    
    [self.contentView addSubview:self.moneyLabel];
    [self.contentView addSubview:self.withdrawButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.moneyLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:JMiddleSpacing];
    [self.moneyLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    [self.withdrawButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:JMiddleSpacing];
    [self.withdrawButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.moneyLabel];
    [self.withdrawButton autoSetDimensionsToSize:CGSizeMake(70, 23)];
    
}

- (UILabel *)moneyLabel {
    if (!_moneyLabel) {
        _moneyLabel = [UILabel newAutoLayoutView];
    }
    return _moneyLabel;
}

- (UIButton *)withdrawButton {
    if (!_withdrawButton) {
        _withdrawButton = [UIButton newAutoLayoutView];
        [_withdrawButton setTitle:@"全部提现" forState:0];
        [_withdrawButton setTitleColor:JOrangeColor1 forState:0];
        _withdrawButton.titleLabel.font = JFont3;
        _withdrawButton.layer.cornerRadius = 11.5;
        _withdrawButton.layer.masksToBounds = YES;
        
        JWeakSelf;
        [_withdrawButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(66);
            }
        }];
    }
    return _withdrawButton;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.moneyLabel.attributedText = [NSString setAttributeOfFirstString:@"可提现金额" firstFont:JFont3 firstColor:JLightGrayColor6 secondString:@"123455.77" secondFont:JFont3 secondColor:JOrangeColor1 thirdString:@"元" thirdFont:JFont3 thirdColor:JLightGrayColor6];
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
