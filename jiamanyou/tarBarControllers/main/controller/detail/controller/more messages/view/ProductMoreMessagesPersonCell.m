//
//  ProductMoreMessagesPersonCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/11/15.
//  Copyright © 2018 jiamanyou. All rights reserved.
//

#import "ProductMoreMessagesPersonCell.h"

@implementation ProductMoreMessagesPersonCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 345+20;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = JSeparatorInset3;
    
    [self.contentView addSubview:self.personCollectionView];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.personCollectionView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, JBigSpacing, JBigSpacing, JBigSpacing)];
}

- (UICollectionView *)personCollectionView {
    if (!_personCollectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 0.5;
        layout.minimumInteritemSpacing = 0;
        layout.itemSize = CGSizeMake((JWindowWidth-JBigSpacing*2-0.5)/2, 30);

        _personCollectionView.translatesAutoresizingMaskIntoConstraints = NO;
        _personCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _personCollectionView.delegate = self;
        _personCollectionView.dataSource = self;
        _personCollectionView.backgroundColor = JWhiteColor;
        [_personCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"person"];
        
    }
    return _personCollectionView;
}

#pragma mark - delegate and datasource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 22;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"person";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[UICollectionViewCell alloc] initWithFrame:CGRectZero];
    }
    
    if (indexPath.item == 0 || indexPath.item == 3 || indexPath.item == 4 || indexPath.item == 7 || indexPath.item == 8 || indexPath.item == 11 || indexPath.item == 12 || indexPath.item == 15 || indexPath.item == 16 || indexPath.item == 19 || indexPath.item == 20) {
        cell.backgroundColor = JRedColor;
    }else{
        cell.backgroundColor = JOrangeColor;
    }
    
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 1.5, 0);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
