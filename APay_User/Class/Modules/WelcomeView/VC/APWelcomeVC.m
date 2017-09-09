//
//  APWelcomeVC.m
//  APay_User
//
//  Created by huangjinyang on 17/9/9.
//  Copyright © 2017年 jinx. All rights reserved.
//
#define ViewCount 3

#import "APWelcomeVC.h"
#import "APWelcomeModel.h"
@interface APWelcomeVC ()<UIScrollViewDelegate>
@property(nonatomic, strong) UIScrollView *scrollView;
@property(nonatomic, strong) NSMutableArray *dataArr;
@property(nonatomic, strong) UIPageControl *pageControl;
@end

@implementation APWelcomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self createUI];
    // Do any additional setup after loading the view.
}

- (void)initData {
    NSArray *imageNames=@[@"testSmall",@"testBig",@"testBig"];
    NSArray *subTitles = @[L(@"My Wallet"),@"",@""];
    NSArray *titles = @[L(@"All your daily expenses with APay, your cashless and cardless life starts from TODAY."),L(@"The more you use, the more you save"),L(@"Secure, Reliable, Convenient No worries for losing your wallet anymore")];
    
    self.dataArr=[NSMutableArray new];
    for (int i = 0;  i < ViewCount; i ++) {
        APWelcomeModel *model =[[APWelcomeModel alloc]init];
        model.imageName = imageNames[i];
        model.midTitle = subTitles[i];
        model.title = titles[i];
        [self.dataArr addObject:model];
    }
}

- (void)createUI{
    self.view.backgroundColor = ThemeColor;
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kWidth, kHeight - 60)];
    self.scrollView.delegate=self;
    self.scrollView.scrollsToTop=NO;
    self.scrollView.showsVerticalScrollIndicator=NO;
    self.scrollView.showsHorizontalScrollIndicator=NO;
    self.scrollView.pagingEnabled=YES;
    self.scrollView.contentSize= CGSizeMake(kWidth * ViewCount, kHeight - 60);
    self.scrollView.bounces=NO;
    self.scrollView.backgroundColor = ThemeColor;
    
    [self.view addSubview:self.scrollView];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, kHeight - 59.5, kWidth * ViewCount, 0.5)];
    line.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:line];
    
    for (NSInteger i = 0; i<self.dataArr.count; i++) {
        APWelcomeModel *model = self.dataArr[i];
        
        UIImageView *imageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:model.imageName]];
        [self.scrollView addSubview:imageV];
        CGFloat imageW = 80;
        imageV.frame = CGRectMake(i*kWidth + (kWidth-imageW)/2, kHeight/3 - imageW/2, imageW, imageW);
        
        if (i == 0) {
            imageV.frame = CGRectMake(i*kWidth + (kWidth-imageW)/2, kHeight/3 - imageW/2, imageW, imageW/2);

            UILabel *midLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(imageV.frame), kWidth, 25)];
            midLabel.textAlignment=1;
            midLabel.text=model.midTitle;
            midLabel.textColor= [UIColor whiteColor];
            [self.scrollView addSubview:midLabel];
        }
        CGSize labelSize = [model.title sizeWithFont:[UIFont systemFontOfSize:19] maxSize:CGSizeMake(kWidth - 80, kHeight/3)];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(kWidth * i + 40, kHeight /2 +30, kWidth - 80, labelSize.height)];
        [self.scrollView addSubview:label];
        label.font=[UIFont systemFontOfSize:19];
        label.numberOfLines=0;
        label.lineBreakMode=NSLineBreakByWordWrapping;
        label.preferredMaxLayoutWidth=kWidth - 40 *2;
        label.text = model.title;
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        
        
//        CGFloat btnPadding = 45;
//        UIButton *skip = [[UIButton alloc]init];
//        [skip setTitle:L(@"Skip") forState:UIControlStateNormal];
//        skip.tag = 500 + i;
//        [skip setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        [skip addTarget:self action:@selector(skipBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
//        [self.scrollView addSubview:skip];
//        [skip mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.scrollView.mas_left).offset((kWidth * i) + btnPadding);
////            make.centerY.mas_equalTo(self.scrollView.mas_bottom).offset(-30);
//            make.top.mas_equalTo(self.scrollView.mas_top).offset(kHeight - 30-10);
//            make.size.mas_equalTo(CGSizeMake(50, 20));
//        }];
//        
//        UIButton *next = [[UIButton alloc]init];
//        [next setTitle:L(@"Next") forState:UIControlStateNormal];
//        next.tag = 500 + i;
//        [next setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        [next addTarget:self action:@selector(nextBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
//        [self.scrollView addSubview:next];
//        [next mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.right.equalTo(self.scrollView.mas_right).offset((kWidth * (i + 1)) - btnPadding);
////            make.centerY.mas_equalTo(self.scrollView.mas_bottom).offset(-30);
//            make.top.mas_equalTo(skip);
//            make.size.mas_equalTo(CGSizeMake(50, 20));
//        }];
    }
    
    CGFloat btnPadding = 45;
    UIButton *skip = [[UIButton alloc]init];
    [skip setTitle:L(@"Skip") forState:UIControlStateNormal];
//    skip.tag = 500 + i;
    [skip setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [skip addTarget:self action:@selector(skipBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:skip];
    [skip mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(btnPadding);
        //            make.centerY.mas_equalTo(self.scrollView.mas_bottom).offset(-30);
        make.top.mas_equalTo(self.scrollView.mas_top).offset(kHeight - 30-10);
        make.size.mas_equalTo(CGSizeMake(50, 20));
    }];
    
    UIButton *next = [[UIButton alloc]init];
    [next setTitle:L(@"Next") forState:UIControlStateNormal];
//    next.tag = 500 + i;
    [next setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [next addTarget:self action:@selector(nextBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:next];
    [next mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.mas_right).offset(-btnPadding);
        //            make.centerY.mas_equalTo(self.scrollView.mas_bottom).offset(-30);
        make.top.mas_equalTo(skip);
        make.size.mas_equalTo(CGSizeMake(50, 20));
    }];

    
    self.pageControl.frame = CGRectMake(160, kHeight/4*3-10, kWidth - 160 *2, 20);
    self.pageControl.centerX=self.view.centerX;
    self.pageControl.currentPage = 0;
    self.pageControl.numberOfPages = ViewCount;
    [self.view addSubview:self.pageControl];

}

#pragma mark - Skip Clicked

- (void)skipBtnClicked:(UIButton *)btn {
    
}

#pragma mark - Next Clicked

- (void)nextBtnClicked:(UIButton *)btn {
    if (self.pageControl.currentPage != 2) {
        [self.scrollView setContentOffset:CGPointMake((self.pageControl.currentPage+1) * kWidth, 0) animated:YES];
        self.pageControl.currentPage ++ ;
    }
}


#pragma mark - ScrollView Delegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView == self.scrollView) {
        NSInteger index = fabs(self.scrollView.contentOffset.x/kWidth);
        self.pageControl.currentPage = index;
    }
}

- (UIPageControl *)pageControl{
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] init];
//        [_pageControl addTarget:self action:@selector(clickPageControl:) forControlEvents:UIControlEventValueChanged];
        
    }
    return _pageControl;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
