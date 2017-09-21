//
//  APChangePwdVC.m
//  APay_User
//
//  Created by huangjinyang on 17/9/20.
//  Copyright © 2017年 jinx. All rights reserved.
//

#import "APChangePwdVC.h"
#import "APChangePwdModel.h"
#import "APPwdCell.h"
#import "UIAlertView+AlertCallBlock.h"
#import "APVerificationCodeVC.h"
#import "APRegisterVC.h"

@interface APChangePwdVC ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableView;

@property(nonatomic, strong) NSMutableArray *tableViewArr;
@property(nonatomic, strong) APChangePwdModel *pwdModel;
@end

@implementation APChangePwdVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = L(@"Change Password");
    self.view.backgroundColor = [UIColor whiteColor];
    [self createUI];
    // Do any additional setup after loading the view.
}

- (void)createUI {
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, kWidth, kHeight - 64-59) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.tableFooterView = [UIView new];
    
    self.pwdModel = [[APChangePwdModel alloc]init];
    [self.view addSubview:self.tableView];
    
    UIButton *bottomBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, kHeight - 59, kWidth, 59)];
    [bottomBtn setTitle:@"SUBMIT" forState:UIControlStateNormal];
    [bottomBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    bottomBtn.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    bottomBtn.backgroundColor = ThemeColor;
    [bottomBtn addTarget:self action:@selector(submitAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bottomBtn];
}

#pragma mark - private method

- (void)submitAction {
    
//    [MBProgressHUD showMessage:@"submit"];
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:L(@"Information") message:L(@"Password you input is not the same, please try again") delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    alert.callBack = ^(UIAlertView * alert,NSInteger integer){
        APRegisterVC *vc = [[APRegisterVC alloc]init];
        vc.curType = 1;
        [self.navigationController pushViewController:vc animated:YES];
    };
    [alert show];
}

#pragma mark - tableView delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tableViewArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 74;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    APPwdCell *cell = [APPwdCell cellFromTable:tableView];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    UITextField *tf = [cell.contentView viewWithTag:151];
    tf.placeholder = [self placeholderArr][indexPath.row];
    tf.text = self.tableViewArr[indexPath.row];
    cell.tfBlock = ^(NSString *str){
        if (indexPath.row == 0) {
            self.pwdModel.oldPwd = str;
        }
        else if (indexPath.row == 1){
            self.pwdModel.updatePwd = str;
        }
        else{
            self.pwdModel.updatePwdAgain = str;
        }
    };
    
    return cell;
}



#pragma mark - Getter

-(NSArray *)placeholderArr{
    return @[L(@"Input Old Password"),L(@"Input New Password"),L(@"Confirm New Password")];
}

-(NSMutableArray *)tableViewArr{
    _tableViewArr = [APChangePwdModel arrFromModel:self.pwdModel];
    return _tableViewArr;
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
