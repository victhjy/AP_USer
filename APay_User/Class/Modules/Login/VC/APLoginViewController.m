//
//  APLoginViewController.m
//  APay_User
//
//  Created by huangjinyang on 17/9/9.
//  Copyright © 2017年 jinx. All rights reserved.
//

#import "APLoginViewController.h"
#import "APRegisterVC.h"
#import "APMainViewVC.h"
@interface APLoginViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *bgView;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumTf;
@property (weak, nonatomic) IBOutlet UITextField *passwordTf;
@property (weak, nonatomic) IBOutlet UIButton *hidePasswordBtn;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UILabel *versionLbl;
@property (weak, nonatomic) IBOutlet UILabel *registerLbl;


@end

@implementation APLoginViewController

//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES];
//}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];

    self.phoneNumTf.borderStyle=UITextBorderStyleNone;
    self.passwordTf.borderStyle=UITextBorderStyleNone;
    
    [self.phoneNumTf setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    
    [self.passwordTf setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];

   [self.phoneNumTf setValue:[UIFont systemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    
    [self.hidePasswordBtn setImage:[UIImage imageNamed:@"Shapewhite"] forState:UIControlStateNormal];
    [self.hidePasswordBtn addTarget:self action:@selector(hidePasswordBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    self.passwordTf.secureTextEntry = YES;
    
    self.phoneNumTf.keyboardType=UIKeyboardTypeNamePhonePad;
    
    if (isIndonesia) {
        self.phoneNumTf.placeholder = @"Nomor Telepon";
        self.passwordTf.placeholder=@"Kata Sandi";
        [self.loginBtn setTitle:@"MASUK" forState:UIControlStateNormal];
    }
    else{
        self.phoneNumTf.placeholder =@"Phone Number";
        self.passwordTf.placeholder=@"Password";
        [self.loginBtn setTitle:@"SIGN IN" forState:UIControlStateNormal];
    }
    
    self.loginBtn.layer.masksToBounds=YES;
    self.loginBtn.layer.cornerRadius=4;

    
    [self.loginBtn setTitleColor:ThemeColor forState:UIControlStateNormal];
    self.loginBtn.titleLabel.font=self.registerLbl.font;
    
    
    
    
    self.versionLbl.text=[NSString stringWithFormat:@"V %@",[APPManager share].appVersion];
    
    self.registerLbl.userInteractionEnabled=YES;
    __weak __typeof(self)weakSelf = self;
    [self.registerLbl addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
        APLog(@"register");
        APRegisterVC *vc=[[APRegisterVC alloc]init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    }];
    self.bgView.userInteractionEnabled=YES;
    [self.bgView addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
        [self.view endEditing:YES];
    }];
    // Do any additional setup after loading the view from its nib.
}

#pragma mark - private button

- (void)hidePasswordBtnClicked {
    self.hidePasswordBtn.selected=!self.hidePasswordBtn.selected;
    if (self.hidePasswordBtn.selected) {
        self.passwordTf.secureTextEntry = YES;
        [self.hidePasswordBtn setImage:[UIImage imageNamed:@"Shape"] forState:UIControlStateNormal];
    }else{
        self.passwordTf.secureTextEntry = NO;
        [self.hidePasswordBtn setImage:[UIImage imageNamed:@"Shapewhite"] forState:UIControlStateNormal];
    }
}
- (IBAction)loginAction:(id)sender {
    APMainViewVC *mainVC=[[APMainViewVC alloc]init];
    mainVC.firstShow = YES;
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:mainVC];
    [UIApplication sharedApplication].keyWindow.rootViewController = nav;
//    [self.navigationController pushViewController:mainVC animated:YES];
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
