//
//  NSString+Size.m
//  APay_User
//
//  Created by huangjinyang on 17/9/8.
//  Copyright © 2017年 jinx. All rights reserved.
//

#import "NSString+Size.h"

@implementation NSString (Size)

- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}
-(BOOL)isExist{
    if (self && self.length > 1 && ![self isEqualToString:@"NULL"] && ![self isEqualToString:@"null"] && ![self isEqualToString:@"<null>"]) {
        return YES;
    }
    else{
        return NO;
    }
}
@end
