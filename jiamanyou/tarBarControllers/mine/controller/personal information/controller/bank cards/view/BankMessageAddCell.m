//
//  BankMessageAddCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/11/16.
//  Copyright © 2018 jiamanyou. All rights reserved.
//

#import "BankMessageAddCell.h"

@implementation BankMessageAddCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 60;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = JSeparatorInset1;
    self.backgroundColor = JBackGroundColor;
    
    [self.contentView addSubview:self.addButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.addButton autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(5, JBigSpacing, 5, JBigSpacing)];
}

- (UIButton *)addButton {
    if (!_addButton) {
        _addButton = [UIButton newAutoLayoutView];
        [_addButton setTitle:@"添加银行卡" forState:0];
        [_addButton setTitleColor:JOrangeColor1 forState:0];
        _addButton.titleLabel.font = JFont7;
        _addButton.userInteractionEnabled = NO;
        
        _addButton.backgroundColor = JWhiteColor;
        
        _addButton.layer.cornerRadius = 5;
        _addButton.layer.borderWidth = 0.5;
        _addButton.layer.borderColor = JLightGrayColor10.CGColor;
    }
    return _addButton;
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
