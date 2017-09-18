//
//  APTransactions.m
//  APay_User
//
//  Created by huangjinyang on 17/9/18.
//  Copyright © 2017年 jinx. All rights reserved.
//

#import "APTransactions.h"
#import "APBalanceCell.h"
#import "APModel.h"
@interface APTransactions ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, assign) NSInteger fakerRows;

@property(nonatomic, strong) UIView *emptyView;

@end

@implementation APTransactions

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = L(@"Transactions");
    self.view.backgroundColor = [UIColor whiteColor];
    self.fakerRows = 3;
    [self createUI];
    // Do any additional setup after loading the view.
}

- (void)createUI {
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, kWidth, kHeight - 64) style:UITableViewStylePlain];
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

#pragma mark - Getter

-(UIView *)emptyView{
    if (!_emptyView) {
        _emptyView = [[UIView alloc]initWithFrame:self.tableView.frame];
        UIImageView *iv = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ic_emojiSmall"]];
        iv.frame = CGRectMake(kWidth/2 - 25, _emptyView.height/2 - 70, 50, 50);
        [_emptyView addSubview:iv];
        UILabel *lbl = [[UILabel alloc]init];
        lbl.text =[NSString stringWithFormat:L(@"Hi %@, your transaction history will show up here, hope you could enjoy APay services everyday."),@"User"];
        lbl.textAlignment = 1;
        lbl.numberOfLines = 0;
        lbl.font = [UIFont systemFontOfSize:16];
        lbl.textColor = [APTools colorWithHexString:@"9b9b9b"];
        CGSize lblSize = [lbl.text sizeWithFont:lbl.font maxSize:CGSizeMake(kWidth - 60, 200)];
        lbl.frame = CGRectMake(30, _emptyView.height/2 , kWidth - 60, lblSize.height);
        
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
