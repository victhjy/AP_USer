//
//  APMainViewVC.m
//  APay_User
//
//  Created by huangjinyang on 17/9/11.
//  Copyright © 2017年 jinx. All rights reserved.
//

#import "APMainViewVC.h"
#import "APMainCell.h"
#import "APMainModel.h"
#import "APMainScrollCell.h"
#import "NBZXingQRViewController.h"
#import "APMainPopView.h"
#import "APNavigationController.h"
#import "APLoginViewController.h"
#import "APBalanceMainVC.h"
#import "APTransactions.h"
#import "APPayAssistantCell.h"
#import "APMyAccountVC.h"
#import "APSettingVC.h"

@interface APMainViewVC ()<UITableViewDelegate,UITableViewDataSource,NBZXingQRViewControllerDelegate>
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSMutableArray *tableViewArr;
@property(nonatomic, strong) APMainModel *mainModel;

@end

@implementation APMainViewVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    UIView *titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 11, 60, 22)];
    UIImageView *titleV =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"apaytitle"]];
    titleV.frame = CGRectMake(0, 0, 60, 22);
    [titleView addSubview:titleV];
//    titleView.backgroundColor = [UIColor redColor];
    self.navigationItem.titleView = titleView;
    [self.view addSubview:self.tableView];
    self.automaticallyAdjustsScrollViewInsets=NO;
    self.navigationItem.hidesBackButton=YES;
    
    
    if (self.firstShow) {
        [self showPop];
    }
    // Do any additional setup after loading the view.
}

- (void)showPop {
    CGFloat popWidth = kWidth - 40;
    APMainPopView *popView = [[APMainPopView alloc]initWithFrame:CGRectMake(0, 0, popWidth, popWidth * 0.875)];
    popView.center = CGPointMake(kWidth/2, kHeight/2);
    __weak __typeof(APMainPopView *)weakPopView = popView;
    popView.block=^{
        [weakPopView removeFromSuperview];
        [MBProgressHUD showSuccess:@"topup"];
        
    };
    [[UIApplication sharedApplication].keyWindow addSubview:popView];
}

#pragma mark - TableView delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return self.tableViewArr.count;
    }
    else{
        return 1;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return kWidth/3;
    }
    else{
        return kWidth*0.367;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        static NSString *identifier = @"cell";
        APMainCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[APMainCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.dataArr=self.tableViewArr[indexPath.row];
        
        __weak __typeof(self)weakSelf = self;
        cell.clickedItem=^(NSInteger index){
            [weakSelf itemAction:(indexPath.row * 3)+index];
        };
        return cell;
    }
    else if(indexPath.section == 1){
        static NSString *section1Iden=@"cellSection1";
        APMainScrollCell *cell = [tableView dequeueReusableCellWithIdentifier:section1Iden];
        if (!cell) {
            cell = [[APMainScrollCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:section1Iden];
        }
        __weak __typeof(self)weakSelf = self;
        cell.dataArr=[@[@"123",@"1333",@"1"] mutableCopy];
        cell.block=^(NSInteger clickedIndex){
            [weakSelf scrollImageClicked:clickedIndex];
        };
        return cell;
    }
    else if (indexPath.section == 2){
        APPayAssistantCell *cell = [APPayAssistantCell cellFromTable:tableView];
        APModel *model = [[APModel alloc]init];
        [cell setModel:model];
        return cell;
    }
    else{
        return nil;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - private method

- (void)itemAction:(NSInteger)index {
    APLog(@"%ld",index);
    if (index == 2) {
        NBZXingQRViewController *scanVC=[[NBZXingQRViewController alloc]init];
//        scanVC.delegate=self;
        [self.navigationController pushViewController:scanVC animated:YES];
    }
    else if (index == 0){
        APBalanceMainVC *balanceVC = [[APBalanceMainVC alloc]init];
        [self.navigationController pushViewController:balanceVC animated:YES];
    }
    else if (index == 3){
        APTransactions *transactionsVC = [[APTransactions alloc] init];
        [self.navigationController pushViewController:transactionsVC animated:YES];
    }
    else if (index == 4){
        APMyAccountVC *accountVC = [[APMyAccountVC alloc]init];
        [self.navigationController pushViewController:accountVC animated:YES];
    }
    else if (index == 5){
        APSettingVC * settingVC = [[APSettingVC alloc]init];
        [self.navigationController pushViewController:settingVC animated:YES];
    }
}

- (void)scrollImageClicked:(NSInteger)index {
    APLog(@"%ld",index);
    if (index == 2) {
        [self showPop];
    }
    else if (index == 1){
        APNavigationController *navVC=[[APNavigationController alloc]initWithRootViewController:[[APLoginViewController alloc]init]];
        [UIApplication sharedApplication].keyWindow.rootViewController=navVC;
    }
}


#pragma mark - Getter

-(NSMutableArray *)tableViewArr{
    _tableViewArr =[APMainModel defaultTableViewArrWithModel:self.mainModel];
    return _tableViewArr;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, kWidth, kHeight - 64) style:UITableViewStylePlain];
        _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        _tableView.tableFooterView=[UIView new];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        CGFloat footerH = kHeight - 64 - (kWidth*0.367*2 + kHeight/3);
        
        UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kWidth, footerH)];
        imageV.image =[UIImage imageNamed:@"lowBg"];
//        _tableView.tableFooterView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"lowBg"]];
        _tableView.tableFooterView = imageV;

    }
    return _tableView;
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
