//
//  APMainScrollCell.m
//  APay_User
//
//  Created by huangjinyang on 17/9/13.
//  Copyright © 2017年 jinx. All rights reserved.
//

#import "APMainScrollCell.h"


#define cellHeight kWidth*0.367
@implementation APMainScrollCell



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createUI];
        self.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)createUI {
    [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
}

- (void)setDataArr:(NSMutableArray *)dataArr {
    _dataArr=dataArr;
    NSMutableArray *mutableImageArr=[NSMutableArray new];
    for (int i = 0 ; i < dataArr.count ; i ++ ) {

        [mutableImageArr addObject:[UIColor randomColorImage]];
    }
    
    BHInfiniteScrollView* infinitePageView1 = [BHInfiniteScrollView
                                               infiniteScrollViewWithFrame:CGRectMake(0, 0, kWidth, cellHeight) Delegate:self ImagesArray:mutableImageArr];
    infinitePageView1.dotSize = 10;
    infinitePageView1.pageControlAlignmentOffset = CGSizeMake(80, 20);
    infinitePageView1.titleView.hidden = YES;
    infinitePageView1.scrollTimeInterval = 4;
    infinitePageView1.autoScrollToNextPage = YES;
    infinitePageView1.dotSpacing = 8;
    infinitePageView1.delegate = self;
    [self.contentView addSubview:infinitePageView1];
}

#pragma mark - scrollImage delegate

- (void)infiniteScrollView:(BHInfiniteScrollView *)infiniteScrollView didScrollToIndex:(NSInteger)index {
//    NSLog(@"did scroll to index %ld", index);
}

- (void)infiniteScrollView:(BHInfiniteScrollView *)infiniteScrollView didSelectItemAtIndex:(NSInteger)index {
//    NSLog(@"did select item at index %ld", index);
    if (self.block) {
        self.block(index);
    }
}




- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
