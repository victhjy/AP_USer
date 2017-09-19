//
//  APNotificationModel.h
//  APay_User
//
//  Created by huangjinyang on 17/9/18.
//  Copyright © 2017年 jinx. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger,NotificationType){
    TopUp = 0,
    WithDraw = 1,
    PaySuccess = 2,
    IDVerificationSuccess = 3,
    MonthSalary = 4,
    Welcome = 5
};

@interface APNotificationModel : NSObject
@property(nonatomic, assign) BOOL unread;
@property(nonatomic, copy) NSString *content;
@property(nonatomic, assign)NotificationType currentType;

+(NSMutableArray *)fakerData;
-(NSString *)fakerContent;
+(NSString *)imgName:(NSInteger)index;
@end
