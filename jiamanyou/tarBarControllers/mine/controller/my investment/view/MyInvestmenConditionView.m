//
//  MyInvestmenConditionView.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/6.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "MyInvestmenConditionView.h"

#define orangeW 29
#define orangeW1 44


@implementation MyInvestmenConditionView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = JWhiteColor;
        
        [self addSubview:self.allButton];
        [self addSubview:self.investingButton];
        [self addSubview:self.completedButton];
        [self addSubview:self.backingButton];
        [self addSubview:self.orangeLabel];
        
        [self setNeedsUpdateConstraints];
        
        self.leftOrangeConstraints = [self.orangeLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:(JWindowWidth/4-orangeW)/2];
        self.widthOrangeConstraints = [self.orangeLabel autoSetDimension:ALDimensionWidth toSize:orangeW];
    }
    return self;
}

- (void)updateConstraints {
    if (!self.didSetupConstraonts) {
        
        NSArray *views = @[self.allButton,self.investingButton,self.completedButton,self.backingButton];
        [views autoDistributeViewsAlongAxis:ALAxisHorizontal alignedTo:ALAttributeHorizontal withFixedSize:JWindowWidth/4];
        
        [self.allButton autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [self.allButton autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        
        [self.orangeLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom];
//        [self.orangeLabel autoSetDimensionsToSize:CGSizeMake(30, 3)];
        [self.orangeLabel autoSetDimension:ALDimensionHeight toSize:3];
        
        self.didSetupConstraonts = YES;
    }
    [super updateConstraints];
}

- (UIButton *)allButton {
    if (!_allButton) {
        _allButton = [UIButton newAutoLayoutView];
        _allButton.titleLabel.font = JFont5;
        [_allButton setTitleColor:JOrangeColor1 forState:0];
        [_allButton setTitle:@"全部" forState:0];
        
        JWeakSelf;
        [_allButton addAction:^(UIButton *btn) {
            
            //1.颜色改变
            [btn setTitleColor:JOrangeColor1 forState:0];
            [weakself.investingButton setTitleColor:JLightGrayColor forState:0];
            [weakself.completedButton setTitleColor:JLightGrayColor forState:0];
            [weakself.backingButton setTitleColor:JLightGrayColor forState:0];

            //滑动条改变位置
            weakself.leftOrangeConstraints.constant = (JWindowWidth/4-orangeW)/2;
            weakself.widthOrangeConstraints.constant = orangeW;
            
            if (weakself.didSelectedBtn) {
                weakself.didSelectedBtn(555);
            }
        }];
    }
    return _allButton;
}

- (UIButton *)investingButton {
    if (!_investingButton) {
        _investingButton = [UIButton newAutoLayoutView];
        _investingButton.titleLabel.font = JFont5;
        [_investingButton setTitleColor:JLightGrayColor forState:0];
        [_investingButton setTitle:@"投资中" forState:0];
        
        JWeakSelf;
        [_investingButton addAction:^(UIButton *btn) {
            
            //1.颜色改变
            [btn setTitleColor:JOrangeColor1 forState:0];
            [weakself.allButton setTitleColor:JLightGrayColor forState:0];
            [weakself.completedButton setTitleColor:JLightGrayColor forState:0];
            [weakself.backingButton setTitleColor:JLightGrayColor forState:0];
            
            //滑动条改变位置
            weakself.leftOrangeConstraints.constant = (JWindowWidth/4-orangeW1)/2 + JWindowWidth/4;
            weakself.widthOrangeConstraints.constant = orangeW1;

            if (weakself.didSelectedBtn) {
                weakself.didSelectedBtn(556);
            }
        }];
        
    }
    return _investingButton;
}

- (UIButton *)completedButton {
    if (!_completedButton) {
        _completedButton = [UIButton newAutoLayoutView];
        _completedButton.titleLabel.font = JFont5;
        [_completedButton setTitleColor:JLightGrayColor forState:0];
        [_completedButton setTitle:@"已回款" forState:0];
        
        JWeakSelf;
        [_completedButton addAction:^(UIButton *btn) {
            
            //1.颜色改变
            [btn setTitleColor:JOrangeColor1 forState:0];
            [weakself.allButton setTitleColor:JLightGrayColor forState:0];
            [weakself.investingButton setTitleColor:JLightGrayColor forState:0];
            [weakself.backingButton setTitleColor:JLightGrayColor forState:0];
            
            //滑动条改变位置
            weakself.leftOrangeConstraints.constant = (JWindowWidth/4-orangeW1)/2 + JWindowWidth/2;
            weakself.widthOrangeConstraints.constant = orangeW1;
            
            if (weakself.didSelectedBtn) {
                weakself.didSelectedBtn(557);
            }
        }];
    }
    return _completedButton;
}

- (UIButton *)backingButton {
    if (!_backingButton) {
        _backingButton = [UIButton newAutoLayoutView];
        _backingButton.titleLabel.font = JFont5;
        [_backingButton setTitleColor:JLightGrayColor forState:0];
        [_backingButton setTitle:@"回款中" forState:0];
        
        JWeakSelf;
        [_backingButton addAction:^(UIButton *btn) {
            
            //1.颜色改变
            [btn setTitleColor:JOrangeColor1 forState:0];
            [weakself.allButton setTitleColor:JLightGrayColor forState:0];
            [weakself.completedButton setTitleColor:JLightGrayColor forState:0];
            [weakself.completedButton setTitleColor:JLightGrayColor forState:0];
            
            //滑动条改变位置
            weakself.leftOrangeConstraints.constant = (JWindowWidth/4-orangeW1)/2 + JWindowWidth * 3/4;
            weakself.widthOrangeConstraints.constant = orangeW1;
            
            if (weakself.didSelectedBtn) {
                weakself.didSelectedBtn(558);
            }
        }];
        
    }
    return _backingButton;
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
