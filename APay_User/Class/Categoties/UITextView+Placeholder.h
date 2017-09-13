//
//  UITextView+Placeholder.h
//  APay_User
//
//  Created by huangjinyang on 17/9/13.
//  Copyright © 2017年 jinx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

const static char placeholderLableKey ='\0';
const static char placeholderKey ='\0';
@interface UITextView (Placeholder)
@property(nonatomic,copy)NSString *placeholder;
@property(nonatomic,strong,readonly)UILabel *placeholderLable;

+(CGSize)maxSize:(CGSize )size AndText:(NSString *)text AndFont:(UIFont *)fontSize;
@end
