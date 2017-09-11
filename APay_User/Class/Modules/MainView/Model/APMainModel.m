//
//  APMainModel.m
//  APay_User
//
//  Created by huangjinyang on 17/9/11.
//  Copyright © 2017年 jinx. All rights reserved.
//

#import "APMainModel.h"

@implementation APMainModel


+(NSMutableArray *)defaultTableViewArrWithModel:(APMainModel *)model{
    NSMutableArray *resultArr=[NSMutableArray new];
    NSArray *imageArr1 = @[@"ic_wallet",@"ic_topupwallet",@"ic_pay"];
    
    NSMutableArray *muarr1=[NSMutableArray new];
    for (int i = 0; i < 3 ; i ++) {
        APMainItemModel *itemModel = [[APMainItemModel alloc]init];
        itemModel.imageName=imageArr1[i];
        itemModel.titleStr = @"123";
        
        if (i == 0) {
            itemModel.subTitleStr=@"000";
        }
        [muarr1 addObject:itemModel];
    }
    
    NSMutableArray *muarr2=[NSMutableArray new];
    NSArray *imageArr2 = @[@"ic_transactions",@"ic_myaccount",@"ic_settings"];
    for (int i = 0; i < 3 ; i ++) {
        APMainItemModel *itemModel = [[APMainItemModel alloc]init];
        itemModel.imageName=imageArr2[i];
        itemModel.titleStr = @"123";
        [muarr2 addObject:itemModel];
    }
    
    resultArr=[@[muarr1,muarr2] mutableCopy];
    
    return resultArr;
}

@end

@implementation APMainItemModel

@end
