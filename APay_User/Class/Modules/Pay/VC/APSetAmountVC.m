//
//  APSetAmountVC.m
//  APay_User
//
//  Created by huangjinyang on 17/9/13.
//  Copyright © 2017年 jinx. All rights reserved.
//

#define noteTag 999
#define placeholderTag 888
#define textCountTag 777
#define priceTfTag 666

#import "APSetAmountVC.h"
#import "UITextView+Placeholder.h"
#import <KVOController/FBKVOController.h>
#import "APEnterPaymentView.h"
#import "APPayWrongPwdView.h"
#import "APPayResultVC.h"
@interface APSetAmountVC () <UITextViewDelegate,UITextFieldDelegate>
@property(nonatomic, strong) UITextView *noteView;
@property(nonatomic, strong) FBKVOController *KVOController;
@property(nonatomic, strong) UIView *topBgView;
@property(nonatomic, assign) BOOL firstOpen;
@end

@implementation APSetAmountVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=L(@"Set Amount");
    
    self.firstOpen = YES;
    self.view.backgroundColor=[APTools colorWithHexString:@"e1e1e1"];
    [self createUI];
    __weak __typeof(self)weakSelf = self;
    [self.view addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
        [weakSelf.view endEditing:YES];
    }];
    // Do any additional setup after loading the view.
}

- (void)loadView {
    [super loadView];
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.view = scrollView;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    UITextField *priceTf = [self.view viewWithTag:priceTfTag];
    if (self.firstOpen) {
        [priceTf becomeFirstResponder];
        self.firstOpen = NO;
    }
}

- (void)createUI {
    
    self.topBgView=[[UIView alloc]initWithFrame:CGRectZero];
    self.topBgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.topBgView];
    
    UILabel *amountTitleLbl=[[UILabel alloc]initWithFrame:CGRectMake(20, 20, kWidth/2, 20)];
    amountTitleLbl.textColor=ThemeColor;
    amountTitleLbl.font = [UIFont boldSystemFontOfSize:17];
    amountTitleLbl.text=L(@"Amount");
    [self.topBgView addSubview:amountTitleLbl];
    
    CGSize rpSize=[@"Rp." sizeWithFont:[UIFont systemFontOfSize:30] maxSize:CGSizeMake(kWidth/2, 50)];
    UILabel *priceUnitLbl=[[UILabel alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(amountTitleLbl.frame)+10, rpSize.width, rpSize.height)];
    priceUnitLbl.font=[UIFont systemFontOfSize:30];
    priceUnitLbl.text=@"Rp.";
    priceUnitLbl.tag = 105;
    [self.topBgView addSubview:priceUnitLbl];
    
    UITextField *priceTf=[[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(priceUnitLbl.frame), priceUnitLbl.mj_y, kWidth - 20 - rpSize.width - 20 - rpSize.height+20, rpSize.height)];
    priceTf.placeholder = L(@"Input Amount");
    priceTf.keyboardType = UIKeyboardTypeDecimalPad;
    priceTf.font = priceUnitLbl.font;
    priceTf.tag = priceTfTag;
    priceTf.borderStyle = UITextBorderStyleNone;
    priceTf.delegate = self;
    [priceTf addTarget:self action:@selector(TFChanged:) forControlEvents:UIControlEventEditingChanged];
    [self.topBgView addSubview:priceTf];
    
    
    UIImageView* moneyIconIv=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ic_money"]];
    moneyIconIv.frame=CGRectMake(kWidth-20-rpSize.height, priceUnitLbl.mj_y, rpSize.height*3/4, rpSize.height);
    [self.topBgView addSubview:moneyIconIv];
    
    UIView *line=[[UIView alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(priceUnitLbl.frame)+20, kWidth-40, 0.5)];
    line.backgroundColor=[UIColor lightGrayColor];
    [self.topBgView addSubview:line];
    
    UIView *noteBgView = [[UIView alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(line.frame)+10, kWidth - 40, 105)];
    noteBgView.backgroundColor=[UIColor whiteColor];
    noteBgView.layer.cornerRadius = 2;
    noteBgView.layer.masksToBounds = YES;
    noteBgView.layer.borderWidth = .3;
    noteBgView.layer.borderColor=[UIColor grayColor].CGColor;
    [self.topBgView addSubview:noteBgView];
    
    UITextView *noteView=[[UITextView alloc]initWithFrame:noteBgView.bounds];
    noteView.font=[UIFont systemFontOfSize:17];
    noteView.delegate = self;
    noteView.tag = noteTag;
    [noteBgView addSubview:noteView];
    self.noteView = noteView;
    
    UILabel *placeholderLbl = [[UILabel alloc]initWithFrame:CGRectMake(3, 7, kWidth/2, 20)];
    placeholderLbl.text = L(@"Add note here..");
    placeholderLbl.textColor=[UIColor grayColor];
    placeholderLbl.tag=placeholderTag;
    [noteView addSubview:placeholderLbl];
    
    
    UILabel *textCountLbl =[[UILabel alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(noteBgView.frame), kWidth-40, 20)];
    textCountLbl.textAlignment=2;
    textCountLbl.font=[UIFont systemFontOfSize:14];
    textCountLbl.text=@"0/250";
    textCountLbl.textColor = [UIColor lightGrayColor];
    textCountLbl.tag = textCountTag;
    [self.topBgView addSubview:textCountLbl];

    self.topBgView.frame = CGRectMake(5, 5, kWidth - 10, CGRectGetMaxY(textCountLbl.frame)+5);
    self.topBgView.layer.masksToBounds=YES;
    self.topBgView.layer.cornerRadius = 2;
    
    
    UIButton *confirmBtn = [[UIButton alloc]initWithFrame:CGRectMake(5, CGRectGetMaxY(self.topBgView.frame)+10, kWidth - 10, 52)];
    confirmBtn.backgroundColor = ThemeColor;
    [confirmBtn setTitle:L(@"CONFIRM") forState:UIControlStateNormal];
    confirmBtn.titleLabel.textColor=[UIColor whiteColor];
    confirmBtn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [confirmBtn addTarget:self action:@selector(submitAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:confirmBtn];
    
    
}

#pragma mark - method

- (void)submitAction:(UIButton *)sender {
    if ([APPManager share].paymentTime > 0) {
        APPayWrongPwdView *wrongView = [[APPayWrongPwdView alloc]initWithFrame:CGRectMake(kWidth * 0.13, 115, kWidth * 0.74, kWidth * 0.74 *0.576)];
        [[UIApplication sharedApplication].keyWindow addSubview:wrongView];
    }
    else{
        CGRect popFrame = CGRectMake(kWidth * 0.13, 115, kWidth * 0.74, kWidth * 0.74 *0.576);
        APEnterPaymentView *view = [[APEnterPaymentView alloc]initWithFrame:popFrame andPasswordCount:6];
        __weak __typeof(APEnterPaymentView *)weakView = view;
        view.wrongBlock = ^{
            [weakView removeFromSuperview];
            
            [APPManager share].paymentTime = [[NSDate date] timeIntervalSince1970];
            
            APPayWrongPwdView *wrongView = [[APPayWrongPwdView alloc]initWithFrame:CGRectMake(kWidth * 0.13, 115, kWidth * 0.74, kWidth * 0.74 *0.576)];
            [[UIApplication sharedApplication].keyWindow addSubview:wrongView];
            
        };
        
        view.rightBlock = ^{
            [weakView removeFromSuperview];
            UITextField *tf = [self.view viewWithTag:priceTfTag];
            APPayResultVC *resultVC = [[APPayResultVC alloc]init];
            resultVC.price = tf.text;
            resultVC.success = YES;
            [self.navigationController pushViewController:resultVC animated:YES];
        };
        [[UIApplication sharedApplication].keyWindow addSubview:view];
    }
}

#pragma mark - textView delegate

- (void)textViewDidChange:(UITextView *)textView{
    if (textView.tag == noteTag) {
        UILabel *placeholderLabel = [textView viewWithTag:placeholderTag];
        UILabel *textCountLabel = [self.view viewWithTag:textCountTag];
        textCountLabel.text = [NSString stringWithFormat:@"%ld/250",textView.text.length];
        if (textView.text.length == 0) {
            placeholderLabel.hidden=NO;
        }
        else{
            placeholderLabel.hidden=YES;
        }
    }
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if (textView.tag == noteTag) {
        NSString *willBecomeStr = [textView.text stringByReplacingCharactersInRange:range withString:text];
        if (willBecomeStr.length > 250) {
            return NO;
        }
        else{
            return YES;
        }
    }
    
    return YES;
}

#pragma mark - textfield delegate

-(void)textFieldDidEndEditing:(UITextField *)textField{
    
}

- (void)TFChanged:(UITextField *)textField {
   textField.text = [textField.text stringByReplacingOccurrencesOfString:@"," withString:@""];
    textField.text = textField.text.apMoney;
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
