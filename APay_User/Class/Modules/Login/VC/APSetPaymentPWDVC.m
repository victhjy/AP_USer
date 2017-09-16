//
//  APSetPaymentPWDVC.m
//  APay_User
//
//  Created by huangjinyang on 17/9/14.
//  Copyright © 2017年 jinx. All rights reserved.
//
#define itemW 30
#define itemH 40

#import "APSetPaymentPWDVC.h"
#import "APSetCompletedPaymentPwdVC.h"
@interface APSetPaymentPWDVC () <UITextViewDelegate>
@property(nonatomic, assign) NSInteger passwordCount;
@property(nonatomic, strong) NSMutableArray *passwordItemArr;
@property(nonatomic, assign) BOOL isPush;

@end

@implementation APSetPaymentPWDVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=L(@"Sign Up");
    _passwordCount = 6;
    [self createUI];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.isPush=YES;
}

- (void)createUI {
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *titleLbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 64+20, kWidth, 20)];
    titleLbl.text = L(@"Set Payment Password");
    titleLbl.textAlignment = 1;
    titleLbl.font = [UIFont boldSystemFontOfSize:16];
    titleLbl.textColor = ThemeColor;
    [self.view addSubview:titleLbl];
    
    [self addPasswordView];
}

- (void)addPasswordView {
    CGFloat midPadding = 10;
    CGFloat leftPadding = (kWidth - midPadding*(_passwordCount - 1) - itemW *_passwordCount) / 2;
    self.passwordItemArr = [NSMutableArray new];
    for (int i = 0; i < _passwordCount; i ++) {
        UIView *itemView = [[UIView alloc]initWithFrame:CGRectMake(leftPadding + i*(midPadding + itemW), 64+70, itemW, itemH)];
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
        
        [self.view addSubview:itemView];
        [self.passwordItemArr addObject:itemView];
    }
    
    NSString *tipText = L(@"For your safety, you need to set your payment password. Input your payment password when you make transaction");
    CGSize tipSize = [tipText sizeWithFont:[UIFont systemFontOfSize:12] maxSize:CGSizeMake(kWidth - 100, 1000)];
    
    UILabel *tipLbl = [[UILabel alloc]initWithFrame:CGRectMake(50, 64+70+itemH+30, kWidth - 100, tipSize.height)];
    tipLbl.numberOfLines = 0;
    tipLbl.text = tipText;
    tipLbl.lineBreakMode = NSLineBreakByWordWrapping;
    tipLbl.textColor =[UIColor grayColor];
    tipLbl.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:tipLbl];
    
    UITextView *fakerTV=[[UITextView alloc]initWithFrame:CGRectMake(leftPadding, 64+70, kWidth - 2 * leftPadding, itemH)];
    fakerTV.hidden=YES;
    fakerTV.textColor = [UIColor clearColor];
    fakerTV.keyboardType = UIKeyboardTypeNumberPad;
    fakerTV.delegate = self;
    fakerTV.tag = 105;
//    [fakerTV becomeFirstResponder];
    [self.view addSubview:fakerTV];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
    });

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGFloat midPadding = 10;
    CGFloat leftPadding = (kWidth - midPadding*(_passwordCount - 1) - itemW *_passwordCount) / 2;
    CGPoint p =[touches.anyObject locationInView:self.view];
    CGRect passwordFrame = CGRectMake(leftPadding, 64+70, kWidth - 2 * leftPadding, itemH);
    UITextView *tv = [self.view viewWithTag:105];
    if (CGRectContainsPoint(passwordFrame, p)) {
        [tv becomeFirstResponder];
    }
    else{
        [tv endEditing:YES];
    }
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
    [self.view layoutSubviews];
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    NSString *willBecomeStr = [textView.text stringByReplacingCharactersInRange:range withString:text];
    if (willBecomeStr.length >= 6) {
        if (self.isPush) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                APSetCompletedPaymentPwdVC *vc=[[APSetCompletedPaymentPwdVC alloc]init];
                NSString *pwd= [willBecomeStr substringToIndex:6];
                vc.pwd=pwd;
                textView.text  = pwd;
                [textView endEditing:YES];
                [self.navigationController pushViewController:vc animated:YES];
            });
            self.isPush = NO;
        }
        else{
            
        }
        textView.text = willBecomeStr;
        [self textViewDidChange:textView];
        return NO;
    }
    else{
        return YES;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
