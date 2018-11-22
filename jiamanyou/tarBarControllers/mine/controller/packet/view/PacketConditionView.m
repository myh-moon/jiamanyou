//
//  PacketConditionView.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/6.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "PacketConditionView.h"
#define orangeW 58
@implementation PacketConditionView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = JWhiteColor;
        
        [self addSubview:self.validButton];
        [self addSubview:self.invalidButton];
        [self addSubview:self.lineLabel];
        
        [self addSubview:self.orangeLabel];
        
        [self setNeedsUpdateConstraints];
        
        self.leftOrangeConstraints = [self.orangeLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self withOffset:(JWindowWidth/2-orangeW)/2];
    }
    return self;
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        NSArray *views = @[self.validButton,self.invalidButton];
        [views autoSetViewsDimension:ALDimensionWidth toSize:JWindowWidth/2];
        
        [self.validButton autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self];
        [self.validButton autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self];
        [self.validButton autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self];
        
        [self.invalidButton autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self];
        [self.invalidButton autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self];
        [self.invalidButton autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self];
        
        [self.lineLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.validButton];
        [self.lineLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.validButton];
        [self.lineLabel autoSetDimensionsToSize:CGSizeMake(0.5, 16)];
        
        [self.orangeLabel autoSetDimensionsToSize:CGSizeMake(30, 3)];
        [self.orangeLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UIButton *)validButton {
    if (!_validButton) {
        _validButton = [UIButton newAutoLayoutView];
        [_validButton setTitle:@"可用红包" forState:0];
        _validButton.titleLabel.font = JFont5;
        [_validButton setTitleColor:JOrangeColor1 forState:0];
        
        JWeakSelf;
        [_validButton addAction:^(UIButton *btn) {
            [btn setTitleColor:JOrangeColor1 forState:0];
            [weakself.invalidButton setTitleColor:JBlackColor1 forState:0];
            
            weakself.leftOrangeConstraints.constant = (JWindowWidth/2-orangeW)/2;
            
            
            if (weakself.didSelectedBtn) {
                weakself.didSelectedBtn(333);
            }
        }];
    }
    return _validButton;
}

- (UIButton *)invalidButton {
    if (!_invalidButton) {
        _invalidButton = [UIButton newAutoLayoutView];
        [_invalidButton setTitle:@"历史红包" forState:0];
        _invalidButton.titleLabel.font = JFont5;
        [_invalidButton setTitleColor:JBlackColor1 forState:0];
        
        JWeakSelf;
        [_invalidButton addAction:^(UIButton *btn) {
            [btn setTitleColor:JOrangeColor1 forState:0];
            [weakself.validButton setTitleColor:JBlackColor1 forState:0];
            
            weakself.leftOrangeConstraints.constant = (JWindowWidth/2-orangeW)/2 + JWindowWidth/2;

            if (weakself.didSelectedBtn) {
                weakself.didSelectedBtn(334);
            }
        }];
    }
    return _invalidButton;
}

- (UILabel *)lineLabel {
    if (!_lineLabel) {
        _lineLabel = [UILabel newAutoLayoutView];
        _lineLabel.backgroundColor = JLightGrayColor9;
    }
    return _lineLabel;
}

- (UILabel *)orangeLabel {
    if (!_orangeLabel) {
        _orangeLabel = [UILabel newAutoLayoutView];
        _orangeLabel.backgroundColor = JOrangeColor1;
    }
    return _orangeLabel;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
