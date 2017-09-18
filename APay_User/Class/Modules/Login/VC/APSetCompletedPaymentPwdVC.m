//
//  APSetCompletedPaymentPwdVC.m
//  APay_User
//
//  Created by huangjinyang on 17/9/14.
//  Copyright © 2017年 jinx. All rights reserved.
//

#import "APSetCompletedPaymentPwdVC.h"
#import "APMainViewVC.h"
@interface APSetCompletedPaymentPwdVC ()

@end

@implementation APSetCompletedPaymentPwdVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=L(@"Sign Up");
    self.view.backgroundColor = [UIColor whiteColor];
    [self createUI];
    // Do any additional setup after loading the view.
}


- (void)createUI {
    UIImageView *iv = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ic_emoji"]];
    CGFloat imagew = 60;
    iv.frame = CGRectMake(kWidth/2 - imagew/2, 64+55, imagew, imagew);
    [self.view addSubview:iv];
    
    NSString *tipText = [NSString stringWithFormat:L(@"Hi %@, this is your payment password. Please keep it carefully"),@"User"];
    CGSize tipSize =[tipText sizeWithFont:[UIFont systemFontOfSize:13] maxSize:CGSizeMake(kWidth-100, 500)];
    UILabel *tipLbl = [[UILabel alloc]initWithFrame:CGRectMake(50, 64+55+imagew+30, kWidth-100,tipSize.height)];
    tipLbl.font = [UIFont systemFontOfSize:13];
    tipLbl.text = tipText;
    tipLbl.numberOfLines = 0;
    tipLbl.lineBreakMode = NSLineBreakByCharWrapping;
    tipLbl.textColor = [UIColor grayColor];
    [self.view addSubview:tipLbl];
    
    CGSize pwdSize = [self.pwd sizeWithFont:[UIFont systemFontOfSize:22] maxSize:CGSizeMake(kWidth/2, 100)];
    UIView *pwdBgView=[[UIView alloc]initWithFrame:CGRectMake(kWidth/2 - (pwdSize.width+40)/2, CGRectGetMaxY(tipLbl.frame)+30, pwdSize.width + 40, pwdSize.height+40)];
    pwdBgView.backgroundColor=ThemeColor;
    pwdBgView.layer.masksToBounds = YES;
    pwdBgView.layer.cornerRadius = 4;
    
    UILabel *pwdLbl=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, pwdBgView.width, pwdSize.height)];
    pwdLbl.font = [UIFont boldSystemFontOfSize:22];
    pwdLbl.textColor = [UIColor whiteColor];
    pwdLbl.text = self.pwd;
    pwdLbl.centerY = pwdBgView.height/2;
    pwdLbl.textAlignment = 1;
    [pwdBgView addSubview:pwdLbl];
    
    [self.view addSubview:pwdBgView];
    
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, kHeight-59, kWidth, 59)];
    [btn setTitle:@"OK" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont boldSystemFontOfSize:17];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(submitAction:) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = ThemeColor;
    [self.view addSubview:btn];
}

- (void)submitAction:(UIButton *)sender {
    APMainViewVC *mainVC=[[APMainViewVC alloc]init];
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:mainVC];
    [UIApplication sharedApplication].keyWindow.rootViewController = nav;
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
