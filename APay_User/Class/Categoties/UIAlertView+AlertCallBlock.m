//
//  UIAlertView+AlertCallBlock.m
//  NewsPage
//
//  Created by huangjinyang on 17/8/16.
//  Copyright © 2017年 API. All rights reserved.
//

#import "UIAlertView+AlertCallBlock.h"
#import <objc/runtime.h>
static void *alertViewCallBack = "alertViewCallBack";

@implementation UIAlertView (AlertCallBlock)
- (void)setCallBack:(AlertCallBack)callBack {
    objc_setAssociatedObject(self, alertViewCallBack, callBack, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.delegate = self;
}
- (AlertCallBack)callBack {
    return objc_getAssociatedObject(self, alertViewCallBack);
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (self.callBack) {
        self.callBack(alertView,buttonIndex);
    }
}
@end
