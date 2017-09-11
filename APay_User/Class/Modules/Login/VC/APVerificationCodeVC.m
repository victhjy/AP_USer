//
//  APVerificationCodeVC.m
//  APay_User
//
//  Created by huangjinyang on 17/9/10.
//  Copyright © 2017年 jinx. All rights reserved.
//

#import "APVerificationCodeVC.h"
#import "APRegisterInfoVC.h"

@interface APVerificationCodeVC ()
@property (weak, nonatomic) IBOutlet UILabel *inputYourCodeLbl;
@property (weak, nonatomic) IBOutlet UITextField *textfield;
@property (weak, nonatomic) IBOutlet UIView *tfBgView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UILabel *nextLabel;
@property (weak, nonatomic) IBOutlet UIButton *resendBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *restbBtnWidth;
@property(nonatomic, assign) NSInteger curSec;

@property(nonatomic, strong) NSTimer *timer;

@end

@implementation APVerificationCodeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=L(@"Sign Up");
    
    self.inputYourCodeLbl.textColor=ThemeColor;
    self.inputYourCodeLbl.text = L(@"Input your verification code");
    
    self.tfBgView.backgroundColor=[APTools colorWithHexString:@"e9e8e8"];
    self.tfBgView.layer.masksToBounds=YES;
    self.tfBgView.layer.cornerRadius=6;
    
    self.textfield.borderStyle=0;
    
    self.resendBtn.backgroundColor=ThemeColor;
    self.resendBtn.layer.masksToBounds=YES;
    self.resendBtn.layer.cornerRadius=4;
    [self.resendBtn setTitle:L(@"Resend Code") forState:UIControlStateNormal];
    
    self.bottomView.backgroundColor=ThemeColor;
    self.nextLabel.text=L(@"NEXT");
    
    self.curSec = 5;
    
    self.bottomView.userInteractionEnabled=YES;
    self.nextLabel.userInteractionEnabled=YES;
    __weak __typeof(self)weakSelf = self;
    [self.bottomView addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
        APRegisterInfoVC *infoVC=[[APRegisterInfoVC alloc]init];
        [weakSelf.navigationController pushViewController:infoVC animated:YES];
    }];
    [self.nextLabel addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
        APRegisterInfoVC *infoVC=[[APRegisterInfoVC alloc]init];
        [weakSelf.navigationController pushViewController:infoVC animated:YES];
    }];
    [self.view addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
        [weakSelf.view endEditing:YES];
    }];
    
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)resendClicked:(id)sender {
    NSString *btnTitle=[NSString stringWithFormat:L(@"Resend code in %lds"),self.curSec];
    
    CGSize titleSize=[btnTitle sizeWithFont:[UIFont systemFontOfSize:13] maxSize:CGSizeMake(kWidth/2, 30)];
    
    self.resendBtn.backgroundColor = [UIColor lightGrayColor];
    [self.resendBtn setTitle:btnTitle forState:UIControlStateNormal];
    
    self.restbBtnWidth.constant = titleSize.width + 30;
    
    __weak __typeof(self)weakSelf = self;
     self.timer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
         if(weakSelf.curSec > -1){
             NSString *dynamicTitle=[NSString stringWithFormat:L(@"Resend code in %lds"),self.curSec];
             [weakSelf.resendBtn setTitle:dynamicTitle forState:UIControlStateNormal];
             weakSelf.curSec -- ;
             weakSelf.resendBtn.userInteractionEnabled=NO;
         }
         else{
             [timer invalidate];
             [weakSelf.resendBtn setTitle:L(@"Resend Code") forState:UIControlStateNormal];
             weakSelf.curSec = 5;
             weakSelf.resendBtn.backgroundColor=ThemeColor;
             weakSelf.restbBtnWidth.constant = 90;
             weakSelf.resendBtn.userInteractionEnabled=YES;
         }
     }];
    [self.timer fire];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.textfield becomeFirstResponder];
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
