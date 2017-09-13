//
//  APMainCell.h
//  APay_User
//
//  Created by huangjinyang on 17/9/11.
//  Copyright © 2017年 jinx. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^ItemBlock)(NSInteger);
@interface APMainCell : UITableViewCell


@property(nonatomic, strong) NSMutableArray *dataArr;

@property(nonatomic, copy) ItemBlock clickedItem;
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
@end
