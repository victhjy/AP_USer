//
//  APMainCell.m
//  APay_User
//
//  Created by huangjinyang on 17/9/11.
//  Copyright © 2017年 jinx. All rights reserved.
//

#import "APMainCell.h"
#import "APMainModel.h"
@interface APMainCell ()

@end

@implementation APMainCell



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createUI];
        self.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)createUI {
    for (int i = 0; i < 3; i ++) {
        UIImageView *iconImage = [[UIImageView alloc]initWithFrame:CGRectMake(kWidth/3 * i + kWidth/9, 20, kWidth/9, kWidth/9)];
        UILabel *titleLbl=[[UILabel alloc]initWithFrame:CGRectMake(kWidth/3 * i, 30 + kWidth/9 + 10, kWidth / 3, 20)];
        titleLbl.textAlignment=1;
        titleLbl.font=[UIFont systemFontOfSize:16];
        
        iconImage.tag = 100+i;
        titleLbl.tag = 200+i;
        
        if (i == 1) {
            iconImage.frame =CGRectMake(kWidth/3 * i + kWidth/9 + 3, 20, kWidth/9 - 6, kWidth/9);
        }
        
        if (i == 0) {
            UILabel *subTitleLbl = [[UILabel alloc]initWithFrame:CGRectMake(kWidth/3 * i, 20 + kWidth/9, kWidth / 3, 20)];
            subTitleLbl.textAlignment=1;
            subTitleLbl.font=[UIFont systemFontOfSize:14];
            [self.contentView addSubview:subTitleLbl];
            subTitleLbl.tag = 300+i;
        }
        
        __weak __typeof(self)weakSelf = self;
        iconImage.userInteractionEnabled=YES;
        [iconImage addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
            [weakSelf itemClicked:i];
        }];
        
        titleLbl.userInteractionEnabled=YES;
        [titleLbl addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
            [weakSelf itemClicked:i];
        }];
        
        [self.contentView addSubview:iconImage];
        [self.contentView addSubview:titleLbl];
    }
    
    UIView *line1=[[UILabel alloc]initWithFrame:CGRectMake(kWidth/3, 0, 0.25, kWidth/3)];
    line1.backgroundColor=[UIColor lightGrayColor];
    
    UIView *line2=[[UILabel alloc]initWithFrame:CGRectMake(kWidth/3*2, 0, 0.25, kWidth/3)];
    line1.backgroundColor=[UIColor lightGrayColor];
    
    UIView *line3=[[UILabel alloc]initWithFrame:CGRectMake(0, kWidth/3, kWidth, 0.25)];
    line1.backgroundColor=[UIColor lightGrayColor];
    line2.backgroundColor=[UIColor lightGrayColor];
    line3.backgroundColor=[UIColor lightGrayColor];
    [self.contentView addSubview:line1];
    [self.contentView addSubview:line2];
    [self.contentView addSubview:line3];
    
    __weak __typeof(self)weakSelf = self;
    [self.contentView addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
        CGPoint touchP = [gestureRecoginzer locationInView:weakSelf.contentView];
        NSInteger index= (NSInteger) touchP.x/(kWidth/3);
        [weakSelf itemClicked:index];
    }];
    
}

-(void)setDataArr:(NSMutableArray *)dataArr{
    for (int i = 0; i < 3;  i ++) {
        APMainItemModel *itemModel = dataArr[i];
        
        UIImageView *iv=[self.contentView viewWithTag:100+i];
        iv.image=[UIImage imageNamed:itemModel.imageName];
        
        UILabel *title=[self.contentView viewWithTag:200+i];
        title.text = itemModel.titleStr;
        
        if (itemModel.subTitleStr.length > 0) {
            UILabel *subTitle=[self.contentView viewWithTag:300+i];
            subTitle.text=itemModel.subTitleStr;
        }
    }
}


- (void)itemClicked:(NSInteger)index{
    if (self.clickedItem) {
        self.clickedItem(index);
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
