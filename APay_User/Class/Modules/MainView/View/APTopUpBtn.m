//
//  APTopUpBtn.m
//  APay_User
//
//  Created by huangjinyang on 17/9/15.
//  Copyright © 2017年 jinx. All rights reserved.
//

#import "APTopUpBtn.h"
#import <CoreGraphics/CoreGraphics.h>
@implementation APTopUpBtn

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    self.backgroundColor = ThemeColor;
//
    CGFloat radius = self.height/2;
    [[UIColor whiteColor] set];
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
     UIBezierPath* path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(radius, 0)];
    [path addLineToPoint:CGPointMake(self.width - radius, 0)];
    [path addQuadCurveToPoint:CGPointMake(self.width, radius) controlPoint:CGPointMake(self.width, 0)];
    [path addQuadCurveToPoint:CGPointMake(self.width-radius, radius*2) controlPoint:CGPointMake(self.width, radius*2)];
    [path addLineToPoint:CGPointMake(radius, radius * 2)];
    [path addQuadCurveToPoint:CGPointMake(0, radius) controlPoint:CGPointMake(0, radius*2)];
    [path addQuadCurveToPoint:CGPointMake(radius, 0) controlPoint:CGPointMake(0, 0)];

    path.lineWidth = 0.5;
    path.lineCapStyle = kCGLineCapRound; //线条拐角
    path.lineJoinStyle = kCGLineJoinRound; //终点处理
    
    [path stroke];
    [path fill];
    
   
    
    NSString *topUpText = L(@"Top Up");
//    CGSize topupSize = [topUpText sizeWithFont:[UIFont boldSystemFontOfSize:16] maxSize:CGSizeMake(kWidth/2, 20)];
    UILabel *topUpLbl = [[UILabel alloc]initWithFrame:self.bounds];
    topUpLbl.text = topUpText;
    topUpLbl.font =[UIFont boldSystemFontOfSize:16];
    topUpLbl.textColor = ThemeColor;
    topUpLbl.textAlignment = 1;
    topUpLbl.center = CGPointMake(self.width/2, self.height/2);
    [self addSubview:topUpLbl];
    
    UIBezierPath* linePath = [UIBezierPath bezierPath];
    [linePath moveToPoint:CGPointMake(self.width-radius - radius/2, radius/2)];
    [linePath addLineToPoint:CGPointMake(self.width-radius, radius)];
    [linePath addLineToPoint:CGPointMake(self.width-radius - radius/2, radius + radius/2)];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = linePath.CGPath;
    shapeLayer.strokeColor = ThemeColor.CGColor;
    shapeLayer.fillColor = [UIColor whiteColor].CGColor;
    shapeLayer.borderWidth = 3.0;
    [self.layer addSublayer:shapeLayer];
    
}

@end
