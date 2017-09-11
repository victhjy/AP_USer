//
//  APMainCell.h
//  APay_User
//
//  Created by huangjinyang on 17/9/11.
//  Copyright © 2017年 jinx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface APMainCell : UITableViewCell


@property(nonatomic, strong) NSMutableArray *dataArr;
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
@end
