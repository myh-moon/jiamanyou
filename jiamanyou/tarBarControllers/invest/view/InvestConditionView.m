//
//  InvestConditionView.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/8.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "InvestConditionView.h"

#define orangeSpace  (JWindowWidth-50*3)/4

@implementation InvestConditionView

- (instancetype)initWithFrame:(CGRect)frame {
    self =  [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = JWhiteColor;
        
        [self addSubview:self.allButton];
        [self addSubview:self.pledgeButton];
        [self addSubview:self.mortgageButton];
        [self addSubview:self.orangeLabel];

        [self setNeedsUpdateConstraints];
        
        
        self.leftOrangeConstraints = [self.orangeLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:orangeSpace];
    }
    return self;
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        NSArray *views = @[self.allButton,self.pledgeButton,self.mortgageButton];
        [views autoDistributeViewsAlongAxis:ALAxisHorizontal alignedTo:ALAttributeHorizontal withFixedSize:50];
        
        [[views firstObject] autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        
        
        [self.orangeLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom];
        [self.orangeLabel autoSetDimensionsToSize:CGSizeMake(50, 2)];
        
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UIButton *)allButton {
    if (!_allButton) {
        _allButton = [UIButton newAutoLayoutView];
        [_allButton setTitle:@"全部" forState:0];
        [_allButton setTitleColor:JOrangeColor1 forState:0];
        _allButton.titleLabel.font = JFont5;
        
        JWeakSelf;
        [_allButton addAction:^(UIButton *btn) {
            
            weakself.leftOrangeConstraints.constant = orangeSpace;
            
            [btn setTitleColor:JOrangeColor1 forState:0];
            [weakself.pledgeButton setTitleColor:JLightGrayColor forState:0];
            [weakself.mortgageButton setTitleColor:JLightGrayColor forState:0];

            if (weakself.didClickBtn) {
                weakself.didClickBtn(45);
            }
        }];
    }
    return _allButton;
}


- (UIButton *)pledgeButton {
    if (!_pledgeButton) {
        _pledgeButton = [UIButton newAutoLayoutView];
        [_pledgeButton setTitle:@"质押标" forState:0];
        [_pledgeButton setTitleColor:JLightGrayColor forState:0];
        _pledgeButton.titleLabel.font = JFont5;
        
        JWeakSelf;
        [_pledgeButton addAction:^(UIButton *btn) {
            
            weakself.leftOrangeConstraints.constant = 50 + orangeSpace * 2;
            
            [btn setTitleColor:JOrangeColor1 forState:0];
            [weakself.allButton setTitleColor:JLightGrayColor forState:0];
            [weakself.mortgageButton setTitleColor:JLightGrayColor forState:0];
            
            if (weakself.didClickBtn) {
                weakself.didClickBtn(46);
            }
        }];
    }
    return _pledgeButton;
}

- (UIButton *)mortgageButton {
    if (!_mortgageButton) {
        _mortgageButton = [UIButton newAutoLayoutView];
        [_mortgageButton setTitle:@"抵押标" forState:0];
        [_mortgageButton setTitleColor:JLightGrayColor forState:0];
        _mortgageButton.titleLabel.font = JFont5;
        
        JWeakSelf;
        [_mortgageButton addAction:^(UIButton *btn) {
            
            weakself.leftOrangeConstraints.constant = orangeSpace * 3 + 50*2;
            
            [btn setTitleColor:JOrangeColor1 forState:0];
            [weakself.allButton setTitleColor:JLightGrayColor forState:0];
            [weakself.pledgeButton setTitleColor:JLightGrayColor forState:0];
            
            if (weakself.didClickBtn) {
                weakself.didClickBtn(47);
            }
        }];
    }
    return _mortgageButton;
}

- (UILabel *)orangeLabel {
    if (!_orangeLabel) {
        _orangeLabel = [UILabel newAutoLayoutView];
        _orangeLabel.backgroundColor = JOrangeColor1;
        _orangeLabel.layer.cornerRadius = 1;
        _orangeLabel.layer.masksToBounds = YES;
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
