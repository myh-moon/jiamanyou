//
//  UserCenterCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/3.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "UserCenterCell.h"

@implementation UserCenterCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 218;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset  =JSeparatorInset1;
    self.backgroundColor = JBlackColor;
    
    [self.contentView addSubview:self.userHeadButton];
    [self.contentView addSubview:self.userNickButton];
    [self.contentView addSubview:self.settingButton];
    [self.contentView addSubview:self.assetsButton];
    [self.contentView addSubview:self.dailyProfitButton];
    [self.contentView addSubview:self.totalProfitButton];

    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    NSArray *views = @[self.userHeadButton,self.userNickButton,self.settingButton];
    [views autoAlignViewsToAxis:ALAxisHorizontal];
    
    [self.userHeadButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:JMiddleSpacing];
    [self.userHeadButton autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:25];
    [self.userHeadButton autoSetDimensionsToSize:CGSizeMake(32, 32)];
    
    [self.userNickButton autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.userHeadButton withOffset:JBigSpacing];
    
    [self.settingButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:JMiddleSpacing];
    
    [self.assetsButton autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.userHeadButton];
    [self.assetsButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.userHeadButton withOffset:25];
    
    [self.dailyProfitButton autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.assetsButton];
    [self.dailyProfitButton autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:JBigSpacing];
    
    [self.totalProfitButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.dailyProfitButton];
    [self.totalProfitButton autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.dailyProfitButton withOffset:JBigSpacing];
}

- (UIButton *)userHeadButton {
    if (!_userHeadButton) {
        _userHeadButton = [UIButton newAutoLayoutView];
        _userHeadButton.layer.cornerRadius = 16;
        _userHeadButton.layer.masksToBounds = YES;
        _userHeadButton.backgroundColor = JRedColor;
        
        JWeakSelf;
        [_userHeadButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(92);
            }
        }];
    }
    return _userHeadButton;
}

- (UIButton *)userNickButton {
    if (!_userNickButton) {
        _userNickButton = [UIButton newAutoLayoutView];
        [_userNickButton setTitleColor:JLightGrayColor forState:0];
        _userNickButton.titleLabel.font = JFont2;
        
        JWeakSelf;
        [_userNickButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(92);
            }
        }];
    }
    return _userNickButton;
}

- (UIButton *)settingButton {
    if (!_settingButton) {
        _settingButton = [UIButton newAutoLayoutView];
        [_settingButton setTitle:@"设置" forState:0];
        
        JWeakSelf;
        [_settingButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(93);
            }
        }];
    }
    return _settingButton;
}

- (UIButton *)assetsButton {
    if (!_assetsButton) {
        _assetsButton = [UIButton newAutoLayoutView];
        _assetsButton.titleLabel.numberOfLines = 0;
        
        JWeakSelf;
        [_assetsButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(94);
            }
        }];
    }
    return _assetsButton;
}

- (UIButton *)dailyProfitButton {
    if (!_dailyProfitButton) {
        _dailyProfitButton  = [UIButton newAutoLayoutView];
        
        JWeakSelf;
        [_dailyProfitButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(95);
            }
        }];
    }
    return _dailyProfitButton;
}

- (UIButton *)totalProfitButton {
    if (!_totalProfitButton) {
        _totalProfitButton = [UIButton newAutoLayoutView];
        
        JWeakSelf;
        [_totalProfitButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(96);
            }
        }];
    }
    return _totalProfitButton;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    [self.userNickButton setTitle:@"用户名用户名" forState:0];
    
    NSMutableAttributedString *assets = [NSString setAttributeOfFirstString:@"资产总额(元)\n" firstFont:JFont2 firstColor:JLightGrayColor8 secondString:@"12,397.00" secondFont:[UIFont systemFontOfSize:32] secondColor:JWhiteColor align:0 space:JSmallSpacing];
    [self.assetsButton setAttributedTitle:assets forState:0];

    NSMutableAttributedString *sdsd = [NSString setAttributeOfFirstString:@"昨日收益(元)   " firstFont:JFont4 firstColor:JLightGrayColor8 secondString:@"1.02" secondFont:JFont7 secondColor:JWhiteColor];
    [self.dailyProfitButton setAttributedTitle:sdsd forState:0];
    
    NSMutableAttributedString *total = [NSString setAttributeOfFirstString:@"累计收益(元)   " firstFont:JFont4 firstColor:JLightGrayColor8 secondString:@"68.50" secondFont:JFont7 secondColor:JWhiteColor];
    [self.totalProfitButton setAttributedTitle:total forState:0];
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
