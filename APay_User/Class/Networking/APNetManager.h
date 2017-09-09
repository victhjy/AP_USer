//
//  APNetManager.h
//  APay_User
//
//  Created by huangjinyang on 17/9/9.
//  Copyright © 2017年 jinx. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>


//请求成功回调block
typedef void (^requestSuccessBlock)(NSDictionary *dic);

//请求失败回调block
typedef void (^requestFailureBlock)(NSError *error);


@interface APNetManager : AFHTTPSessionManager

+ (instancetype)sharedManager;

- (void)getRequestWithAPI:(NSString *)path WithParams:(NSDictionary*)params
         WithSuccessBlock:(requestSuccessBlock)success
          WithFailurBlock:(requestFailureBlock)failure;

- (void)postRequestWithAPI:(NSString *)path WithParams:(NSDictionary*)params
         WithSuccessBlock:(requestSuccessBlock)success
          WithFailurBlock:(requestFailureBlock)failure;

@end
