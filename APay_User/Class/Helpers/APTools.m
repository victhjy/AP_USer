//
//  APTools.m
//  APay_User
//
//  Created by huangjinyang on 17/9/9.
//  Copyright © 2017年 jinx. All rights reserved.
//

#import "APTools.h"

@implementation APTools

+ (UIColor *)colorWithHexString:(NSString *)hexColorString {
    if ([hexColorString length] < 6) { //长度不合法
        return [UIColor blackColor];
    }
    NSString *tempString = [hexColorString lowercaseString];
    if ([tempString hasPrefix:@"0x"]) { //检查开头是0x
        tempString = [tempString substringFromIndex:2];
    } else if ([tempString hasPrefix:@"#"]) { //检查开头是#
        tempString = [tempString substringFromIndex:1];
    }
    if ([tempString length] != 6) {
        return [UIColor blackColor];
    }
    //分解三种颜色的值
    NSRange range = NSMakeRange(0, 2);
    NSString *rString = [tempString substringWithRange:range];
    range.location = 2;
    NSString *gString = [tempString substringWithRange:range];
    range.location = 4;
    NSString *bString = [tempString substringWithRange:range];
    //取三种颜色值
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f)
                           green:((float)g / 255.0f)
                            blue:((float)b / 255.0f)
                           alpha:1.0f];
}


//字典、数组转json
+(NSString *)convertToJsonData:(id )dict

{
    
    NSError *error;
    if (!dict) {
        return @"json null";
    }
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    
    NSString *jsonString;
    
    if (!jsonData) {
        
        NSLog(@"%@",error);
        
    }else{
        
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
        
    }
    
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    
    NSRange range = {0,jsonString.length};
    
    //去掉字符串中的空格
    
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    
    NSRange range2 = {0,mutStr.length};
    
    //去掉字符串中的换行符
    
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    
    return mutStr;
}

+(NSString *)doubleToDateStr:(double)doub{
    if (doub <= 0) {
        return @"00:00:00";
    }
    NSString *firstStr;
    NSString *secondStr;
    NSString *thridStr;
    double hour = doub/3600;
    
    int doubleInt = doub;
    double minute = doubleInt/60;
    
    double second = doubleInt%60;
    
    NSString *hourStr =[NSString stringWithFormat:@"%f",hour];
    if ([hourStr containsString:@"."]) {
        NSArray *arr = [hourStr componentsSeparatedByString:@"."];
        hourStr = arr[0];
    }
    if (hourStr.length == 0) {
        firstStr = @"00";
    }
    else if (hourStr.length == 1){
        firstStr = [NSString stringWithFormat:@"0%@",hourStr];
    }
    else if (hourStr.length == 2){
        firstStr = hourStr;
    }
    else{
        firstStr = hourStr;
    }
    
    NSString *minuateStr =[NSString stringWithFormat:@"%f",minute];
    if ([minuateStr containsString:@"."]) {
        NSArray *arr = [minuateStr componentsSeparatedByString:@"."];
        minuateStr = arr[0];
    }
    if (minuateStr.length == 0) {
        secondStr = @"00";
    }
    else if (minuateStr.length == 1){
        secondStr = [NSString stringWithFormat:@"0%@",minuateStr];
    }
    else if (minuateStr.length == 2){
        secondStr = minuateStr;
    }
    else{
        secondStr = minuateStr;
    }
    
    NSString *secStr =[NSString stringWithFormat:@"%f",second];
    if ([secStr containsString:@"."]) {
        NSArray *arr = [secStr componentsSeparatedByString:@"."];
        secStr = arr[0];
    }

    if (secStr.length == 0) {
        thridStr = @"00";
    }
    else if (secStr.length == 1){
        thridStr = [NSString stringWithFormat:@"0%@",secStr];
    }
    else if (secStr.length == 2){
        thridStr = secStr;
    }
    else{
        thridStr = secStr;
    }
    
    return [NSString stringWithFormat:@"%@:%@:%@",firstStr,secondStr,thridStr];
    
    
}


@end
