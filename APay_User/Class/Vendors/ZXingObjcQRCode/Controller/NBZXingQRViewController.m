//
//  NBZXingQRViewController.m
//  NBTest
//
//  Created by panzihao on 2017/4/5.
//  Copyright © 2017年 panzihao. All rights reserved.
//

#import "NBZXingQRViewController.h"
#import "HSScanView.h"
#import "ZXingObjC.h"
#import "Masonry.h"
#import "APSetAmountVC.h"
#define SCREEN_WIDTH   ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT  ([UIScreen mainScreen].bounds.size.height)

@interface NBZXingQRViewController () <ZXCaptureDelegate>

/**
 扫描视图
 */
@property (nonatomic, strong) HSScanView *scanView;

/**
 扫描视图的父视图
 */
@property (weak, nonatomic) IBOutlet UIView *scanSuperView;

/**
 zxing捕获器
 */
@property (nonatomic, strong) ZXCapture *capture;

@property(nonatomic,assign)BOOL scanComplete;

/**
 黑色背景视图
 */
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *blackBackgroundViewsArray;

@property(nonatomic, assign) BOOL isJump;

@end

@implementation NBZXingQRViewController
#pragma mark - lifeCircle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=L(@"Pay By QR Code");
    self.isJump = NO;
#if TARGET_IPHONE_SIMULATOR
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"下一步" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonItemAction:)];
#else
    [self setupSubViews];
    [self setupCapture];
#endif
    
}
- (void)dealloc {
    [self.capture.layer removeFromSuperlayer];
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
    [self.capture stop];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.isJump = NO;
    if ([self.scanView respondsToSelector:@selector(startScanTimer)]) {
        [self.scanView startScanTimer];
    }
}

#pragma mark - rightBarButtonItemAction
-(void)rightBarButtonItemAction:(UIBarButtonItem*)sender{
    APSetAmountVC *amountVC=[[APSetAmountVC alloc]init];
    [self.navigationController pushViewController:amountVC animated:YES];
}
#pragma mark - UITableViewDelegate

#pragma mark - ZXCaptureDelegate
- (void)captureResult:(ZXCapture *)capture result:(ZXResult *)result {
    [capture stop];
    [self.scanView stopScanTimer];
    if (!self.scanComplete) {
        self.scanComplete=YES;
    }
    if (!self.isJump) {
        APSetAmountVC *amountVC=[[APSetAmountVC alloc]init];
        [self.navigationController pushViewController:amountVC animated:YES];
        self.isJump = YES;
        [capture start];
    }
    else{
        
    }
    
}
#pragma mark - PriVateMethod
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)setupSubViews{
    
    _scanView = [[HSScanView alloc]initWithFrame:CGRectZero];
    [self.scanSuperView addSubview:_scanView];
    [_scanView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(_scanSuperView);
    }];
    
    UILabel *bottomLbl=[[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.scanSuperView.frame)-40, kWidth, 30)];
    bottomLbl.textAlignment=1;
    bottomLbl.textColor = [UIColor whiteColor];
    bottomLbl.tag = 500;
    bottomLbl.text=L(@"Align QR Code within frame to scan");
    
    [self.view addSubview:bottomLbl];
    
}
- (void)setupCapture{
    self.capture = [[ZXCapture alloc]init];
    self.capture.camera = self.capture.back;
    //自动聚焦
    self.capture.focusMode = AVCaptureFocusModeContinuousAutoFocus;
    self.capture.layer.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT );
    [self.view.layer addSublayer:self.capture.layer];
    [self.view bringSubviewToFront:self.scanSuperView];
    
    UILabel *label = [self.view viewWithTag:500];
    [self.view bringSubviewToFront:label];
    for (UIView * view in _blackBackgroundViewsArray) {
        [self.view bringSubviewToFront:view];
    }
    self.capture.delegate = self;

    //旋转
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    float scanRectRotation;
    float captureRotation;
    
    switch (orientation) {
        case UIInterfaceOrientationPortrait:
            captureRotation = 0;
            scanRectRotation = 90;
            break;
        case UIInterfaceOrientationLandscapeLeft:
            captureRotation = 90;
            scanRectRotation = 180;
            break;
        case UIInterfaceOrientationLandscapeRight:
            captureRotation = 270;
            scanRectRotation = 0;
            break;
        case UIInterfaceOrientationPortraitUpsideDown:
            captureRotation = 180;
            scanRectRotation = 270;
            break;
        default:
            captureRotation = 0;
            scanRectRotation = 90;
            break;
    }
    CGAffineTransform transform = CGAffineTransformMakeRotation((CGFloat) (captureRotation / 180 * M_PI));
    [self.capture setTransform:transform];
    [self.capture setRotation:scanRectRotation];
    //设置扫描区域
    CGFloat scaleVideo, scaleVideoX, scaleVideoY;
    CGFloat videoSizeX, videoSizeY , width ,height ,x,y;
    if([self.capture.sessionPreset isEqualToString:AVCaptureSessionPreset1920x1080]) {
        videoSizeX = 1080;
        videoSizeY = 1920;
    } else {
        videoSizeX = 720;
        videoSizeY = 1280;
    }
    scaleVideoX = SCREEN_WIDTH  / videoSizeX;
    scaleVideoY = (SCREEN_HEIGHT ) / videoSizeY;
    scaleVideo = MAX(scaleVideoX, scaleVideoY);
    width = self.scanSuperView.frame.size.width /scaleVideo;
    height = self.scanSuperView.frame.size.height / scaleVideo;
    
    if(scaleVideoX > scaleVideoY){
        x = self.scanSuperView.frame.origin.x / scaleVideo;
        y = x *self.scanSuperView.frame.origin.y / self.scanSuperView.frame.origin.x;
    }
    else {
        y = self.scanSuperView.frame.origin.y / scaleVideo;
        x = y * self.scanSuperView.frame.origin.x / self.scanSuperView.frame.origin.y;
    }
    self.capture.scanRect = CGRectMake(x, y, width, height);
}

@end
