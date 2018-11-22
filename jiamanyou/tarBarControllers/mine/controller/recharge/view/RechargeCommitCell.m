//
//  RechargeCommitCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/8.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "RechargeCommitCell.h"

@implementation RechargeCommitCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 90;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = JSeparatorInset1;
    self.backgroundColor = JBackGroundColor;
    
    [self.contentView addSubview:self.commitButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.commitButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:JMiddleSpacing];
    [self.commitButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:JMiddleSpacing];
    [self.commitButton autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [self.commitButton autoSetDimension:ALDimensionHeight toSize:45];
}

- (UIButton *)commitButton {
    if (!_commitButton) {
        _commitButton = [UIButton newAutoLayoutView];
        [_commitButton setTitleColor:JWhiteColor forState:0];
        _commitButton.titleLabel.font = JFont7;
        _commitButton.backgroundColor = JOrangeColor1;
        
        JWeakSelf;
        [_commitButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(88);
            }
        }];
    }
    return _commitButton;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    [self.commitButton setTitle:self.item.commitString forState:0];
    
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
