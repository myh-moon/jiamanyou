//
//  NoteCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/2.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "NoteCell.h"

@implementation NoteCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 50;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = JSeparatorInset1;
    self.backgroundColor = JBackGroundColor;
    
    [self.contentView addSubview:self.noteLabel];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.noteLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [self.noteLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
}

- (UILabel *)noteLabel {
    if (!_noteLabel) {
        _noteLabel = [UILabel newAutoLayoutView];
        _noteLabel.textColor = JLightGrayColor;
        _noteLabel.text = @"--- 产品说明 ---";
        _noteLabel.font = JFont5;
    }
    return _noteLabel;
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
