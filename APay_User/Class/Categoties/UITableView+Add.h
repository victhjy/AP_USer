//
//  UITableView+Add.h
//  PSOksales
//
//  Created by tangbin on 2017/2/12.
//  Copyright © 2017年 tangbin. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 只是对已有的一些方法的包装。
 */
@interface UITableView (Add)
/**
 执行一系列插入，删除或选择行和的方法调用部分。
 
 @param block  执行更新的回调
 */
- (void)updateWithBlock:(void (^)(UITableView *tableView))block;

/**
 滚动到指定的行和列
 
 */
- (void)scrollToRow:(NSUInteger)row inSection:(NSUInteger)section atScrollPosition:(UITableViewScrollPosition)scrollPosition animated:(BOOL)animated;

/**
 在TableView插入一行，使用选择动画来插入。
 
 @param row        Row index in section.
 
 @param section    Section index in table.

 */
- (void)insertRow:(NSUInteger)row inSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;

/**
 通过动画更新一行
 
 @param row        Row index in section.
 
 @param section    Section index in table.
 
 */
- (void)reloadRow:(NSUInteger)row inSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;

/**
 在TableView删除一行，使用选择动画来删除。
 
 @param row        Row index in section.
 
 @param section    Section index in table.
 
 */
- (void)deleteRow:(NSUInteger)row inSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;

/**
 通过传入NSIndexPath 来指定位置插入一行,使用选择动画来插入

 */
- (void)insertRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation;

/**
通过传入 NSIndexPath来更新某一行
 
 */
- (void)reloadRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation;

/**
 通过传入 NSIndexPath 执行删除某一行
 */
- (void)deleteRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation;

/**
    插入 一个 section
 */
- (void)insertSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;

/**
 删除一个 section
 */
- (void)deleteSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;

/**
 更新一个 section
 */
- (void)reloadSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;

/**
 取消 cell 选中状态
 */
- (void)clearSelectedRowsAnimated:(BOOL)animated;
@end
