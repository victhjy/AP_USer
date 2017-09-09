//
//  NSString+Size.h
//  APay_User
//
//  Created by huangjinyang on 17/9/8.
//  Copyright © 2017年 jinx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Size)

-(BOOL)isExist;
- (CGSize )sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;
@end
