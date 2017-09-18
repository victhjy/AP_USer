//
//  APBalanceCell.m
//  APay_User
//
//  Created by huangjinyang on 17/9/18.
//  Copyright © 2017年 jinx. All rights reserved.
//

#define weekTag 101
#define dateTag 102
#define priceTag 103
#define typeTag 104
#define typeImageTag 105
#import "APBalanceCell.h"

@implementation APBalanceCell


+(instancetype)cellFromTable:(UITableView *)tableView{
    APBalanceCell *headCell = [tableView dequeueReusableCellWithIdentifier:@"cell2"];
    if (!headCell) {
        headCell = [[APBalanceCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell2"];
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
    CGFloat topLadding = 10;
    UILabel *weekLbl = [[UILabel alloc]initWithFrame:CGRectMake(13, topLadding+3, 40, 13)];
    weekLbl.font = [UIFont boldSystemFontOfSize:14];
    weekLbl.tag = weekTag;
    [self.contentView addSubview:weekLbl];
    
    UILabel *dateLbl = [[UILabel alloc]initWithFrame:CGRectMake(13, weekLbl.bottom+3, 40, 12)];
    dateLbl.textColor = [APTools colorWithHexString:@"9b9b9b"];
    dateLbl.font = [UIFont systemFontOfSize:13];
    dateLbl.tag = dateTag;
    [self.contentView addSubview:dateLbl];
    
    UIImageView *typeIV = [[UIImageView alloc]initWithFrame:CGRectMake(75+13, 8, 25, 30)];
    typeIV.tag = typeImageTag;
    [self.contentView addSubview:typeIV];
    
    UILabel *priceLbl = [[UILabel alloc]initWithFrame:CGRectMake(typeIV.ap_right+40, topLadding, kWidth/2, 15)];
    priceLbl.textAlignment = 0;
    priceLbl.font = [UIFont boldSystemFontOfSize:15];
    priceLbl.tag = priceTag;
    [self.contentView addSubview:priceLbl];
    
    UILabel *typeLbl = [[UILabel alloc]initWithFrame:CGRectMake(priceLbl.left, priceLbl.bottom+3, priceLbl.width, 15)];
    typeLbl.font = [UIFont systemFontOfSize:14];
    typeLbl.tag = typeTag;
    [self.contentView addSubview:typeLbl];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 49.5, kWidth*2, 0.5)];
    line.backgroundColor = [APTools colorWithHexString:@"9b9b9b"];
    [self.contentView addSubview:line];


}

- (void)setModel:(APModel *)model {
    UILabel *weekLabel = [self.contentView viewWithTag:weekTag];
    UILabel *dateLable = [self.contentView viewWithTag:dateTag];
    UIImageView *typeIV = [self.contentView viewWithTag:typeImageTag];
    UILabel *typeLbl = [self.contentView viewWithTag:typeTag];
    UILabel *priceLbl = [self.contentView viewWithTag:priceTag];
    
    NSArray * arrWeek=@[L(@"SUN"),L(@"MON"),L(@"TUE"),L(@"WED"),L(@"THU"),L(@"FRI"),L(@"SAT")];
    
    typeIV.image = [UIImage imageNamed:@"ic_topup"];
    weekLabel.text = L(@"SUN");
    dateLable.text = @"17/04";
    priceLbl.text = [NSString stringWithFormat:@"Rp.%@",model.fakerStr];
    typeLbl.text = L(@"Top Up");
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
