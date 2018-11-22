//
//  SeperateCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/2.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "SeperateCell.h"

@implementation SeperateCell

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.backgroundColor = JBackGroundColor;
    self.separatorInset = JSeparatorInset1;
}

- (void)layoutCellConstraints {
    
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
