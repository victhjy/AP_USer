//
//  APPayResultHeaderCell.h
//  APay_User
//
//  Created by huangjinyang on 17/9/15.
//  Copyright © 2017年 jinx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APModel.h"
@interface APPayResultHeaderCell : UITableViewCell
@property(nonatomic, strong) APModel *model;


@property(nonatomic, strong) UIImageView *headImageV;
@property(nonatomic, strong) UILabel *titleLbl;
@property(nonatomic, strong) UILabel *amountLbl;
@property(nonatomic, strong) UIButton *resultBtn;
+(instancetype)cellFromTable:(UITableView *)tableView;
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
@end
