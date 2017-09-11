//
//  APRegisterInfoVC.m
//  APay_User
//
//  Created by huangjinyang on 17/9/11.
//  Copyright © 2017年 jinx. All rights reserved.
//

#import "APRegisterInfoVC.h"

@interface APRegisterInfoVC ()
@property (weak, nonatomic) IBOutlet UILabel *userNameLbl;
@property (weak, nonatomic) IBOutlet UITextField *userNameTf;
@property (weak, nonatomic) IBOutlet UITextField *passwordTf1;
@property (weak, nonatomic) IBOutlet UILabel *passwordLbl;
@property (weak, nonatomic) IBOutlet UITextField *passwordTf2;
@property (weak, nonatomic) IBOutlet UITextField *invateCodeTf;
@property (weak, nonatomic) IBOutlet UILabel *invateLbl1;
@property (weak, nonatomic) IBOutlet UILabel *invateLbl2;
@property (weak, nonatomic) IBOutlet UIImageView *password1Hide;
@property (weak, nonatomic) IBOutlet UIImageView *password2Hide;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UILabel *bottonNextLbl;

@end

@implementation APRegisterInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=L(@"Sign Up");
    
    self.userNameLbl.text=L(@"Username");
    self.userNameLbl.textColor=ThemeColor;
    self.userNameTf.borderStyle=0;
    self.userNameTf.placeholder=L(@"Input Username");
    
    self.passwordLbl.text=L(@"Password");
    self.passwordLbl.textColor=ThemeColor;
    
    self.passwordTf1.borderStyle=0;
    self.passwordTf1.placeholder=L(@"Input Password");
    
    self.passwordTf2.borderStyle=0;
    self.passwordTf2.placeholder=L(@"Confirm Password");
    
    self.invateLbl1.text = L(@"Invitation Code");
    self.invateLbl2.text = L(@"(optional)");
    self.invateLbl1.textColor=ThemeColor;
    
    self.invateCodeTf.borderStyle = 0;
    self.invateCodeTf.placeholder = L(@"Input Invitation Code");
    
    self.bottonNextLbl.text = L(@"NEXT");
    
    self.bottomView.backgroundColor=ThemeColor;
    
    __weak __typeof(self)weakSelf = self;
    [self.view addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
        [weakSelf.view endEditing:YES];
    }];
    // Do any additional setup after loading the view from its nib.
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
