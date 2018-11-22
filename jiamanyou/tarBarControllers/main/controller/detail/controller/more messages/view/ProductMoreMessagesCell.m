//
//  ProductMoreMessagesCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/11/15.
//  Copyright © 2018 jiamanyou. All rights reserved.
//

#import "ProductMoreMessagesCell.h"

@implementation ProductMoreMessagesCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 50;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = JSeparatorInset1;
    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.selectButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:JMiddleSpacing];
    [self.titleLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    [self.selectButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:JMiddleSpacing];
    [self.selectButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.titleLabel];
    [self.selectButton autoSetDimensionsToSize:CGSizeMake(20, 20)];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel newAutoLayoutView];
        _titleLabel.textColor = JBlackColor1;
        _titleLabel.font = JFont5;
    }
    return _titleLabel;
}

- (UIButton *)selectButton {
    if (!_selectButton) {
        _selectButton = [UIButton newAutoLayoutView];
        _selectButton.backgroundColor = JRedColor;
    }
    return _selectButton;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.titleLabel.text = self.item.titleString;
    
    JWeakSelf;
    [[[RACObserve(self.item, selected) distinctUntilChanged] takeUntil:[self rac_prepareForReuseSignal]] subscribeNext:^(id x) {
        if ([x boolValue]) {
            weakself.selectButton.backgroundColor = JRedColor;
        }else{
            weakself.selectButton.backgroundColor = JGrayColor;
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
