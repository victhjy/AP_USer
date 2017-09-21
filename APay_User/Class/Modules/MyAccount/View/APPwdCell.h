//
//  APPwdCell.h
//  APay_User
//
//  Created by huangjinyang on 17/9/20.
//  Copyright © 2017年 jinx. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^TFChanged)(NSString *);
@interface APPwdCell : UITableViewCell

@property(nonatomic, copy) TFChanged tfBlock;

+(instancetype)cellFromTable:(UITableView *)tableView;


@end
