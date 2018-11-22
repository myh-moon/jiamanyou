//
//  UserPacketCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/6.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "UserPacketCell.h"

@implementation UserPacketCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 80;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = UIEdgeInsetsZero;
    self.backgroundColor = JWhiteColor;

    
    [self.contentView addSubview:self.packetButton];
    [self.contentView addSubview:self.collectionButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.packetButton autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge: ALEdgeRight];
    [self.packetButton autoSetDimension:ALDimensionWidth toSize:JWindowWidth/2];
    
    [self.collectionButton autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeLeft];
    [self.collectionButton autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.packetButton];
}

- (UIButton *)packetButton {
    if (!_packetButton) {
        _packetButton = [UIButton newAutoLayoutView];
        
        JWeakSelf;
        [_packetButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(123);
            }
        }];
        
    }
    return _packetButton;
}

-(UIButton *)collectionButton {
    if (!_collectionButton) {
        _collectionButton = [UIButton newAutoLayoutView];
        
        JWeakSelf;
        [_collectionButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(124);
            }
        }];
    }
    return _collectionButton;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    NSMutableAttributedString *packet = [NSString setAttributeOfFirstString:@"红包" firstFont:JFont5 firstColor:JBlackColor1 secondString:@"156.00" secondFont:[UIFont systemFontOfSize:20] secondColor:JRedColor thirdString:@"元" thirdFont:JFont5 thirdColor:JBlackColor1];
    [self.packetButton setAttributedTitle:packet forState:0];
    
    
    NSMutableAttributedString *collection = [NSString setAttributeOfFirstString:@"代收" firstFont:JFont5 firstColor:JBlackColor1 secondString:@"156.00" secondFont:[UIFont systemFontOfSize:20] secondColor:JRedColor thirdString:@"元" thirdFont:JFont5 thirdColor:JBlackColor1];
    [self.collectionButton setAttributedTitle:collection forState:0];
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
