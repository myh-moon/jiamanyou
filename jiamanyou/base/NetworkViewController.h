//
//  NetworkViewController.h
//  jiamanyou
//
//  Created by jiamanu on 2018/8/1.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "BaseViewController.h"

@interface NetworkViewController : BaseViewController

//post
-(void)requestDataPostWithString:(NSString *)string params:(NSDictionary *)params successBlock:(void(^)(id responseObject))successBlock andFailBlock:(void(^)(NSError *error))failBlock;

//get
-(void)requestDataGetWithString:(NSString *)string params:(NSDictionary *)params successBlock:(void(^)(id responseObject))successBlock andFailBlock:(void(^)(NSError *error))failBlock;

@end
