//
//  APPayResultDetailCell.m
//  APay_User
//
//  Created by huangjinyang on 17/9/16.
//  Copyright © 2017年 jinx. All rights reserved.
//

#import "APPayResultDetailCell.h"

@implementation APPayResultDetailCell


+(instancetype)cellFromTable:(UITableView *)tableView{
    APPayResultDetailCell *headCell = [tableView dequeueReusableCellWithIdentifier:@"cell2"];
    if (!headCell) {
        headCell = [[APPayResultDetailCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell2"];
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
    NSArray *titleArr = @[L(@"Date"),L(@"Transaction Number"),L(@"Merchant Order Number")];
    for (int i = 0; i < 3; i ++) {
        CGSize titleSize = [titleArr[i] sizeWithFont:[UIFont boldSystemFontOfSize:16] maxSize:CGSizeMake(kWidth, 20)];
        UILabel *leftLbl = [[UILabel alloc]initWithFrame:CGRectMake(13, 14 +(13+10)*i, titleSize.width, 16)];
        leftLbl.textAlignment = 0;
        leftLbl.font = [UIFont boldSystemFontOfSize:16];
        leftLbl.tag = 200 + i;
        leftLbl.text = titleArr[i];
        [self.contentView addSubview:leftLbl];
        
        UILabel *rightLbl = [[UILabel alloc]initWithFrame:CGRectMake(titleSize.width+13, 14 +(13+10)*i, kWidth-5 - (titleSize.width+13), 16)];
        rightLbl.textAlignment = 2;
        rightLbl.textColor = [APTools colorWithHexString:@"9b9b9b"];
        rightLbl.font = [UIFont systemFontOfSize:16];
        rightLbl.tag = 300 + i;
        [self.contentView addSubview:rightLbl];
    }
    
    UIView *line = [[UIView alloc]init];
    line.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self.contentView);
        make.height.mas_equalTo(@0.5);
    }];
}

-(void)setModel:(APModel *)model{
    for (int i = 0; i < 3; i ++) {
        UILabel *rightLbl = [self.contentView viewWithTag:300+i];
        rightLbl.text = model.fakerStr;
    }
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
