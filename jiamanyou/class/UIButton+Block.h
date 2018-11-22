//
//  UIButton+Block.h
//  jiamanyou
//
//  Created by jiamanu on 2018/8/3.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ButtonBlock)(UIButton *btn);

@interface UIButton (Block)

- (void) addAction:(ButtonBlock)block;

@end
