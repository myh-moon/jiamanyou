//
//  ProductMoreMessagesAuthentyCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/11/15.
//  Copyright © 2018 jiamanyou. All rights reserved.
//

#import "ProductMoreMessagesAuthentyCell.h"

@implementation ProductMoreMessagesAuthentyCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 190;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = JSeparatorInset3;
    
    [self.contentView addSubview:self.authentyCollectionView];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.authentyCollectionView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, JBigSpacing, JBigSpacing, JBigSpacing)];
}

- (UICollectionView *)authentyCollectionView {
    if (!_authentyCollectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = JBigSpacing;
        layout.itemSize = CGSizeMake(270, 180);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _authentyCollectionView.translatesAutoresizingMaskIntoConstraints = NO;
        _authentyCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _authentyCollectionView.delegate = self;
        _authentyCollectionView.dataSource = self;
        _authentyCollectionView.backgroundColor = JWhiteColor;
        [_authentyCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"authenty"];
        _authentyCollectionView.pagingEnabled = YES;
    }
    return _authentyCollectionView;
}

#pragma mark - delegate and datasource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"authenty";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[UICollectionViewCell alloc] initWithFrame:CGRectZero];
    }
    
    cell.backgroundColor = JOrangeColor;
    
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, JBigSpacing, 0, JBigSpacing);
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    NSLog(@"sdad");
    
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
