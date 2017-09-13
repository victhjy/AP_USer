//
//  APMainScrollCell.h
//  APay_User
//
//  Created by huangjinyang on 17/9/13.
//  Copyright © 2017年 jinx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BHInfiniteScrollView/BHInfiniteScrollView.h>

typedef void(^ScrollImageCLicked)(NSInteger);
@interface APMainScrollCell : UITableViewCell<BHInfiniteScrollViewDelegate>

@property (nonatomic, strong) BHInfiniteScrollView* infinitePageView;
@property(nonatomic, copy) ScrollImageCLicked block;
@property(nonatomic, strong) NSMutableArray *dataArr;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
@end
