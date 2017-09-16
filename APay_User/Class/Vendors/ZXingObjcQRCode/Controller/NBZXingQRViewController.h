//
//  NBZXingQRViewController.h
//  NBTest
//
//  Created by panzihao on 2017/4/5.
//  Copyright © 2017年 panzihao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APUIViewController.h"
@class NBZXingQRViewController;
#import "ZXResult.h"
@protocol NBZXingQRViewControllerDelegate <NSObject>
@optional
-(void)nBZXingQRViewController:(NBZXingQRViewController *)vc result:(ZXResult *)result;

@end

@interface NBZXingQRViewController : APUIViewController
@property(nonatomic,weak)id<NBZXingQRViewControllerDelegate> delegate;
@end
