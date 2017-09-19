//
//  APSettingVC.m
//  APay_User
//
//  Created by huangjinyang on 17/9/19.
//  Copyright © 2017年 jinx. All rights reserved.
//

#import "APSettingVC.h"

@interface APSettingVC ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableView;

@end

@implementation APSettingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = L(@"Balance");
    self.view.backgroundColor = [UIColor whiteColor];
    [self createUI];
    // Do any additional setup after loading the view.
}

- (void)createUI {
    
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
