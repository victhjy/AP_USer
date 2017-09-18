//
//  APBalanceMainVC.m
//  APay_User
//
//  Created by huangjinyang on 17/9/18.
//  Copyright © 2017年 jinx. All rights reserved.
//
#define headerViewH kWidth*0.736

#import "APBalanceMainVC.h"
#import "APBalanceCell.h"
#import "APModel.h"
@interface APBalanceMainVC ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong) UIView *headerView;
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, assign) NSInteger fakerRows;

@property(nonatomic, strong) UIView *emptyView;

@end

@implementation APBalanceMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = L(@"Balance");
    self.view.backgroundColor = [UIColor whiteColor];
    self.fakerRows = 3;
    [self createUI];
    // Do any additional setup after loading the view.
}


// header 0.47* height    table 0.53* height
- (void)createUI {
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.headerView = [self createHeaderView];
    [self.view addSubview:self.headerView];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64 + headerViewH, kWidth, kHeight - 64 - headerViewH) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    
    [self.view addSubview:self.emptyView];
    
    
}

#pragma mark - tableView delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.fakerRows;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    APModel *model = [[APModel alloc]init];
    model.fakerStr = [NSString stringWithFormat:@"%d",arc4random()%123456];
    APBalanceCell *cell = [APBalanceCell cellFromTable:tableView];
    
    [cell setModel:model];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (UITableViewCellEditingStyleDelete == editingStyle) {
        [self.tableView beginUpdates];
        self.fakerRows--;
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
        if (self.fakerRows == 0) {
            self.tableView.hidden = YES;
            self.emptyView.hidden = NO;
        }
        [self.tableView endUpdates];
    }
}

#pragma mark - private method

- (UIView *)createHeaderView {
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 64, kWidth, headerViewH)];
    view.backgroundColor= [UIColor whiteColor];
    
    UIImageView *iv = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"apaygrey"]];
    [view addSubview:iv];
    
    UILabel *titleLbl = [[UILabel alloc]init];
    titleLbl.text = L(@"My Balance");
    titleLbl.font = [UIFont systemFontOfSize:13];
    [view addSubview:titleLbl];
    
    UIImageView *iconIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ic_balancedetails"]];
    [view addSubview:iconIV];
    
    UILabel *amountLbl = [[UILabel alloc]init];
    amountLbl.textColor = ThemeColor;
    amountLbl.text = [NSString stringWithFormat:@"Rp.%d",12345];
    amountLbl.font = [UIFont systemFontOfSize:36];
    [view addSubview:amountLbl];
    
    CGFloat btnW = (kWidth - 100) / 2;
    CGFloat btnH = btnW * 37 / 122;
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImageView *btn1Iv = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ic_walletwhite"]];
    btn1Iv.frame = CGRectMake(20, 0, 20, 20);
    btn1Iv.centerY = btnH/2;
    UILabel *btn1Lbl = [[UILabel alloc]initWithFrame:CGRectMake(btn1Iv.ap_right+10, 0, 80, 20)];
    btn1Lbl.text =L(@"TOP UP");
    btn1Lbl.textColor = [UIColor whiteColor];
    btn1Lbl.font = [UIFont boldSystemFontOfSize:16];
    btn1Lbl.centerY = btnH/2 + 2;
    [btn1 addSubview:btn1Iv];
    [btn1 addSubview:btn1Lbl];
    if (kWidth == 320) {
        btn1Iv.mj_x -= 10;
        btn1Lbl.mj_x -= 10;
    }
    btn1.backgroundColor = [APTools colorWithHexString:@"46bd35"];
    btn1.layer.masksToBounds = YES;
    btn1.layer.cornerRadius = 4;
    [view addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
//    [btn2 setImage:[UIImage imageNamed:@"ic_withdrawwhite"] forState:UIControlStateNormal];
//    [btn2 setTitle:L(@"Withdraw") forState:UIControlStateNormal];
//    [btn2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    btn2.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    
    UIImageView *btn2Iv = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ic_withdrawwhite"]];
    btn2Iv.frame = CGRectMake(20, 0, 20, 20);
    btn2Iv.centerY = btnH/2+1;
    UILabel *btn2Lbl = [[UILabel alloc]initWithFrame:CGRectMake(btn2Iv.ap_right+10, 0, 80, 20)];
    btn2Lbl.text =L(@"Withdraw");
    btn2Lbl.textColor = [UIColor whiteColor];
    btn2Lbl.font = [UIFont boldSystemFontOfSize:16];
    btn2Lbl.centerY = btnH/2 +2;
    [btn2 addSubview:btn2Iv];
    [btn2 addSubview:btn2Lbl];
    if (kWidth == 320) {
        btn2Iv.mj_x -= 10;
        btn2Lbl.mj_x -= 10;
    }
    btn2.layer.masksToBounds = YES;
    btn2.layer.cornerRadius = 4;
    btn2.backgroundColor = ThemeColor;
    [view addSubview:btn2];
    
    [iv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(view.mas_top).offset(20);
        make.centerX.mas_equalTo(view);
        make.size.mas_equalTo(CGSizeMake(60, 22));
    }];
    [titleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(iv.mas_bottom);
        make.centerX.mas_equalTo(view);
    }];
    [iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(titleLbl.mas_bottom).offset(30);
        make.centerX.mas_equalTo(view);
        make.size.mas_equalTo(CGSizeMake(28, 28));
    }];
    [amountLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(view);
        if (isIphone4 || isIphone5) {
            make.top.mas_equalTo(iconIV.mas_bottom).offset(20);
        }
        else{
            make.top.mas_equalTo(iconIV.mas_bottom).offset(30);
        }
    }];
    
   
    [btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view.mas_left).offset(40);
        make.bottom.mas_equalTo(view.mas_bottom).offset(-20);
        make.size.mas_equalTo(CGSizeMake(btnW, btnH));
    }];
    
    [btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view.mas_left).offset(40 + btnW + 20);
        make.bottom.mas_equalTo(view.mas_bottom).offset(-20);
        make.size.mas_equalTo(CGSizeMake(btnW, btnH));

    }];
    
    UIView *line = [[UIView alloc]init];
    line.backgroundColor = [APTools colorWithHexString:@"9b9b9b"];
    line.alpha = 0.3;
    [view addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(view);
        make.height.mas_equalTo(3);
    }];
    
    return view;
}


#pragma mark - Getter

-(UIView *)emptyView{
    if (!_emptyView) {
        _emptyView = [[UIView alloc]initWithFrame:self.tableView.frame];
        UIImageView *iv = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ic_emojiSmall"]];
        iv.frame = CGRectMake(kWidth/2 - 25, _emptyView.height/2 - 70, 50, 50);
        [_emptyView addSubview:iv];
        UILabel *lbl = [[UILabel alloc]init];
        lbl.text =[NSString stringWithFormat:L(@"Hi %@, your Top Up and Withdraw history will show up here"),@"User"];
        lbl.textAlignment = 1;
        lbl.numberOfLines = 0;
        lbl.font = [UIFont systemFontOfSize:16];
        lbl.textColor = [APTools colorWithHexString:@"9b9b9b"];
        CGSize lblSize = [lbl.text sizeWithFont:lbl.font maxSize:CGSizeMake(kWidth - 120, 200)];
        lbl.frame = CGRectMake(60, _emptyView.height/2 , kWidth - 120, lblSize.height);
        
        [_emptyView addSubview:lbl];
        _emptyView.hidden = YES;
    }
    return _emptyView;
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
