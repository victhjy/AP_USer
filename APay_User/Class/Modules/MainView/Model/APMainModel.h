//
//  APMainModel.h
//  APay_User
//
//  Created by huangjinyang on 17/9/11.
//  Copyright © 2017年 jinx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APMainModel : NSObject

+(NSMutableArray *)defaultTableViewArrWithModel:(APMainModel *)model;
@end

@interface APMainItemModel : NSObject

@property(nonatomic, copy) NSString *imageName;
@property(nonatomic, copy) NSString *subTitleStr;
@property(nonatomic, copy) NSString *titleStr;
@end
