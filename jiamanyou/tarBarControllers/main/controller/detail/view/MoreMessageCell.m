//
//  MoreMessageCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/3.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "MoreMessageCell.h"

@implementation MoreMessageCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 50;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = JSeparatorInset1;
    
    [self.contentView addSubview:self.moreButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.moreButton autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [self.moreButton autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
}

- (UIButton *)moreButton {
    if (!_moreButton) {
        _moreButton = [UIButton newAutoLayoutView];
        [_moreButton setTitle:@"查看更多资料" forState:0];
        _moreButton.titleLabel.font = JFont3;
        [_moreButton setTitleColor:JOrangeColor1 forState:0];
        _moreButton.userInteractionEnabled = NO;
    }
    return _moreButton;
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
