//
//  APNetManager.m
//  APay_User
//
//  Created by huangjinyang on 17/9/9.
//  Copyright © 2017年 jinx. All rights reserved.
//

#import "APNetManager.h"
#import "APPManager.h"
@implementation APNetManager

+ (instancetype)sharedManager {
    static APNetManager *manager = nil;
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        manager = [[self alloc] initWithBaseURL:[NSURL URLWithString:APBaseHost]];
        manager.securityPolicy.allowInvalidCertificates = YES;
        manager.securityPolicy.validatesDomainName = NO;
        [manager.requestSerializer setValue:@"*/*" forHTTPHeaderField:@"Accept"];
        [manager.requestSerializer setValue:@"zh-cn" forHTTPHeaderField:@"lang"];
        [manager.requestSerializer setValue:@"keep-alive" forHTTPHeaderField:@"Connection"];
        [manager.requestSerializer setValue:@"keep-alive" forHTTPHeaderField:@"Proxy-Connection"];
        [manager.requestSerializer setValue:@"@rWW6wQ+NR7xIET/rdOTzo7YVw07HpFWY53v4ZtdfgKlMpICb5fez7zJci0lvnxD5auhNsd9bYXM=" forHTTPHeaderField:@"UUID"];
        [manager.requestSerializer setValue:@"Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_2 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Mobile/13F69 NewsApp/4.7.0 NetType/NA Technology/Wifi (iPhone; iOS 9.3.2; Scale/2.00) (modelIdentifier/iPhone8,4 )" forHTTPHeaderField:@"User-Agent"];
        [manager.requestSerializer setValue:@"zh-cn" forHTTPHeaderField:@"Accept-Language"];
        [manager.requestSerializer setValue:@"gzip,deflate" forHTTPHeaderField:@"Accept-Encoding"];
    });
    return manager;
}

- (void)getRequestWithAPI:(NSString *)path WithParams:(NSDictionary*)params
         WithSuccessBlock:(requestSuccessBlock)success
          WithFailurBlock:(requestFailureBlock)failure{
    
    [self GET:path parameters:params progress:nil success:^(NSURLSessionTask *task, NSDictionary * responseObject) {
        success(responseObject);
        if ([APPManager share].simulator) {
            dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
            dispatch_async(queue, ^{
                NSString *log = [NSString stringWithFormat:@"url:%@\nparam:%@\nresponse:%@",path,[APTools convertToJsonData:params],[APTools convertToJsonData:responseObject]];
                [[APPManager share] recordHttpRequestLog:log];
            });
        }
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        APLog(@"Error: %@", error);
        failure(error);
        
    }];

    
    
}

- (void)postRequestWithAPI:(NSString *)path WithParams:(NSDictionary*)params
         WithSuccessBlock:(requestSuccessBlock)success
          WithFailurBlock:(requestFailureBlock)failure{
    [self POST:path parameters:params progress:nil success:^(NSURLSessionTask *task, NSDictionary * responseObject) {
        success(responseObject);
        if ([APPManager share].simulator) {
            dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
            dispatch_async(queue, ^{
                NSString *log = [NSString stringWithFormat:@"url:%@\nparam:%@\nresponse:%@",path,[APTools convertToJsonData:params],[APTools convertToJsonData:responseObject]];
                [[APPManager share] recordHttpRequestLog:log];
            });
        }
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        APLog(@"Error: %@", error);
        failure(error);
    }];

}


@end
