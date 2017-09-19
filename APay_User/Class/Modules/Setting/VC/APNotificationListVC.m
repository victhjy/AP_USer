//
//  APNotificationListVC.m
//  APay_User
//
//  Created by huangjinyang on 17/9/18.
//  Copyright © 2017年 jinx. All rights reserved.
//

#import "APNotificationListVC.h"
#import "APNotificationModel.h"
#import "APNotificationDetailVC.h"

@interface APNotificationListVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSMutableArray *tableViewArr;
@property(nonatomic, strong) UIView *emptyView;

@end

@implementation APNotificationListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = L(@"Notification");
    self.view.backgroundColor = [UIColor whiteColor];
    [self createUI];
    // Do any additional setup after loading the view.
}

- (void)createUI {
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, kWidth, kHeight - 64) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.tableFooterView = [UIView new];
    
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.emptyView];
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
    [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    APNotificationModel *model = self.tableViewArr[indexPath.row];

    CGFloat circleW = 8;
    UIImageView *statusImageV = [[UIImageView alloc] init];
    statusImageV.frame = CGRectMake(25, (44-circleW)/2, circleW, circleW);
    statusImageV.layer.masksToBounds = YES;
    statusImageV.layer.cornerRadius = 2;
    [cell.contentView addSubview:statusImageV];
    UILabel *titleLbl = [[UILabel alloc]initWithFrame:CGRectMake(statusImageV.ap_right + 20, 0, kWidth - (statusImageV.ap_right + 20), 20)];
    titleLbl.centerY = 44/2;
    titleLbl.font = [UIFont systemFontOfSize:18];
    titleLbl.text = model.content;
    
    [cell.contentView addSubview:titleLbl];
    if (model.unread) {
        titleLbl.textColor = [UIColor blackColor];
        statusImageV.image = [UIColor imageFromColor:ThemeColor];
    }
    else{
        titleLbl.textColor = [UIColor grayColor];
        statusImageV.image = [UIColor imageFromColor:[UIColor grayColor]];
    }
    cell.textLabel.mj_x += 30;
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 44-0.5, kWidth*2, 0.5)];
    lineView.backgroundColor = [UIColor lightGrayColor];
    [cell.contentView addSubview:lineView];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell.selectionStyle != UITableViewCellSelectionStyleNone) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
    APNotificationModel *model = self.tableViewArr[indexPath.row];
    model.unread = NO;
    [self.tableView reloadRow:indexPath.row inSection:0 withRowAnimation:UITableViewRowAnimationNone];
    
    APNotificationDetailVC* detailVC = [[APNotificationDetailVC alloc]init];
    detailVC.currentType = model.currentType;
    [self.navigationController pushViewController:detailVC animated:YES];
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
        if (self.tableViewArr.count > indexPath.row) {
            [self.tableViewArr removeObjectAtIndex:indexPath.row];
        };
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
        if (self.tableViewArr.count == 0) {
            self.tableView.hidden = YES;
            self.emptyView.hidden = NO;
        }
        [self.tableView endUpdates];
    }
}


#pragma mark - Getter

-(NSMutableArray *)tableViewArr{
    if (!_tableViewArr) {
        _tableViewArr = [APNotificationModel fakerData];
    }
    return _tableViewArr;
}

-(UIView *)emptyView{
    if (!_emptyView) {
        _emptyView = [[UIView alloc]initWithFrame:self.tableView.frame];
        UIImageView *iv = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ic_notifblank"]];
        iv.frame = CGRectMake(kWidth/2 - 25, _emptyView.height/2 - 70, 50, 50);
        [_emptyView addSubview:iv];
        UILabel *lbl = [[UILabel alloc]init];
        lbl.text =[NSString stringWithFormat:L(@"Hi %@, the notification information will show up here. Enjoy APay services everyday!"),@"User"];
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
