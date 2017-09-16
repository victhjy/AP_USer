//
//  APMainPopView.h
//  APay_User
//
//  Created by huangjinyang on 17/9/15.
//  Copyright © 2017年 jinx. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^ClickedTopUp)(void);
@interface APMainPopView : UIView
@property(nonatomic, copy) ClickedTopUp block;
-(instancetype)initWithFrame:(CGRect)frame;
@end
