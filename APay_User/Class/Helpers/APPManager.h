//
//  APPManager.h
//  APay_User
//
//  Created by huangjinyang on 17/9/9.
//  Copyright © 2017年 jinx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APPManager : NSObject

@property(nonatomic, copy) NSString *appName;
@property(nonatomic, assign) BOOL simulator;
@property(nonatomic, assign) BOOL firstLogin;
@property(nonatomic, strong) NSString *appVersion;

+(instancetype)share;

- (void)recordHttpRequestLog:(NSString *)str;

@end
