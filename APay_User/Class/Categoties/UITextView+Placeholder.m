//
//  UITextView+Placeholder.m
//  APay_User
//
//  Created by huangjinyang on 17/9/13.
//  Copyright © 2017年 jinx. All rights reserved.
//

#import "UITextView+Placeholder.h"

@implementation UITextView (Placeholder)



#pragma mark - ========== 各类触发事件 ==========
-(void)layoutSubviews{
    if (self.text.length){self.placeholderLable.hidden=YES;}
    else{self.placeholderLable.hidden=NO;}
    CGSize size=[UITextView maxSize:CGSizeMake(200, self.frame.size.width) AndText:self.placeholder AndFont:self.font];
    if (self.tag == 998) {
        self.placeholderLable.frame=CGRectMake(3, (self.contentSize.height-size.height)/2.0f + 7, self.contentSize.width-6, size.height);
    }
    else{
        self.placeholderLable.frame=CGRectMake(5, 5, kWidth/2, 20);
    }
    
    self.placeholderLable.font=self.font;
    self.placeholderLable.textAlignment=self.textAlignment;
    self.placeholderLable.textColor=[UIColor grayColor];
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if (self.text.length){
        self.placeholderLable.hidden=YES;
    }else{
        self.placeholderLable.hidden=NO;
    }
    
    //    NSLog(@"%@",self.text);
}
#pragma mark - ========== Get ==========
-(void)setPlaceholder:(NSString *)placeholder{
    objc_setAssociatedObject(self, &placeholderKey, placeholder, OBJC_ASSOCIATION_COPY);
    self.placeholderLable.text=self.placeholder;
}
-(NSString *)placeholder{
    return objc_getAssociatedObject(self, &placeholderKey);
}
-(UILabel *)placeholderLable{
    UILabel *label=objc_getAssociatedObject(self, &placeholderLableKey);
    if (!label){
        label=[[UILabel alloc] init];
        [self addSubview:label];
        objc_setAssociatedObject(self, &placeholderLableKey, label, OBJC_ASSOCIATION_RETAIN);
        [self addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:nil];
    }
    return objc_getAssociatedObject(self, &placeholderLableKey);
}
-(void)dealloc{
    [self removeObserver:self forKeyPath:@"text"];
}
#pragma mark - ========== 其他 ==========
+(CGSize)maxSize:(CGSize )size AndText:(NSString *)text AndFont:(UIFont *)fontSize{
    if (!fontSize) {
        return CGSizeZero;
    }
    NSDictionary *dic = @{NSFontAttributeName:fontSize};
    CGSize textSize = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    return textSize;
}

@end
