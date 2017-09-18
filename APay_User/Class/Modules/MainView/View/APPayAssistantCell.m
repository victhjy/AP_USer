//
//  APPayAssistantCell.m
//  APay_User
//
//  Created by huangjinyang on 17/9/19.
//  Copyright © 2017年 jinx. All rights reserved.
//
#define imageTag 101
#define titleTag 102
#define contetnTag 103

#import "APPayAssistantCell.h"

@implementation APPayAssistantCell



+(instancetype)cellFromTable:(UITableView *)tableView{
    APPayAssistantCell *headCell = [tableView dequeueReusableCellWithIdentifier:@"cell2"];
    if (!headCell) {
        headCell = [[APPayAssistantCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell2"];
        headCell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return headCell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createUI];
    }
    return self;
}

- (void)createUI {
    UIImageView *iconIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ic_paymentasistant"]];
    iconIV.tag = imageTag;
    [self.contentView addSubview:iconIV];
    
    UILabel *titleLbl = [[UILabel alloc]init];
//    titleLbl.numberOfLines = 0;
    titleLbl.font  = [UIFont boldSystemFontOfSize:18];
    titleLbl.tag = titleTag;
    [self.contentView addSubview:titleLbl];
    
    UILabel *contentLbl = [[UILabel alloc]init];
    contentLbl.numberOfLines = 0;
    contentLbl.font  = [UIFont systemFontOfSize:16];
    contentLbl.tag = contetnTag;
    [self.contentView addSubview:contentLbl];
}

- (void)setModel:(APModel *)model {
    UIImageView *iconIV = [self.contentView viewWithTag:imageTag];
    UILabel *titleLbl = [self.contentView viewWithTag:titleTag];
    UILabel *contentLbl = [self.contentView viewWithTag:contetnTag];
    
    [iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top).offset(20);
        make.left.mas_equalTo(self.contentView.mas_left).offset(13);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    [titleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(iconIV.mas_right).offset(15);
        make.top.mas_equalTo(iconIV);
    }];
    
    titleLbl.text = L(@"Payment Assistant");
    NSString *str = [NSString stringWithFormat:L(@"Hi %@, your latest transaction information will show up here, hope you could enjoy APay services everyday."),@"User"];
    contentLbl.text = str;

//    CGSize contentSize = [str sizeWithFont:[UIFont systemFontOfSize:16] maxSize:CGSizeMake(kWidth - 100, 200)];
    [contentLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(titleLbl.mas_bottom).offset(10);
        make.left.equalTo(titleLbl);
        make.width.mas_equalTo(kWidth - 100);
    }];
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
