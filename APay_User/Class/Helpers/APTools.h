//
//  APTools.h
//  APay_User
//
//  Created by huangjinyang on 17/9/9.
//  Copyright © 2017年 jinx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APTools : NSObject


/**
 *  16进制颜色
 *
 *  @param hexColorString 16进制值
 *
 *  @return 16进制对应颜色
 */
+ (UIColor *)colorWithHexString:(NSString *)hexColorString;

//字典、数组转json
+(NSString *)convertToJsonData:(id )dict;

@end
