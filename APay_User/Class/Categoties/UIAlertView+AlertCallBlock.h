//
//  UIAlertView+AlertCallBlock.h
//  NewsPage
//
//  Created by huangjinyang on 17/8/16.
//  Copyright © 2017年 API. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ AlertCallBack)(UIAlertView *alertView,NSInteger index);
@interface UIAlertView (AlertCallBlock)<UIAlertViewDelegate>
@property (nonatomic,copy)AlertCallBack callBack;
@end
