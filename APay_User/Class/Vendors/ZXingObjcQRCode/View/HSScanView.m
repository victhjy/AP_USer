//
//  HSScanView.m
//  HiStor
//
//  Created by dingbinbin on 16/10/12.
//  Copyright © 2016年 彭惠珍. All rights reserved.
//

#import "HSScanView.h"

@interface HSScanView() {
    NSInteger _LineY; // 实时变更扫描线的位置
}

@property (nonatomic, strong) UIImageView *scanLineImageView;
@property (nonatomic, strong) UIImageView *boxImageView;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation HSScanView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _LineY = 0;
        self.clipsToBounds = YES;
        
        [self addSubviews];
        [self startScanTimer];
//        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(scanLineAction:) userInfo:nil repeats:YES];
//        [self.timer fire];
    }
    return self;
}
- (void)dealloc{
    [self stopScanTimer];
}
- (void)addSubviews {
    
    self.backgroundColor = [UIColor clearColor];
    
    [self addSubview:self.scanLineImageView];
    [self addSubview:self.boxImageView];
}

- (void)layoutSubviews {
    self.scanLineImageView.frame = CGRectMake(self.frame.size.width / 50, -(self.frame.size.height / 3), self.frame.size.width - self.frame.size.width / 50 * 2, self.frame.size.height / 3);
    self.boxImageView.frame = self.bounds;
}

- (void)scanLineAction:(NSTimer *)theTimer {
    // 更新scanLineView的位置
    _LineY++;
    if (_LineY >= self.frame.size.height) {
        _LineY = 0;
    }
    
    CGRect frame = self.scanLineImageView.bounds;
    frame.origin.x = self.frame.size.width / 50;
    frame.origin.y = _LineY - (self.frame.size.height / 3);
    frame.size.height = self.frame.size.height / 3;
    frame.size.width = self.frame.size.width - self.frame.size.width / 50 * 2;
    
    self.scanLineImageView.frame = frame;
}

- (void)startScanTimer {
    [self stopScanTimer];
    
    self.timer = [NSTimer timerWithTimeInterval:0.01 target:self selector:@selector(scanLineAction:) userInfo:nil repeats:YES];
    [self.timer fire];
    
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
}

- (void)stopScanTimer {
    // 销毁定时器
    if (self.timer.valid) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

#pragma mark - property

- (UIImageView *)scanLineImageView {
    if (!_scanLineImageView) {
        _scanLineImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"code_line"]];
        _scanLineImageView.backgroundColor = [UIColor clearColor];
        _scanLineImageView.contentMode = UIViewContentModeScaleToFill;
    }
    return _scanLineImageView;
}

- (UIImageView *)boxImageView {
    if (!_boxImageView) {
        _boxImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"code_box"]];
        _boxImageView.backgroundColor = [UIColor clearColor];
        _boxImageView.contentMode = UIViewContentModeScaleToFill;
    }
    return _boxImageView;
}

@end
