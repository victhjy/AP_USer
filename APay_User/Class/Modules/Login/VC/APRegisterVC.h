//
//  APRegisterVC.h
//  APay_User
//
//  Created by huangjinyang on 17/9/10.
//  Copyright © 2017年 jinx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APUIViewController.h"
#import "APVerificationCodeVC.h"

//typedef NS_ENUM(NSInteger,VertificateType){
//    Register = 0,
//    ChangePwd = 1
//};
@interface APRegisterVC : APUIViewController


@property(nonatomic, assign) VertificateType curType;
@end
