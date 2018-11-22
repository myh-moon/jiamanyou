//
//  ProductInvestView.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/3.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "ProductInvestView.h"

@implementation ProductInvestView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self addSubview:self.calculateButton];
        [self addSubview:self.investButton];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.calculateButton autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self];
        [self.calculateButton autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self];
        [self.calculateButton autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self];
        [self.calculateButton autoSetDimension:ALDimensionWidth toSize:94];
        
        [self.investButton autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self];
        [self.investButton autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self];
        [self.investButton autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self];
        [self.investButton autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.calculateButton];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UIButton *)calculateButton {
    if (!_calculateButton) {
        _calculateButton = [UIButton newAutoLayoutView];
//        _calculateButton.backgroundColor = JRedColor;
        
        JWeakSelf;
        [_calculateButton addAction:^(UIButton *btn) {
            if (weakself.didSelectedAction) {
                weakself.didSelectedAction(111);
            }
        }];
    }
    return _calculateButton;
}

- (UIButton *)investButton {
    if (!_investButton) {
        _investButton = [UIButton newAutoLayoutView];
        [_investButton setTitle:@"立即投标" forState:0];
        [_investButton setTitleColor:JWhiteColor forState:0];
        _investButton.titleLabel.font = JFont9;
        _investButton.backgroundColor = JOrangeColor1;
        
        JWeakSelf;
        [_investButton addAction:^(UIButton *btn) {
            if (weakself.didSelectedAction) {
                weakself.didSelectedAction(112);
            }
        }];
    }
    return _investButton;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
