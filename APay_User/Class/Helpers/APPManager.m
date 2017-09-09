//
//  APPManager.m
//  APay_User
//
//  Created by huangjinyang on 17/9/9.
//  Copyright © 2017年 jinx. All rights reserved.
//
#define kFirstLogin @"kFirstLogin"


#import "APPManager.h"

@implementation APPManager


+(instancetype)share{
    static dispatch_once_t onceToken;
    static APPManager *_app = nil;
    dispatch_once(&onceToken, ^{
        _app =[APPManager new];
    });
    return _app;
}

#pragma mark - appName

-(NSString *)appName{
    NSString *allName=[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
    NSArray *arr=[allName componentsSeparatedByString:@"."];
    return [arr lastObject];
}

#pragma mark - simulator

-(BOOL)simulator{
#if TARGET_IPHONE_SIMULATOR
    return YES;
#else
    return NO;
#endif
}

#pragma mark - request log

- (void)recordHttpRequestLog:(NSString *)str {
    [self writeLog:str];
}

#pragma mark - private method

- (void)writeLog:(NSString *)logStr {
    NSMutableString *content=[logStr mutableCopy];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *today = [dateFormatter stringFromDate:[NSDate date]];
    NSString *filePathH = [NSString stringWithFormat:@"/Users/jinxhuang/Documents/AppLogs/%@Logs---%@.h",self.appName,today];
    if(![fileManager fileExistsAtPath:filePathH]){
        [fileManager createFileAtPath:filePathH contents:nil attributes:nil];
        [content appendString:@"\n"];
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"MM-dd HH:mm:ss"];
        NSString *datestr = [dateFormatter stringFromDate:[NSDate date]];
        [content insertString:datestr atIndex:0];
        [content writeToFile:filePathH atomically:YES encoding:NSUTF8StringEncoding error:nil];
    }
    else{
        NSFileHandle *fileHandle = [NSFileHandle fileHandleForUpdatingAtPath:filePathH];
        
        [fileHandle seekToEndOfFile];  //将节点跳到文件的末尾
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"MM-dd HH:mm:ss"];
        NSString *datestr = [dateFormatter stringFromDate:[NSDate date]];
        
        NSString *line = @"\n--------------------------------------------------------------\n";
        content = [[NSString stringWithFormat:@"#pragma mark - %@\n%@     ;\n%@",datestr,content,line] mutableCopy];
        NSData* stringData  = [content dataUsingEncoding:NSUTF8StringEncoding];
        [fileHandle writeData:stringData]; //追加写入数据
        [fileHandle closeFile];
    }
}


-(BOOL)isFirstLogin{
    NSString *firstFlag=[[NSUserDefaults standardUserDefaults] stringForKey:kFirstLogin];
    if (firstFlag.isExist) {
        return NO;
    }
    else{
        [[NSUserDefaults standardUserDefaults] setObject:@"logined" forKey:kFirstLogin];
        [[NSUserDefaults standardUserDefaults] synchronize];
        return YES;
    }
}

-(NSString *)appVersion{
    if (!_appVersion) {
        NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
        // app版本
        NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
        _appVersion =app_Version;
    }
    
    return _appVersion;
}

@end
