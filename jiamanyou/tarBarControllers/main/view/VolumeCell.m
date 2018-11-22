//
//  VolumeCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/2.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "VolumeCell.h"
#import "VolumeCollectionViewCell.h"

@implementation VolumeCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 75;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = JSeparatorInset1;
    self.backgroundColor = JBackGroundColor;
    
//    [self.contentView addSubview:self.volumeButton];
    
    [self.contentView addSubview:self.volumeBackView];
    [self.volumeBackView addSubview:self.volumeImageView];
    [self.volumeBackView addSubview:self.volumeCollectionView];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.volumeBackView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(JMiddleSpacing, JMiddleSpacing*2, JMiddleSpacing, JMiddleSpacing*2)];
    
    [self.volumeImageView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:JMiddleSpacing];
    [self.volumeImageView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [self.volumeImageView autoSetDimensionsToSize:CGSizeMake(23, 21)];
    
    [self.volumeCollectionView autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.volumeImageView];
    [self.volumeCollectionView autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.volumeImageView withOffset:JMiddleSpacing];
    [self.volumeCollectionView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:JMiddleSpacing];
}

//- (UIButton *)volumeButton {
//    if (!_volumeButton) {
//        _volumeButton = [UIButton newAutoLayoutView];
//        _volumeButton.backgroundColor = JWhiteColor;
//        _volumeButton.layer.cornerRadius = 22.5;
//    }
//    return _volumeButton;
//}

- (UIView *)volumeBackView {
    if (!_volumeBackView) {
        _volumeBackView = [UIView newAutoLayoutView];
        _volumeBackView.backgroundColor = JWhiteColor;
        _volumeBackView.layer.cornerRadius = 22.5;
    }
    return _volumeBackView;
}

- (UIImageView *)volumeImageView {
    if (!_volumeImageView) {
        _volumeImageView = [UIImageView newAutoLayoutView];
        _volumeImageView.backgroundColor = JRedColor;
    }
    return _volumeImageView;
}

- (UICollectionView *)volumeCollectionView {
    if (!_volumeCollectionView) {
        UICollectionViewFlowLayout *volumeFlowLayout = [[UICollectionViewFlowLayout alloc] init];
        volumeFlowLayout.itemSize = CGSizeMake(200, 20);
        [volumeFlowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        
        _volumeCollectionView.translatesAutoresizingMaskIntoConstraints = YES;
        _volumeCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 200, 20) collectionViewLayout:volumeFlowLayout];
        _volumeCollectionView.delegate = self;
        _volumeCollectionView.dataSource = self;
        [_volumeCollectionView registerClass:[VolumeCollectionViewCell class] forCellWithReuseIdentifier:@"volumes"];
    }
    return _volumeCollectionView;
}


- (void)cellWillAppear {
    [super cellWillAppear];
    
//    [self.volumeButton setTitle:self.item.volumeString forState:0];
    
//    NSString *str1 = @"当前累计撮合交易额达";
//    NSString *str2= self.item.volumeString;
//    NSString *str = [NSString stringWithFormat:@"%@  %@",str1,str2];
//    
//    NSMutableAttributedString *volumeAttribute = [[NSMutableAttributedString alloc] initWithString:str];
//    [volumeAttribute addAttributes:@{NSFontAttributeName:JFont2,NSForegroundColorAttributeName:JGrayColor} range:NSMakeRange(0, str1.length)];
//    [volumeAttribute addAttributes:@{NSFontAttributeName:JFont7,NSForegroundColorAttributeName:JDarkGrayColor} range:NSMakeRange(str1.length, str2.length)];
//
//    [self.volumeButton setAttributedTitle:volumeAttribute forState:0];
}


#pragma mark - collectionView delegate and datasource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
//    static NSString *identifier =@"volume";
    VolumeCollectionViewCell *item = [collectionView dequeueReusableCellWithReuseIdentifier:@"volumes" forIndexPath:indexPath];
    
//    if (!item) {
//        item = [[VolumeCollectionViewCell alloc] initWithFrame:CGRectMake(0, 0, 200, 20)];
//    }
    
    NSString *str1 = @"当前累计撮合交易额达";
    NSString *str2= self.item.volumeString;
    NSString *str = [NSString stringWithFormat:@"%@  %@",str1,str2];

    NSMutableAttributedString *volumeAttribute = [[NSMutableAttributedString alloc] initWithString:str];
    [volumeAttribute addAttributes:@{NSFontAttributeName:JFont2,NSForegroundColorAttributeName:JGrayColor} range:NSMakeRange(0, str1.length)];
    [volumeAttribute addAttributes:@{NSFontAttributeName:JFont7,NSForegroundColorAttributeName:JDarkGrayColor} range:NSMakeRange(str1.length, str2.length)];
    
    item.showLabel.attributedText = volumeAttribute;
    
    return item;
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
