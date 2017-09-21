//
//  APChangePwdModel.m
//  APay_User
//
//  Created by huangjinyang on 17/9/20.
//  Copyright © 2017年 jinx. All rights reserved.
//

#import "APChangePwdModel.h"

@implementation APChangePwdModel



+(NSMutableArray *)arrFromModel:(APChangePwdModel *)model{
    NSMutableArray *result = [@[model.oldPwd?:@"",model.updatePwd?:@"",model.updatePwdAgain?:@""] mutableCopy];
    return result;
}
@end
