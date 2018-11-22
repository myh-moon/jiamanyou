//
//  NSString+Attribute.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/2.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "NSString+Attribute.h"

@implementation NSString (Attribute)

+ (NSMutableAttributedString *)setAttributeOfFirstString:(NSString *)firstString firstFont:(UIFont *)firstFont firstColor:(UIColor *)firstColor secondString:(NSString *)secondString secondFont:(UIFont *)secondFont secondColor:(UIColor *)secondColor{
    NSString *str = [NSString stringWithFormat:@"%@%@",firstString,secondString];
    NSMutableAttributedString *setAttributeString = [[NSMutableAttributedString alloc] initWithString:str];
    
    [setAttributeString addAttributes:@{NSFontAttributeName:firstFont,NSForegroundColorAttributeName:firstColor} range:NSMakeRange(0, firstString.length)];
    [setAttributeString addAttributes:@{NSFontAttributeName:secondFont,NSForegroundColorAttributeName:secondColor} range:NSMakeRange(firstString.length, secondString.length)];
    return setAttributeString;
}

+ (NSMutableAttributedString *)setAttributeOfFirstString:(NSString *)firstString firstFont:(UIFont *)firstFont firstColor:(UIColor *)firstColor secondString:(NSString *)secondString secondFont:(UIFont *)secondFont secondColor:(UIColor *)secondColor align:(NSInteger)align space:(CGFloat)space {
    NSString *str = [NSString stringWithFormat:@"%@%@",firstString,secondString];
    NSMutableAttributedString *setAttributeString = [[NSMutableAttributedString alloc] initWithString:str];
    
    [setAttributeString addAttributes:@{NSFontAttributeName:firstFont,NSForegroundColorAttributeName:firstColor} range:NSMakeRange(0, firstString.length)];
    [setAttributeString addAttributes:@{NSFontAttributeName:secondFont,NSForegroundColorAttributeName:secondColor} range:NSMakeRange(firstString.length, secondString.length)];
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = space;
    style.alignment = align;
    
    [setAttributeString addAttributes:@{NSParagraphStyleAttributeName:style} range:NSMakeRange(0, firstString.length+secondString.length)];
    
    return setAttributeString;
}

+ (NSMutableAttributedString *)setAttributeOfFirstString:(NSString *)firstString firstFont:(UIFont *)firstFont firstColor:(UIColor *)firstColor secondString:(NSString *)secondString secondFont:(UIFont *)secondFont secondColor:(UIColor *)secondColor thirdString:(NSString *)thirdString thirdFont:(UIFont *)thirdFont thirdColor:(UIColor *)thirdColor{
    NSString *str = [NSString stringWithFormat:@"%@%@%@",firstString,secondString,thirdString];
    NSMutableAttributedString *setAttributeString = [[NSMutableAttributedString alloc] initWithString:str];
    
    [setAttributeString addAttributes:@{NSFontAttributeName:firstFont,NSForegroundColorAttributeName:firstColor} range:NSMakeRange(0, firstString.length)];
    [setAttributeString addAttributes:@{NSFontAttributeName:secondFont,NSForegroundColorAttributeName:secondColor} range:NSMakeRange(firstString.length, secondString.length)];
    [setAttributeString addAttributes:@{NSFontAttributeName:thirdFont,NSForegroundColorAttributeName:thirdColor} range:NSMakeRange(firstString.length+secondString.length, thirdString.length)];
    
    return setAttributeString;
}

+ (NSMutableAttributedString *)setAttributeOfFirstString:(NSString *)firstString firstFont:(UIFont *)firstFont firstColor:(UIColor *)firstColor secondString:(NSString *)secondString secondFont:(UIFont *)secondFont secondColor:(UIColor *)secondColor thirdString:(NSString *)thirdString thirdFont:(UIFont *)thirdFont thirdColor:(UIColor *)thirdColor align:(NSInteger)align space:(CGFloat)space{
    NSString *str = [NSString stringWithFormat:@"%@%@%@",firstString,secondString,thirdString];
    NSMutableAttributedString *setAttributeString = [[NSMutableAttributedString alloc] initWithString:str];
    
    [setAttributeString addAttributes:@{NSFontAttributeName:firstFont,NSForegroundColorAttributeName:firstColor} range:NSMakeRange(0, firstString.length)];
    [setAttributeString addAttributes:@{NSFontAttributeName:secondFont,NSForegroundColorAttributeName:secondColor} range:NSMakeRange(firstString.length, secondString.length)];
    [setAttributeString addAttributes:@{NSFontAttributeName:thirdFont,NSForegroundColorAttributeName:thirdColor} range:NSMakeRange(firstString.length+secondString.length, thirdString.length)];
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = space;
    style.alignment = align;
    
    [setAttributeString addAttributes:@{NSParagraphStyleAttributeName:style} range:NSMakeRange(0, firstString.length+secondString.length+thirdString.length)];
    
    return setAttributeString;
}



@end
