//
//  CardCommitCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/7.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "CardCommitCell.h"

@implementation CardCommitCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 80;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = JSeparatorInset1;
    self.backgroundColor = JBackGroundColor;
    
    [self.contentView addSubview:self.commitButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.commitButton autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, JMiddleSpacing, 0, JMiddleSpacing) excludingEdge:ALEdgeTop];
    [self.commitButton autoSetDimension:ALDimensionHeight toSize:45];
}

- (UIButton *)commitButton {
    if (!_commitButton) {
        _commitButton = [UIButton newAutoLayoutView];
        [_commitButton setTitle:@"确认提交" forState:0];
        _commitButton.titleLabel.font = JFont7;
        [_commitButton setTitleColor:JWhiteColor forState:0];
        _commitButton.backgroundColor = JLightGrayColor7;
        
        JWeakSelf;
        [_commitButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(12);
            }
        }];
    }
    return _commitButton;
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
