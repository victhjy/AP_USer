//
//  APNotificationModel.m
//  APay_User
//
//  Created by huangjinyang on 17/9/18.
//  Copyright © 2017年 jinx. All rights reserved.
//

#import "APNotificationModel.h"

@implementation APNotificationModel

+(NSMutableArray *)fakerData{
    NSMutableArray *dataArr = [NSMutableArray new];
    
    for (int i  = 0; i < 12; i ++) {
        APNotificationModel *model = [[APNotificationModel alloc]init];
        model.currentType = i%5;
        model.content = [model fakerContent];
        if (i%2 == 0) {
            model.unread = YES;
        }
        [dataArr addObject:model];
    }
    
    return dataArr;
}

-(NSString *)fakerContent{
    NSString *result;
    switch (self.currentType) {
        case 0:
            result = [NSString stringWithFormat:L(@"Top Up +Rp.%@ Success!"),@"123"];
            break;
        case 1:
            result = [NSString stringWithFormat:L(@"Withdraw -Rp.%@ Sucess!"),@"1234"];
            break;
        case 2:
            result = [NSString stringWithFormat:L(@"%@ Payment Success!"),@"erer"];
            break;
        case 3:
            result = L(@"ID Card Verification Success!");
            break;
        case 4:
            result = [NSString stringWithFormat:L(@"Your %@ Salary has arrived!"),@"March"];
            break;
        case 5:
            result = L(@"Welcome to APay, enjoy!!");
            break;
            
        default:
            break;
    }
    return result;
}

+(NSString *)imgName:(NSInteger)index{
    NSArray *arr = @[@"img_topup",@"img_withdraw",@"img_payment",@"img_verificationsucceed",@"img_salary"];
    return arr[index];
}

@end
