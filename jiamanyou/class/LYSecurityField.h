//
//  LYSecurityField.h
//  PaymentSecurityField
//
//  Created by 刘宇 on 2017/8/2.
//  Copyright © 2017年 刘宇. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, SecurityCharacterType) {
    SecurityCharacterTypeSecurityDot,   ///<dot● ,default.
    SecurityCharacterTypePlainText,     ///<Instead of dot with using plaintext.
    SecurityCharacterTypeCustomImage,   ///<Instead of dot with using custom image.
    SecurityCharacterTypeHorizontalLine,///<Instead of dot with using horizontal line.
};

typedef NS_ENUM(NSUInteger, BorderType) {
    BorderTypeHaveRoundedCorner,///<The border has rounded corners,default.
    BorderTypeNoRoundedCorner,  ///<The border is not rounded.
    BorderTypeSeparateBox,      ///<Each input bit has a separate box.(No support yet.)
    BorderTypeNoBorder,         ///<The control has no borders.
};

@class LYSecurityField;
@protocol LYPaymentFieldDelegate <NSObject>

@required

/**
 输入完成 end editing
 
 @param paymentField 支付框
 */
- (void)lYPaymentFieldDidFinishedEditing:(LYSecurityField *)paymentField;

@optional

/**
 开始输入 begin editing

 @param paymentField 支付框
 */
- (void)lYPaymentFieldDidBeginEditing:(LYSecurityField *)paymentField;

/**
 删除一个字符 delete a character

 @param paymentField 支付框
 */
- (void)lYPaymentFieldDidDelete:(LYSecurityField *)paymentField;

/**
 清除完成 clear all characters

 @param paymentField 支付框
 */
- (void)lYPaymentFieldDidClear:(LYSecurityField *)paymentField;

@end

@interface LYSecurityField : UIControl

@property (nonatomic, assign) id<LYPaymentFieldDelegate> delegate;
@property (nonatomic, assign) NSInteger numberOfCharacters;
@property (nonatomic, assign) SecurityCharacterType securityCharacterType;
@property (nonatomic, assign) BorderType borderType;
@property (nonatomic, assign) CGFloat diameterOfDot;
@property (nonatomic, assign) CGSize securityImageSize;
@property (nonatomic, assign, readonly) NSInteger countOfVerification;

// Presented when object becomes first responder.  If set to nil, reverts to following responder chain.  If
// set while first responder, will not take effect until reloadInputViews is called.

@property (nullable, readwrite, strong) UIView *inputAccessoryView;

@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) void (^completion)(LYSecurityField *field, NSString *text);

@property (nonatomic, strong) UIColor *tintColor;
@property (nonatomic, strong) UIColor *colorOfCharacter;
@property (nonatomic, strong) UIImage *securityImage;

- (instancetype)initWithNumberOfCharacters:(NSInteger)numberOfCharacters
                     securityCharacterType:(SecurityCharacterType)securityCharacterType
                                borderType:(BorderType)borderType;

- (void)clear;

@end

NS_ASSUME_NONNULL_END
