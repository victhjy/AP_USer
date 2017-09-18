//
//  APAccountModel.m
//  APay_User
//
//  Created by huangjinyang on 17/9/19.
//  Copyright © 2017年 jinx. All rights reserved.
//

#import "APAccountModel.h"

@implementation APAccountModel

+(NSMutableArray *)defaultArr{
    NSArray *iconImageArr = @[@"ic_myaccountuser",@"ic_myaccountcompleteID",@"ic_myaccountpassword",@"ic_myaccountresetpayment",@"ic_myaccountlogout"];
    NSArray *menuNameArr = @[@"Username",1?L(@"Your account is verified!"):L(@"Lengkapi Data Anda"),L(@"Change Password"),L(@"Change Payment Password"),L(@"Logout")];
    
    NSMutableArray *arr = [NSMutableArray new];
    for (int i = 0; i < 5; i ++) {
        APAccountModel *model = [[APAccountModel alloc]init];
        model.menuImageStr = iconImageArr[i];
        model.menuName = menuNameArr[i];
        
        if (i == 1) {
            model.isVerified = 1?YES:NO;
        }
        [arr addObject:model];
    }
    return arr;
}

+(NSMutableArray *)settingDefaultArr{
    NSArray *iconImageArr = @[@"ic_settingsnotify",@"ic_myaccountcompleteID",@"ic_terms",@"ic_terms"];
    NSArray *menuNameArr = @[L(@"Notifications"),L(@"Terms & Conditions"),L(@"Privacy Policy")];
    
    NSMutableArray *arr = [NSMutableArray new];
    for (int i = 0; i < 3; i ++) {
        APAccountModel *model = [[APAccountModel alloc]init];
        model.menuImageStr = iconImageArr[i];
        model.menuName = menuNameArr[i];
        [arr addObject:model];
    }
    return arr;
}
@end
