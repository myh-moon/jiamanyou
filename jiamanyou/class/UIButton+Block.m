//
//  UIButton+Block.m
//  jiamanyou
//
//  Created by jiamanu on 2018/8/3.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "UIButton+Block.h"
#import <objc/runtime.h>

@implementation UIButton (Block)

static char actionTag;

- (void)addAction:(ButtonBlock)block {
    objc_setAssociatedObject(self, &actionTag, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [self addTarget:self action:@selector(action) forControlEvents:UIControlEventTouchUpInside];
}

- (void) action {
    ButtonBlock block = objc_getAssociatedObject(self, &actionTag);
    if (block) {
        block(self);
    }
}

@end
