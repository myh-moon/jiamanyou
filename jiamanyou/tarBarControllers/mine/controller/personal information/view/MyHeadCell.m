//
//  MyHeadCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/7.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "MyHeadCell.h"
#import <UIButton+WebCache.h>

@implementation MyHeadCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 50;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.backgroundColor = JWhiteColor;
    self.separatorInset = JSeparatorInset3;
    
    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.headButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:JMiddleSpacing];
    [self.titleLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    [self.headButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:JMiddleSpacing];
    [self.headButton autoSetDimensionsToSize:CGSizeMake(30, 30)];
    [self.headButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.titleLabel];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel newAutoLayoutView];
        _titleLabel.textColor = JBlackColor1;
        _titleLabel.font = JFont5;
        _titleLabel.text = @"头像";
    }
    return _titleLabel;
}

- (UIButton *)headButton {
    if (!_headButton) {
        _headButton = [UIButton newAutoLayoutView];
        _headButton.layer.cornerRadius = 15;
        _headButton.layer.masksToBounds = YES;
        _headButton.backgroundColor = JRedColor;
    }
    return _headButton;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    [[RACObserve(self.item, portraitString) takeUntil:[self rac_prepareForReuseSignal]] subscribeNext:^(NSString *img) {
        if ([img isKindOfClass:[NSString class]]) {//本地图片
            [self.headButton setImage:[UIImage imageNamed:img] forState:0];
        }else if ([img isKindOfClass:[NSURL class]]){
            [self.headButton sd_setImageWithURL:[NSURL URLWithString:img] forState:0 placeholderImage:[UIImage imageNamed:@""]];
        }
    }];
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
