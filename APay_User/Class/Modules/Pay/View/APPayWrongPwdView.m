//
//  APPayWrongPwdView.m
//  APay_User
//
//  Created by huangjinyang on 17/9/15.
//  Copyright © 2017年 jinx. All rights reserved.
//

#import "APPayWrongPwdView.h"
@interface APPayWrongPwdView ()

@property(nonatomic, assign) CGRect popFrame;
@property(nonatomic, strong) UIView *bgView;
@property(nonatomic, strong) NSTimer *timer;
@end


@implementation APPayWrongPwdView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
        _popFrame = frame;
        [self configSelf];
        [self createUI];
    }
    return self;
}

- (void)configSelf {
    self.backgroundColor= popBgColor;
    
    self.bgView = [[UIView alloc]initWithFrame:_popFrame];
    self.bgView.backgroundColor = [UIColor whiteColor];
    self.bgView.layer.masksToBounds = YES;
    self.bgView.layer.cornerRadius = 4;
    [self addSubview:self.bgView];
    
    __weak __typeof(self)weakSelf = self;
    [self addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
        [weakSelf removeFromSuperview];
    }];
}

- (void)createUI {
    CGSize titleSize = [L(@"Your Payment Password is wrong, please try again after") sizeWithFont:[UIFont systemFontOfSize:15] maxSize:CGSizeMake(self.bgView.width - 80, 100)];
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(40, 20, self.bgView.width - 80, titleSize.height)];
    title.text = L(@"Your Payment Password is wrong, please try again after");
    title.font = [UIFont systemFontOfSize:15];
    title.numberOfLines = 0;
    title.textAlignment = 1;
    [self.bgView addSubview:title];
    
    CGSize timeLblSize = [[APTools doubleToDateStr:[APPManager share].paymentTime] sizeWithFont:[UIFont boldSystemFontOfSize:32] maxSize:CGSizeMake(100, 100)];
    UILabel *timeLbl = [[UILabel alloc]initWithFrame:CGRectMake(0, self.bgView.height/2, self.bgView.width, timeLblSize.height)];
    timeLbl.text = [APTools doubleToDateStr:[APPManager share].paymentTime];
    timeLbl.font = [UIFont boldSystemFontOfSize:32];
    timeLbl.textAlignment = 1;
    timeLbl.tag = 506;
    timeLbl.textColor = ThemeColor;
    [self.bgView addSubview:timeLbl];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        UILabel *timeLbl = [self.bgView viewWithTag:506];
        timeLbl.text = [APTools doubleToDateStr:[APPManager share].paymentTime];
        
        if ([[APTools doubleToDateStr:[APPManager share].paymentTime] isEqualToString:@"00:00:00"]) {
            [self removeFromSuperview];
        }
    }];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    [self.timer fire];
}

-(void)dealloc{
    _timer = nil;
}



@end
