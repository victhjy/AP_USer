//
//  APSetAmountVC.m
//  APay_User
//
//  Created by huangjinyang on 17/9/13.
//  Copyright © 2017年 jinx. All rights reserved.
//

#import "APSetAmountVC.h"
#import "UITextView+Placeholder.h"
@interface APSetAmountVC () <UITextViewDelegate>

@end

@implementation APSetAmountVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=L(@"Set Amount");
    
    self.view.backgroundColor=[UIColor whiteColor];
    [self createUI];
    // Do any additional setup after loading the view.
}

- (void)createUI {
    UILabel *amountTitleLbl=[[UILabel alloc]initWithFrame:CGRectMake(20, 64+20, kWidth/2, 20)];
    amountTitleLbl.textColor=ThemeColor;
    amountTitleLbl.text=L(@"Amount");
    [self.view addSubview:amountTitleLbl];
    
    CGSize rpSize=[@"Rp." sizeWithFont:[UIFont systemFontOfSize:30] maxSize:CGSizeMake(kWidth/2, 50)];
    UILabel *priceUnitLbl=[[UILabel alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(amountTitleLbl.frame)+10, rpSize.width, rpSize.height)];
    priceUnitLbl.font=[UIFont systemFontOfSize:30];
    priceUnitLbl.text=@"Rp.";
    [self.view addSubview:priceUnitLbl];
    
    UIView *line=[[UIView alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(priceUnitLbl.frame)+20, kWidth-40, 0.5)];
    line.backgroundColor=[UIColor lightGrayColor];
    [self.view addSubview:line];
    
    UIView *noteBgView = [[UIView alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(line.frame)+10, kWidth - 40, 105)];
    noteBgView.backgroundColor=[UIColor whiteColor];
    noteBgView.layer.cornerRadius = 2;
    noteBgView.layer.masksToBounds = YES;
    noteBgView.layer.borderWidth = 0.25;
    [self.view addSubview:noteBgView];
    
    UITextView *noteView=[[UITextView alloc]initWithFrame:noteBgView.bounds];
    noteView.font=[UIFont systemFontOfSize:17];
    noteView.placeholder = L(@"Add note here..");
    noteView.delegate = self;
    [noteBgView addSubview:noteView];
    
    
    UILabel *placeholderLbl = [[UILabel alloc]initWithFrame:CGRectMake(3, 10, kWidth/2, 20)];
    placeholderLbl.text = L(@"Add note here..");
    placeholderLbl.textColor=[UIColor grayColor];
    [noteView addSubview:placeholderLbl];

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
