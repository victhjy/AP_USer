//
//  APEnterPaymentView.h
//  APay_User
//
//  Created by huangjinyang on 17/9/14.
//  Copyright © 2017年 jinx. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^WrongBlock)(void);
typedef void (^RightBlock)(void);
@interface APEnterPaymentView : UIView

@property(nonatomic, copy) WrongBlock wrongBlock;
@property(nonatomic, copy) RightBlock rightBlock;
-(instancetype)initWithFrame:(CGRect)frame andPasswordCount:(NSInteger)count;
@end
