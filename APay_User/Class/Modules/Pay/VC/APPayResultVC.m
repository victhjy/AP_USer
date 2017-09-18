//
//  APPayResultVC.m
//  APay_User
//
//  Created by huangjinyang on 17/9/15.
//  Copyright © 2017年 jinx. All rights reserved.
//

#import "APPayResultVC.h"
#import "APPayResultHeaderCell.h"
#import "APModel.h"
#import "APPayResultDetailCell.h"
#import "APPayNoteCell.h"
@interface APPayResultVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSMutableArray *tableViewArr;
@end

@implementation APPayResultVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = L(@"Payment Details");
    [self createUI];
    // Do any additional setup after loading the view.
}

- (void)createUI {
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, kWidth, kHeight - 64 - 59) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    
    
    UIButton *bottomBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, kHeight - 59, kWidth, 59)];
    bottomBtn.backgroundColor = ThemeColor;
    if (self.success) {
        [bottomBtn setTitle:@"OK" forState:UIControlStateNormal];
    }
    else{
        [bottomBtn setTitle:L(@"Try Again") forState:UIControlStateNormal];
    }
    [bottomBtn addTarget:self action:@selector(bottomBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [bottomBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    bottomBtn.titleLabel.font = [UIFont systemFontOfSize:17];
    
    [self.view addSubview:bottomBtn];
}

#pragma mark - btn Action

- (void)bottomBtnClicked:(UIButton *)sender {
    if (self.success) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    else{
        APPayResultVC *failueVC=[[APPayResultVC alloc]init];
        failueVC.success = YES;
        [self.navigationController pushViewController:failueVC animated:YES];
    }
}

#pragma mark - tableView delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 156;
    }
    else if(indexPath.row == 1){
        return 40;
    }
    else if (indexPath.row == 2){
        return 80;
    }
    else{
        return 160;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    APModel *model = [[APModel alloc] init];
    if (self.success) {
        model.fakerStr = self.price?:@"100";
    }
    else{
        model.fakerStr = self.price?:@"100";
    }

    if (indexPath.row == 0) {
        APPayResultHeaderCell *cell = [APPayResultHeaderCell cellFromTable:self.tableView];
                [cell setModel:model];
        return cell;
    }
    else if (indexPath.row == 1){
        static NSString *identifier = @"cell1";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        }
        UILabel *paymentTitleLbl = [[UILabel alloc]initWithFrame:CGRectMake(13, 0, kWidth/2, 44)];
        paymentTitleLbl.font = [UIFont boldSystemFontOfSize:16];
        paymentTitleLbl.text = L(@"Payment Method");
//        [paymentTitleLbl sizeToFit];
        [cell.contentView addSubview:paymentTitleLbl];
        
        UILabel *paymentLbl = [[UILabel alloc]initWithFrame:CGRectMake(kWidth/2, 0, kWidth/2 - 5, 44)];
        paymentLbl.textColor = [APTools colorWithHexString:@"9b9b9b"];
        paymentLbl.font = [UIFont systemFontOfSize:16];
        paymentLbl.textAlignment = 2;
        paymentLbl.text = [APTools getRandomNumber:50000695 to:700000898];
        [cell.contentView addSubview:paymentLbl];
        
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 43.5, kWidth, 0.5)];
        line.backgroundColor = [UIColor lightGrayColor];
        [cell.contentView addSubview:line];
        
        return cell;
    }
    else if (indexPath.row == 2){
        APPayResultDetailCell *cell = [APPayResultDetailCell cellFromTable:tableView];
        [cell setModel:model];
        return cell;
    }
    else{
        APPayNoteCell *cell = [APPayNoteCell cellFromTable:tableView];
//        [cell setModel:model];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
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
