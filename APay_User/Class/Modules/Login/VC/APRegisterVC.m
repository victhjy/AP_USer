//
//  APRegisterVC.m
//  APay_User
//
//  Created by huangjinyang on 17/9/10.
//  Copyright © 2017年 jinx. All rights reserved.
//

#import "APRegisterVC.h"
@interface APRegisterVC ()
@property (weak, nonatomic) IBOutlet UILabel *phoneNumberLbl;
@property (weak, nonatomic) IBOutlet UILabel *phoneAreaLbl;
@property (weak, nonatomic) IBOutlet UITextField *textfield;
@property (weak, nonatomic) IBOutlet UILabel *agreeLbl;
@property (weak, nonatomic) IBOutlet UILabel *termsAndServiceLbl;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UILabel *nextLbl;
@property (weak, nonatomic) IBOutlet UIView *line;

@end

@implementation APRegisterVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=L(@"Sign Up");
    self.phoneNumberLbl.textColor = ThemeColor;
    self.phoneNumberLbl.text=L(@"Phone Number");
    self.textfield.borderStyle=UITextBorderStyleNone;
    self.textfield.placeholder=L(@"Input Phone Number");
    self.textfield.keyboardType=UIKeyboardTypeNamePhonePad;
    
    self.line.backgroundColor=ThemeColor;
    self.bottomView.backgroundColor=ThemeColor;
    self.nextLbl.text=L(@"NEXT");
    
    
    self.agreeLbl.textColor=[UIColor lightGrayColor];
    self.termsAndServiceLbl.textColor=ThemeColor;
    
    if (isIndonesia) {
        if (self.curType == 0) {
            self.title=@"Daftar";
            self.phoneNumberLbl.text=@"Nomor Telepon";
            self.textfield.placeholder=@"Masukkan Nomor Telepon";
            self.nextLbl.text=L(@"LANJUT");
            self.agreeLbl.text  = @"Dengan mendaftar, saya setuju dengan";
            self.termsAndServiceLbl.text = @"Persyaratan Layanan Kami";
        }
        else{
            self.title=@"Ubah Kata Sandi Pembayaran";
            self.phoneNumberLbl.text=@"Nomor Telepon";
            self.textfield.placeholder=@"Masukkan Nomor Telepon";
            self.nextLbl.text=L(@"LANJUT");
            self.agreeLbl.text  = @"Verifikasi nomor telepon anda untuk atur ulang kode sandi pembayaran";
            self.termsAndServiceLbl.hidden = YES;
//            self.termsAndServiceLbl.text = @"Persyaratan Layanan Kami";
        }
    }
    else{
        if (self.curType == 0) {
            self.title=@"Sign Up";
            self.phoneNumberLbl.text=@"Phone Number";
            self.textfield.placeholder=@"Input Phone Number";
            self.nextLbl.text=@"NEXT";
            self.agreeLbl.text  = @"Signing up means that you agree with";
            self.termsAndServiceLbl.text = @"Our Terms of Service";
        }
        else{
            self.title=@"Change Payment Password";
            self.phoneNumberLbl.text=@"Phone Number";
            self.textfield.placeholder=@"Input Phone Number";
            self.nextLbl.text=@"NEXT";
            self.agreeLbl.text  = @"Verify your phone number to reset your payment password";
            self.termsAndServiceLbl.hidden = YES;
//            self.termsAndServiceLbl.text = @"Persyaratan Layanan Kami";
        }
    }
    
    
    
    
    self.bottomView.userInteractionEnabled=YES;
    self.nextLbl.userInteractionEnabled=YES;
    __weak __typeof(self)weakSelf = self;
    [self.bottomView addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
        APVerificationCodeVC *codeVC=[[APVerificationCodeVC alloc]init];
        codeVC.curType = self.curType;
        [weakSelf.navigationController pushViewController:codeVC animated:YES];
    }];
    [weakSelf.nextLbl addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
        APVerificationCodeVC *codeVC=[[APVerificationCodeVC alloc]init];
        codeVC.curType = self.curType;
        [weakSelf.navigationController pushViewController:codeVC animated:YES];
    }];
    
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
