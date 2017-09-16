//
//  APEnterPaymentView.m
//  APay_User
//
//  Created by huangjinyang on 17/9/14.
//  Copyright © 2017年 jinx. All rights reserved.
//

#define itemW 30
#define itemH 40

#import "APEnterPaymentView.h"

@interface APEnterPaymentView ()<UITextViewDelegate>

@property(nonatomic, assign) CGRect bgFrame;
@property(nonatomic, strong) UIView *bgView;
@property(nonatomic, assign) NSInteger passwordCount;
@property(nonatomic, strong) NSMutableArray *passwordItemArr;

@property(nonatomic, strong) NSString *curPwd;
@end


@implementation APEnterPaymentView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(instancetype)initWithFrame:(CGRect)frame andPasswordCount:(NSInteger)count
{
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
        _bgFrame = frame;
        _passwordCount = count;
        [self configSelf];
        [self createUI];
    }
    return self;
}

#pragma mark - private method

- (void)configSelf {
    self.backgroundColor= popBgColor;
    
    self.bgView = [[UIView alloc]initWithFrame:_bgFrame];
    self.bgView.backgroundColor = [UIColor whiteColor];
    self.bgView.layer.masksToBounds = YES;
    self.bgView.layer.cornerRadius = 4;
    
    [self addSubview:self.bgView];
}

- (void)createUI {
    UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 30, self.bgView.width, 20)];
    titleLabel.text = L(@"Enter Payment Password");
    titleLabel.textAlignment = 1;
    [self.bgView addSubview:titleLabel];
    
    [self addPasswordView];
}

- (void)addPasswordView {
    CGFloat midPadding = 5;
    CGFloat leftPadding = (self.bgView.mj_w - midPadding*(_passwordCount - 1) - itemW *_passwordCount) / 2;
    self.passwordItemArr = [NSMutableArray new];
    for (int i = 0; i < _passwordCount; i ++) {
        UIView *itemView = [[UIView alloc]initWithFrame:CGRectMake(leftPadding + i*(midPadding + itemW), self.bgView.mj_h/2-5, itemW, itemH)];
        itemView.backgroundColor = [UIColor whiteColor];
        itemView.layer.borderWidth = 0.5;
        itemView.layer.cornerRadius = 4;
        itemView.layer.masksToBounds = YES;
        
        UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 30, 20)];
        label.font = [UIFont boldSystemFontOfSize:19];
        label.center =CGPointMake(itemW/2, itemH/2);
        label.textAlignment = 1;
        label.hidden=NO;
        label.tag = 500+i;
        label.textColor = [UIColor blackColor];
        [itemView addSubview:label];
    
        [self.bgView addSubview:itemView];
        [self.passwordItemArr addObject:itemView];
    }
    
    UILabel *wrongPwdLbl = [[UILabel alloc]initWithFrame:CGRectMake(0, self.bgView.mj_h/2-5 + itemH + 20, self.bgView.width, 20)];
    wrongPwdLbl.text = L(@"Wrong Password");
    wrongPwdLbl.textColor = [APTools colorWithHexString:@"f23e54"];
    wrongPwdLbl.font = [UIFont systemFontOfSize:14];
    wrongPwdLbl.tag = 109;
    wrongPwdLbl.hidden = YES;
    wrongPwdLbl.textAlignment = 1;
    [self.bgView addSubview:wrongPwdLbl];
    
    
    UITextView *fakerTV=[[UITextView alloc]initWithFrame:self.bgView.bounds];
    fakerTV.hidden=YES;
    fakerTV.tag = 806;
    fakerTV.keyboardType = UIKeyboardTypeNumberPad;
    fakerTV.delegate = self;
    [fakerTV becomeFirstResponder];
    [self addSubview:fakerTV];
    
    [self.bgView addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
        [fakerTV becomeFirstResponder];
    }];
}


#pragma mark - TextView Delegate

- (void)textViewDidChange:(UITextView *)textView {
    for (int i = 0; i < _passwordCount; i ++) {
        UIView * itemView =self.passwordItemArr[i];
        UILabel *label = [itemView viewWithTag:500+i];
        if (i < textView.text.length) {
            label.text = [textView.text substringWithRange:NSMakeRange(i, 1)];
        }
        else{
            label.text = @"";
        }
    }
    [self.bgView layoutSubviews];
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    NSString *willBecomeStr = [textView.text stringByReplacingCharactersInRange:range withString:text];
    if (willBecomeStr.length >= 6) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSString *pwd= [willBecomeStr substringToIndex:6];
            textView.text  = pwd;
            if ([pwd isEqualToString:@"123456"]) {
                [self wrongPwd];
            }
            else{
                if (self.rightBlock) {
                    self.rightBlock();
                }
            }
        });
        textView.text = willBecomeStr;
        [self textViewDidChange:textView];
        return NO;
    }
    else{
        [self notEnoughtLength];
        return YES;
    }
}

- (void)wrongPwd {
    [self changeColor:[APTools colorWithHexString:@"f23e54"]];
    UILabel *wrongPwdLbl = [self.bgView viewWithTag:109];
    wrongPwdLbl.hidden = NO;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (self.wrongBlock) {
            self.wrongBlock();
        }
    });
}

- (void)changeColor:(UIColor *)color{
    for (UIView *itemView in self.passwordItemArr) {
        itemView.layer.borderColor = color.CGColor;
    }
}

- (void)notEnoughtLength {
    [self changeColor:[UIColor blackColor]];
    UILabel *wrongPwdLbl = [self.bgView viewWithTag:109];
    wrongPwdLbl.hidden = YES;
}


@end
