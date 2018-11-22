//
//  InvestMessageCell.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/8.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "InvestMessageCell.h"

@implementation InvestMessageCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 105;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = JSeparatorInset1;
    self.backgroundColor = JWhiteColor;
    
    [self.contentView addSubview:self.rateLabel];
    [self.contentView addSubview:self.durationLabel];
    [self.contentView addSubview:self.progressLabel];

    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    NSArray *views = @[self.rateLabel,self.durationLabel,self.progressLabel];
    [views autoAlignViewsToAxis:ALAxisHorizontal];
    [[views firstObject] autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    [self.rateLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:JMiddleSpacing];
    
    [self.durationLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
    
    [self.progressLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:JMiddleSpacing];
    [self.progressLabel autoSetDimensionsToSize:CGSizeMake(65, 65)];
}

- (UILabel *)rateLabel {
    if (!_rateLabel) {
        _rateLabel = [UILabel newAutoLayoutView];
        _rateLabel.numberOfLines = 0;
    }
    return _rateLabel;
}


- (UILabel *)durationLabel {
    if (!_durationLabel) {
        _durationLabel = [UILabel newAutoLayoutView];
        _durationLabel.numberOfLines = 0;
    }
    return _durationLabel;
}

- (UILabel *)progressLabel {
    if (!_progressLabel) {
        _progressLabel = [UILabel newAutoLayoutView];
        
        CAShapeLayer *layer = [CAShapeLayer new];
        layer.lineWidth = 5;
        //圆环的颜色
        layer.strokeColor = JLightGrayColor13.CGColor;
        //背景填充色
        layer.fillColor = JOrangeColor1.CGColor;
        //设置半径为10
        CGFloat radius = 30;
        //按照顺时针方向
        BOOL clockWise = true;
        //初始化一个路径
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(32.5, 32.5) radius:radius startAngle:(0*M_PI) endAngle:2*M_PI clockwise:clockWise];
        layer.path = [path CGPath];
        [_progressLabel.layer addSublayer:layer];
    }
    return _progressLabel;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.rateLabel.attributedText = [NSString setAttributeOfFirstString:@"12%" firstFont:[UIFont systemFontOfSize:25] firstColor:JOrangeColor1 secondString:@"\n历史年化利率" secondFont:JFont2 secondColor:JLightGrayColor2  align:0 space:JMiddleSpacing];
    
    self.durationLabel.attributedText = [NSString setAttributeOfFirstString:@"97" firstFont:[UIFont systemFontOfSize:25] firstColor:JOrangeColor1 secondString:@"天\n" secondFont:JFont7 secondColor:JOrangeColor1 thirdString:@"产品期限" thirdFont:JFont2 thirdColor:JLightGrayColor2 align:0 space:JMiddleSpacing];
    
//    self.progressLabel.attributedText = [NSString setAttributeOfFirstString:@"97" firstFont:[UIFont systemFontOfSize:25] firstColor:JOrangeColor1 secondString:@"天\n" secondFont:JFont7 secondColor:JOrangeColor1 thirdString:@"产品期限" thirdFont:JFont2 thirdColor:JLightGrayColor2 align:0 space:JMiddleSpacing];
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
