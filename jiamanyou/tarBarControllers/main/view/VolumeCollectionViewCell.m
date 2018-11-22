//
//  VolumeCollectionViewCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/9.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "VolumeCollectionViewCell.h"

@implementation VolumeCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self.contentView addSubview:self.showLabel];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.showLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [self.showLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UILabel *)showLabel {
    if (!_showLabel) {
        _showLabel = [UILabel newAutoLayoutView];
        _showLabel.backgroundColor = JRedColor;
    }
    return _showLabel;
}

@end
