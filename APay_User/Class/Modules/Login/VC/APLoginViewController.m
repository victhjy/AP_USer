//
//  APLoginViewController.m
//  APay_User
//
//  Created by huangjinyang on 17/9/9.
//  Copyright © 2017年 jinx. All rights reserved.
//

#import "APLoginViewController.h"

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

- (void)viewDidLoad {
    [super viewDidLoad];
    self.bgView.image=[UIColor imageWithColor:ThemeColor];

    self.phoneNumTf.borderStyle=UITextBorderStyleNone;
    self.passwordTf.borderStyle=UITextBorderStyleNone;
    
    [self.phoneNumTf setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    
    [self.passwordTf setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    
    [self.hidePasswordBtn setImage:[UIImage imageNamed:@"Shapewhite"] forState:UIControlStateNormal];
    [self.hidePasswordBtn addTarget:self action:@selector(hidePasswordBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    self.passwordTf.secureTextEntry = YES;
    
    self.phoneNumTf.keyboardType=UIKeyboardTypeNamePhonePad;
    
    self.phoneNumTf.placeholder=L(@"Phone Number");
    self.passwordTf.placeholder=L(@"Password");
    
    self.loginBtn.layer.masksToBounds=YES;
    self.loginBtn.layer.cornerRadius=4;

    [self.loginBtn setTitle:L(@"SIGN IN") forState:UIControlStateNormal];
    [self.loginBtn setTitleColor:ThemeColor forState:UIControlStateNormal];
    self.loginBtn.titleLabel.font=self.registerLbl.font;
    
    
    
    
    self.versionLbl.text=[NSString stringWithFormat:@"V %@",[APPManager share].appVersion];
    
    self.registerLbl.userInteractionEnabled=YES;
    [self.registerLbl addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
        APLog(@"register");
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