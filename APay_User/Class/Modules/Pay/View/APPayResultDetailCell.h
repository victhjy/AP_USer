//
//  APPayResultDetailCell.h
//  APay_User
//
//  Created by huangjinyang on 17/9/16.
//  Copyright © 2017年 jinx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APModel.h"
@interface APPayResultDetailCell : UITableViewCell

@property(nonatomic, strong) APModel *model;
+(instancetype)cellFromTable:(UITableView *)tableView;

@end
