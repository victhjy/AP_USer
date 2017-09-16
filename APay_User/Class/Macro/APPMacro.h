//
//  APPMacro.h
//  APay_User
//
//  Created by huangjinyang on 17/9/9.
//  Copyright © 2017年 jinx. All rights reserved.
//

#ifndef APPMacro_h
#define APPMacro_h

#define isIndonesia [[APPManager share] isIndonesiaLanguage]
#define ThemeColor [APTools colorWithHexString:@"0x28b6a4"]
#define kHeight      [[UIScreen mainScreen] bounds].size.height
#define kWidth       [[UIScreen mainScreen] bounds].size.width

#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1]
#define popBgColor [UIColor colorWithWhite:0.1 alpha:0.3]

//国际化字符串
#undef L
#define L(str) NSLocalizedString(str, nil)

#ifdef DEBUG
#   define APLog(fmt, ...) NSLog((@" ^_^ %s [Line %d] - " fmt),__func__, __LINE__, ##__VA_ARGS__)
#else
#   define APLog(fmt, ...) NSLog(@"")
#endif


#endif /* APPMacro_h */
