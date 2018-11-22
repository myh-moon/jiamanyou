//
//  UIButton+Swap.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/2.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "UIButton+Swap.h"

@implementation UIButton (Swap)
//
//- (void)swapImage {
//    self.transform = CGAffineTransformRotate(self.transform, M_PI);
//    self.titleLabel.transform = CGAffineTransformRotate(self.titleLabel.transform, M_PI);
//    self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, M_PI);
//}
- (void)swapImage {
    
    self.transform = CGAffineTransformRotate(self.transform, M_PI);
    
    self.titleLabel.transform = CGAffineTransformRotate(self.titleLabel.transform, M_PI);
    
    self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, M_PI);
    
}

@end
