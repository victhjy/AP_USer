//
//  APMainPopView.m
//  APay_User
//
//  Created by huangjinyang on 17/9/15.
//  Copyright © 2017年 jinx. All rights reserved.
//

#import "APMainPopView.h"
#import "APTopUpBtn.h"

@interface APMainPopView()
@property(nonatomic, assign) CGRect popFrame;

@end

@implementation APMainPopView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _popFrame = frame;
        [self configSelf];
        [self createUI];
    }
    return self;
}

- (void)configSelf {
    self.frame = [UIScreen mainScreen].bounds;
    self.backgroundColor = popBgColor;
    
    self.userInteractionEnabled = YES;
    __weak __typeof(self)weakSelf = self;
    [self addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
        [weakSelf removeFromSuperview];
    }];
    
    UIView *bgView = [[UIView alloc]initWithFrame:_popFrame];
    bgView.center = CGPointMake(self.width/2, self.height/2);
    bgView.layer.masksToBounds = YES;
    bgView.layer.cornerRadius = 4;
    bgView.backgroundColor = [UIColor whiteColor];
    bgView.tag = 500;
    [self addSubview:bgView];
}


- (void)createUI {
    UIView *bgView = [self viewWithTag:500];
    
    UIImageView *imageV=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"img_popup"]];
    imageV.frame = CGRectMake(2, 2, bgView.width - 4, bgView.height/2 - 2);
    imageV.layer.masksToBounds = YES;
    imageV.layer.cornerRadius = 2;
    imageV.tag = 606;
    [bgView addSubview:imageV];
    
    NSString *welcomeStr = L(@"WELCOME");
    CGSize welcomeSize = [welcomeStr sizeWithFont:[UIFont boldSystemFontOfSize:20] maxSize:CGSizeMake(kWidth/2, 25)];
    UILabel *welcomeLbl = [[UILabel alloc]initWithFrame:CGRectMake(imageV.width - 30 - welcomeSize.width, imageV.height/2 - welcomeSize.height , welcomeSize.width, welcomeSize.height)];
    welcomeLbl.font = [UIFont boldSystemFontOfSize:20];
    welcomeLbl.textColor = [UIColor whiteColor];
    welcomeLbl.text = welcomeStr;
    [imageV addSubview:welcomeLbl];
    
    APTopUpBtn *topUp = [[APTopUpBtn alloc]initWithFrame:CGRectMake(welcomeLbl.mj_x, CGRectGetMaxY(welcomeLbl.frame)+10, welcomeSize.width, welcomeSize.height)];
    topUp.backgroundColor=[UIColor clearColor];
    topUp.userInteractionEnabled = YES;
    topUp.tag = 501;
    [topUp addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
        [self clickedTopUp];
    }];
    [imageV addSubview:topUp];
    
    NSString *tipText = [NSString stringWithFormat:L(@"Hi %@, Thank you for joining us. Top up your balance and enjoy paying cashless and cardless."),@"user"];
    CGSize tipSize = [tipText sizeWithFont:[UIFont systemFontOfSize:15] maxSize:CGSizeMake(bgView.width - 40, 200)];
    UILabel *tipLbl = [[UILabel alloc]initWithFrame:CGRectMake(20, bgView.height/2 + 20, bgView.width - 40, tipSize.height)];
    tipLbl.numberOfLines = 0;
    tipLbl.text = tipText;
    tipLbl.font = [UIFont systemFontOfSize:15];
    [bgView addSubview:tipLbl];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(bgView.width - 20 - 40, bgView.height - 40 , 40, 40)];
    [btn setTitle:@"OK" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor whiteColor];
    [btn setTitleColor:ThemeColor forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickedOK:) forControlEvents:UIControlEventTouchUpInside];
    btn.tag = 808;
    [bgView addSubview:btn];
    
    [bgView addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
        return ;
    }];
    
}

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    UIView *bgView = [self viewWithTag:500];
    UIImageView *imageV = [bgView viewWithTag:606];
    APTopUpBtn *topUp = [bgView viewWithTag:501];
    UIButton *btn = [bgView viewWithTag:808];
    CGRect topUpFrame = [self convertRect:topUp.frame fromView:bgView];
    CGRect btnFrame = [self convertRect:btn.frame fromView:bgView];
    if (CGRectContainsPoint(bgView.frame,point)) {
        if (CGRectContainsPoint(topUpFrame,point)) {
            return topUp;
        }
        else if(CGRectContainsPoint(btnFrame,point)){
            return btn;
        }
        else{
            return bgView;
        }
    }
    else{
        UIView * view = [super hitTest:point withEvent:event];
        
        return view;
    }
}

- (void)clickedOK:(UIButton *)sender {
    [self removeFromSuperview];
}

- (void)clickedTopUp {
    if (self.block) {
        self.block();
    }
}














@end
