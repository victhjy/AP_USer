//
//  APPwdCell.m
//  APay_User
//
//  Created by huangjinyang on 17/9/20.
//  Copyright © 2017年 jinx. All rights reserved.
//

#define tfTag 151

#import "APPwdCell.h"

@implementation APPwdCell



+(instancetype)cellFromTable:(UITableView *)tableView{
    APPwdCell *headCell = [tableView dequeueReusableCellWithIdentifier:@"cell2"];
    if (!headCell) {
        headCell = [[APPwdCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell2"];
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
    CGFloat topLadding = 40;
    CGFloat leftLadding = 30;
    
    UIImageView *lockIv = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ic_inputpassword"]];
    [self.contentView addSubview:lockIv];
    
    UITextField *tf = [[UITextField alloc]init];
    tf.textAlignment = 0;
    tf.borderStyle = UITextBorderStyleNone;
    tf.tag = tfTag;
    [self.contentView addSubview:tf];
    
    UIButton *btn = [[UIButton alloc]init];
    [btn setImage:[UIImage imageNamed:@"Shapewhite"] forState:UIControlStateNormal];
//    [btn setImage:[UIImage imageNamed:@"Shape"] forState:UIControlStateSelected];
    btn.tag = 188;
    [btn addTarget:self action:@selector(clickedBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:btn];
    
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:lineView];
    
    
    [lockIv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(18, 20));
        make.top.mas_equalTo(self.contentView).offset(topLadding);
        make.left.mas_equalTo(self.contentView).offset(leftLadding + 10);
    }];
    
    [tf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(lockIv.mas_right).offset(10);
        make.right.mas_equalTo(btn.mas_left);
        make.bottom.mas_equalTo(lineView.top).offset(-5);
        make.height.mas_equalTo(30);
    }];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(20, 20));
        make.right.mas_equalTo(lineView.mas_right);
        make.bottom.mas_equalTo(lineView.mas_top).offset(-10);
    }];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.contentView.mas_bottom);
        make.left.mas_equalTo(self.contentView).offset(leftLadding);
        make.right.mas_equalTo(self.contentView).offset(-leftLadding);
        make.height.mas_equalTo(1);
    }];
    
    [tf addTarget:self action:@selector(tfChanged:) forControlEvents:UIControlEventEditingChanged];
}

#pragma mark - priate method

- (void)tfChanged:(UITextField *)sender {
    if (self.tfBlock) {
        self.tfBlock(sender.text);
    }
}

- (void)clickedBtn:(UIButton *)sender {
    sender.selected = !sender.selected;
    UITextField *tf = [self.contentView viewWithTag:tfTag];
    if (sender.isSelected) {
        tf.secureTextEntry = YES;
        [sender setImage:[UIImage imageNamed:@"Shape"] forState:UIControlStateNormal];
    }
    else{
        tf.secureTextEntry = NO;
        [sender setImage:[UIImage imageNamed:@"Shapewhite"] forState:UIControlStateNormal];
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
