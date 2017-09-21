//
//  APChangePwdModel.h
//  APay_User
//
//  Created by huangjinyang on 17/9/20.
//  Copyright © 2017年 jinx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APChangePwdModel : NSObject
@property(nonatomic, copy) NSString *oldPwd;
@property(nonatomic, copy) NSString *updatePwd;
@property(nonatomic, copy) NSString *updatePwdAgain;

+(NSMutableArray *)arrFromModel:(APChangePwdModel *)model;
@end
