//
//  APSettingVC.m
//  APay_User
//
//  Created by huangjinyang on 17/9/19.
//  Copyright © 2017年 jinx. All rights reserved.
//

#import "APSettingVC.h"
#import "APAccountModel.h"

@interface APSettingVC ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSMutableArray *tableViewArr;
@property(nonatomic, assign) BOOL fakerBool;

@end

@implementation APSettingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = L(@"Settings");
    self.view.backgroundColor = [UIColor whiteColor];
    self.fakerBool = YES;
    [self createUI];
    // Do any additional setup after loading the view.
}

- (void)createUI {
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, kWidth, kHeight - 64) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.tableFooterView = [self footerView];
    
    [self.view addSubview:self.tableView];
}

-(UIView *)footerView{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, kHeight - 64 - self.tableViewArr.count*44)];
    view.backgroundColor = [UIColor whiteColor];
    UILabel * versionLbl = [[UILabel alloc]initWithFrame:CGRectMake(0, view.height - 25 - 14, kWidth, 14)];
    versionLbl.font = [UIFont systemFontOfSize:14];
    versionLbl.textAlignment = 1;
    versionLbl.text = [NSString stringWithFormat:@"V %@",[APPManager share].appVersion];
    versionLbl.textColor = [APTools colorWithHexString:@"4a4a4a"];
    [view addSubview:versionLbl];
    return view;
}

#pragma mark - tableView delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tableViewArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    APAccountModel *model = self.tableViewArr[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:model.menuImageStr];
    cell.textLabel.text = model.menuName;
    cell.textLabel.font = [UIFont systemFontOfSize:18];
    if (indexPath.row == 0) {
        
        UISwitch *switchBar = [[UISwitch alloc]initWithFrame:CGRectMake(0, 0, 44, 40)];
        switchBar.onTintColor = ThemeColor;
        [switchBar addTarget:self action:@selector(changedSwitchbar:) forControlEvents:UIControlEventValueChanged];
        cell.accessoryView = switchBar;
        if (self.fakerBool) {
            switchBar.on = YES;
        }
        else{
            switchBar.on = NO;
        }
    }
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 44-0.5, kWidth, 0.5)];
    lineView.backgroundColor = [UIColor lightGrayColor];
    [cell.contentView addSubview:lineView];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //    if (cell.selectionStyle != UITableViewCellSelectionStyleNone) {
    //        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //    }
    
}

#pragma mark - private method

- (void)changedSwitchbar:(UISwitch *)sender {
    self.fakerBool = sender.on;
    [self.tableView reloadData];
}

#pragma mark - Getter

-(NSMutableArray *)tableViewArr{
    if (!_tableViewArr) {
        _tableViewArr = [APAccountModel settingDefaultArr];
    }
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
