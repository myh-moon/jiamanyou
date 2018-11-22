//
//  BaseCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/1.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "BaseCell.h"

@interface BaseCell ()

@property (nonatomic,assign) BOOL didSetupConstraints;

@end

@implementation BaseCell

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        [self layoutCellConstraints];
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
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
