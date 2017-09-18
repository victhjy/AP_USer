//
//  UIFont+APFont.m
//  APay_User
//
//  Created by huangjinyang on 17/9/15.
//  Copyright © 2017年 jinx. All rights reserved.
//
#import "KMSwizzle.h"
#import <objc/runtime.h>
#import "UIFont+APFont.h"

@implementation UIFont (APFont)


//+(void)load{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        KMSwizzleMethod([self class],
//                        @selector(systemFontOfSize:),
//                        @selector(ap_systemFontOfSize:));
//        
//        KMSwizzleMethod([self class],
//                        @selector(boldSystemFontOfSize:),
//                        @selector(ap_boldSystemFontOfSize:));
//    });
//}
+(UIFont *)systemFontOfSize:(CGFloat)fontSize{
    return [UIFont fontWithName:@"VAG Rounded" size:fontSize];
}


+(UIFont *)boldSystemFontOfSize:(CGFloat)fontSize{
    return [UIFont fontWithName:@"VAGRounded" size:fontSize];
}

@end
