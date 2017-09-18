//
//  APPayResultHeaderCell.m
//  APay_User
//
//  Created by huangjinyang on 17/9/15.
//  Copyright © 2017年 jinx. All rights reserved.
//

#import "APPayResultHeaderCell.h"

@implementation APPayResultHeaderCell

+(instancetype)cellFromTable:(UITableView *)tableView{
    APPayResultHeaderCell *headCell = [tableView dequeueReusableCellWithIdentifier:@"cell0"];
    if (!headCell) {
        headCell = [[APPayResultHeaderCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell0"];
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
    self.titleLbl = [[UILabel alloc]init];
    self.titleLbl.font = [UIFont systemFontOfSize:18];
    
    self.headImageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    self.headImageV.layer.masksToBounds = YES;
    self.headImageV.layer.cornerRadius = self.headImageV.width/2;
    
    
    self.amountLbl = [[UILabel alloc]init];
    self.amountLbl.font = [UIFont boldSystemFontOfSize:30];
    CGSize amountSize = [@"123" sizeWithFont:self.amountLbl.font maxSize:CGSizeMake(kWidth, 100)];
    self.amountLbl.frame = CGRectMake(0, 0, kWidth, amountSize.height);
    self.amountLbl.textAlignment = 1;
    
    self.resultBtn = [[UIButton alloc]init];
    self.resultBtn.layer.masksToBounds = YES;
    self.resultBtn.layer.cornerRadius = 4;
    
    [self.contentView addSubview:self.titleLbl];
    [self.contentView addSubview:self.headImageV];
    [self.contentView addSubview:self.amountLbl];
    [self.contentView addSubview:self.resultBtn];
}

-(void)setModel:(APModel *)model{
    self.titleLbl.text = model.fakerStr;
    self.headImageV.image = [UIColor randomColorImage];
    [self.resultBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

    CGSize btnTitleSize;
//    if (model.fakerStr.length %2 == 0) {
        self.amountLbl.text = [NSString stringWithFormat:@"-Rp.%@",model.fakerStr];
        [self.resultBtn setTitle:L(@"Success") forState:UIControlStateNormal];
        btnTitleSize = [L(@"Success") sizeWithFont:self.resultBtn.titleLabel.font maxSize:CGSizeMake(kWidth, 30)];
        self.resultBtn.backgroundColor = [APTools colorWithHexString:@"46bd35"];
//    }
//    else{
//        self.amountLbl.text = [NSString stringWithFormat:@"Rp.%@",model.fakerStr];
//        [self.resultBtn setTitle:L(@"Failed") forState:UIControlStateNormal];
//        btnTitleSize = [L(@"Failed") sizeWithFont:self.resultBtn.titleLabel.font maxSize:CGSizeMake(kWidth, 30)];
//        self.resultBtn.backgroundColor = [APTools colorWithHexString:@"f23e54"];
//    }
    
    CGSize titleSize = [model.fakerStr sizeWithFont:self.titleLbl.font maxSize:CGSizeMake(kWidth, 20)];
    CGSize amountSize = [model.fakerStr sizeWithFont:self.amountLbl.font maxSize:CGSizeMake(kWidth, 30)];
    
    self.headImageV.frame = CGRectMake((kWidth/2 - (titleSize.width + 30 + 10)/2), 20, 30, 30);
    self.titleLbl.frame = CGRectMake(CGRectGetMaxX(self.headImageV.frame)+10, 20, titleSize.width, 30);
    
    self.amountLbl.frame = CGRectMake(0, CGRectGetMaxY(self.titleLbl.frame) + 20, kWidth, amountSize.height);

    self.resultBtn.frame = CGRectMake(0, CGRectGetMaxY(self.amountLbl.frame) + 20, btnTitleSize.width+20, 30);
    self.resultBtn.centerX = kWidth/2;
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
