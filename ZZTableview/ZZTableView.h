//
//  ZZTableView.h
//  demo
//
//  Created by 赵振磊 on 2018/6/4.
//  Copyright © 2018年 赵振磊. All rights reserved.
//

#import <UIKit/UIKit.h>
///DataSource
//用于设置组数
typedef NSInteger (^ZZ_NumberOfSections)(void);
//用于设置cell数
typedef NSInteger (^ZZ_NumberOfRows)(void);
//用于设置cell
typedef UITableViewCell *(^ZZ_CellForRow)(id cell, NSIndexPath *indexPath, NSString *cellId);

///delegate
//header高度
typedef CGFloat (^ZZ_HeaderHeight)(NSInteger section);
//footer高度
typedef CGFloat (^ZZ_FooterHeight)(NSInteger section);
//cell高度
typedef CGFloat (^ZZ_CellHeight)(NSIndexPath *indexPath);
//section header
typedef UIView *(^ZZ_SectionHeader)(NSInteger section);
//section footer
typedef UIView *(^ZZ_SectionFooter)(NSInteger section);
@interface ZZTableView : UITableView

/**
 cell 名必须是类名，会根据该该字段注册cell及绑定id
 */
@property (nonatomic, copy) NSString *registerCell;

/**
 ections数
 */
@property (nonatomic, copy) ZZ_NumberOfSections sections;

/**
 rows数
 */
@property (nonatomic, copy) ZZ_NumberOfRows rows;

/**
 cell设置
 */
@property (nonatomic, copy) ZZ_CellForRow cells;

/**
 header高度
 */
@property (nonatomic, copy) ZZ_HeaderHeight headerHeight;

/**
 footer高度
 */
@property (nonatomic, copy) ZZ_FooterHeight footerHeight;

/**
 cell高度
 */
@property (nonatomic, copy) ZZ_CellHeight cellHeight;

/**
 段头
 */
@property (nonatomic, copy) ZZ_SectionHeader sectionHeader;

/**
 段尾
 */
@property (nonatomic, copy) ZZ_SectionFooter sectionFooter;

/**
 注册cell

 @param registerCell 必须是类名，会根据该该字段注册cell及绑定id = registerCell_ZZ
 */
- (void)registerCell:(NSString *)registerCell;

/**
 注册cell 及 header footer

 @param registerCell 必须是类名，会根据该该字段注册cell及绑定id = registerCell_ZZ
 @param header 头部
 @param footer 尾部
 */
- (void)registerCell:(NSString *)registerCell tableHeader:(UIView *)header tableFooter:(UIView *)footer;

/**
 datasource 基本设置

 @param sections 组数
 @param rows 行数
 @param cell cell设置
 */
- (void)dataSource:(ZZ_NumberOfSections)sections numberOfRows:(ZZ_NumberOfRows)rows cellForRow:(ZZ_CellForRow)cell;

/**
 设置高度

 @param headerHeight 组头高度
 @param footerHeight 组尾高度
 @param cellHeight cell高度
 */
- (void)delegate:(ZZ_HeaderHeight)headerHeight footerHeight:(ZZ_FooterHeight)footerHeight cellHeight:(ZZ_CellHeight)cellHeight;

/**
 只设置cell高

 @param cellHeight cell高
 */
- (void)delegateCellHeight:(ZZ_CellHeight)cellHeight;

/**
 设置段头 段尾

 @param sectionHeader 段头
 @param sectionFooter 段尾
 */
- (void)delegateSectionHeader:(ZZ_SectionHeader)sectionHeader sectionFooter:(ZZ_SectionFooter)sectionFooter;

//- (void)refresh:()
@end
