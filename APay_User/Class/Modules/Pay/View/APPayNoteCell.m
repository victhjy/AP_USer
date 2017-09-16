//
//  APPayNoteCell.m
//  APay_User
//
//  Created by huangjinyang on 17/9/16.
//  Copyright © 2017年 jinx. All rights reserved.
//

#define textViewTag 506
#define placeholderTag 507

#import "APPayNoteCell.h"

@implementation APPayNoteCell

+(instancetype)cellFromTable:(UITableView *)tableView{
    APPayNoteCell *headCell = [tableView dequeueReusableCellWithIdentifier:@"cell3"];
    if (!headCell) {
        headCell = [[APPayNoteCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell3"];
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
    UILabel *titleLbl = [[UILabel alloc]initWithFrame:CGRectMake(13, 13, kWidth, 20)];
    titleLbl.font = [UIFont boldSystemFontOfSize:16];
    titleLbl.text = L(@"My note");
    titleLbl.textAlignment = 0;
    [self.contentView addSubview:titleLbl];
    
    UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(titleLbl.frame) + 5, kWidth - 26, 132)];
    textView.textColor = [APTools colorWithHexString:@"9b9b9b"];
    textView.font = [UIFont systemFontOfSize:16];
    textView.tag = textViewTag;
    textView.delegate = self;
    [self.contentView addSubview:textView];
    
    UILabel *placeholderLbl = [[UILabel alloc]initWithFrame:CGRectMake(3, 7, kWidth, 20)];
    placeholderLbl.text = L(@"Add note here..");
    placeholderLbl.textColor=[APTools colorWithHexString:@"9b9b9b"];
    placeholderLbl.tag=placeholderTag;
    [textView addSubview:placeholderLbl];
}

#pragma mark - textView delegate

- (void)textViewDidChange:(UITextView *)textView{
    if (textView.tag == textViewTag) {
        UILabel *placeholderLabel = [textView viewWithTag:placeholderTag];
        if (textView.text.length == 0) {
            placeholderLabel.hidden=NO;
        }
        else{
            placeholderLabel.hidden=YES;
        }
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
