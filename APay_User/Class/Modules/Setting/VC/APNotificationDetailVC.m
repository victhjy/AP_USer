//
//  APNotificationDetailVC.m
//  APay_User
//
//  Created by huangjinyang on 17/9/19.
//  Copyright © 2017年 jinx. All rights reserved.
//
#define circle kWidth*0.6389

#import "APNotificationDetailVC.h"

@interface APNotificationDetailVC ()

@end

@implementation APNotificationDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = L(@"Details");
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self createUI];
    // Do any additional setup after loading the view.
}

- (void)createUI {
    
    UIImageView *iv = [[UIImageView alloc]initWithImage:[UIImage imageNamed:[APNotificationModel imgName:self.currentType]]];
    [self.view addSubview:iv];
    
    UILabel *titleLbl = [[UILabel alloc]init];
    titleLbl.attributedText = [self attriText];
    titleLbl.textAlignment = 1;
    titleLbl.numberOfLines = 0;
    titleLbl.font = [UIFont systemFontOfSize:19];
    [self.view addSubview:titleLbl];
    
    if (self.currentType == 0) {
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.view).offset(64+10);
            make.centerX.mas_equalTo(self.view);
            make.size.mas_equalTo(CGSizeMake(kWidth*0.636, kWidth*0.636));
        }];
    }
    else if (self.currentType == 1){
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.view).offset(64+30);
            make.centerX.mas_equalTo(self.view);
            make.size.mas_equalTo(CGSizeMake(kWidth*0.472, kWidth*0.472));
        }];
    }
    else if (self.currentType == 2){
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.view).offset(64+10+40);
            make.centerX.mas_equalTo(self.view);
            make.size.mas_equalTo(CGSizeMake(kWidth*0.636, kWidth*0.472));
        }];
    }
    else if (self.currentType == 3){
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.view).offset(64+10+30);
            make.centerX.mas_equalTo(self.view);
            make.size.mas_equalTo(CGSizeMake(kWidth*0.472, kWidth*0.472));
        }];
    }
    else if (self.currentType == 4){
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.view).offset(64+10+30);
            make.centerX.mas_equalTo(self.view);
            make.size.mas_equalTo(CGSizeMake(kWidth*0.636, kWidth*0.472));
        }];
    }
   
    if (self.currentType == 4) {
        titleLbl.text = [NSString stringWithFormat:L(@"Your %@ salary is here"),@"FakerMonth"];
        
        UILabel *salaryLbl = [[UILabel alloc]init];
        salaryLbl.font = [UIFont boldSystemFontOfSize:22];
        salaryLbl.textAlignment = 1;
        NSString *money = [NSString stringWithFormat:@"%d",arc4random()%1234];
        salaryLbl.text = [NSString stringWithFormat:@"+Rp.%@",money.apMoney];
        
        [self.view addSubview:salaryLbl];
        [salaryLbl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(titleLbl.mas_bottom).offset(5);
            make.centerX.mas_equalTo(self.view);
        }];
    }
    else{
        titleLbl.attributedText = [self attriText];
    }
    
    [titleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(10+64+kWidth*0.636+20);
        make.left.mas_equalTo(self.view).offset(30);
        make.width.mas_equalTo(kWidth - 60);
    }];
    
    
    if (self.currentType != 3) {
        CGSize titleSize;
        if (self.currentType <=2 ) {
            titleSize = [L(@"See Details") sizeWithFont:[UIFont boldSystemFontOfSize:17] maxSize:CGSizeMake(kWidth/2, 20)];
        }
        else{
            titleSize = [L(@"My Balance") sizeWithFont:[UIFont boldSystemFontOfSize:17] maxSize:CGSizeMake(kWidth/2, 20)];
        }
        UIButton *btn = [[UIButton alloc]init];
        [btn setTitle:L(@"See Details") forState:UIControlStateNormal];
        btn.layer.masksToBounds = YES;
        btn.layer.cornerRadius = 4;
        btn.backgroundColor = ThemeColor;
        btn.titleLabel.font = [UIFont boldSystemFontOfSize:17];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.view addSubview:btn];
        
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(titleLbl.mas_bottom).offset(40);
            make.size.mas_equalTo(CGSizeMake(titleSize.width + 20, 35));
            make.centerX.mas_equalTo(self.view);
        }];
    }
}

#pragma mark - private method

-(NSMutableAttributedString *)attriText{
    NSString *colorStr = [self coloredStr];
    NSString *fillStr;
    if (self.currentType == 0) {
        fillStr = [NSString stringWithFormat:L(@"Top Up %@ succeed! Thank you for using our services."),colorStr];
    }
    else if (self.currentType == 1){
        fillStr = [NSString stringWithFormat:L(@"Withdraw %@ succeed! Thank you for using our services."),colorStr];
    }
    else if (self.currentType == 2){
        fillStr = [NSString stringWithFormat:L(@"Payment %@ succeed! Thank you for using our services."),colorStr];
    }
    else if (self.currentType == 3){
        fillStr = L(@"Your ID Card is verified! Now you can withdraw your balance.");
        NSMutableAttributedString *resultStr = [[NSMutableAttributedString alloc]initWithString:fillStr];
        return resultStr;
    }
    else if (self.currentType == 4){
        fillStr =[NSString stringWithFormat:L(@"Your %@ salary is here"),@"fakerMonth"];
        NSMutableAttributedString *resultStr = [[NSMutableAttributedString alloc]initWithString:fillStr];
        return resultStr;
    }
    NSMutableAttributedString *resultStr = [[NSMutableAttributedString alloc]initWithString:fillStr];
    
    NSRange rangel = [fillStr rangeOfString:colorStr];
    [resultStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:19] range:NSMakeRange(0, resultStr.length)];
    [resultStr addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:19] range:rangel];

    return resultStr;
}

-(NSString *)coloredStr{
    int money = arc4random()%12345;
    if (self.currentType == 0) {
        NSString *str= [NSString stringWithFormat:@" +Rp.%d ",money];
        return str;
    }
    else{
        NSString *str= [NSString stringWithFormat:@" -Rp.%d ",money];
        return str;
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
