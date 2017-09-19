//
//  APAccountModel.h
//  APay_User
//
//  Created by huangjinyang on 17/9/19.
//  Copyright © 2017年 jinx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APAccountModel : NSObject

@property(nonatomic, copy) NSString *menuImageStr;
@property(nonatomic, copy) NSString *menuName;
@property(nonatomic, assign) BOOL isVerified;

+(NSMutableArray *)defaultArr;
@end
