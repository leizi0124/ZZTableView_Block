//
//  ZZTableView.m
//  demo
//
//  Created by 赵振磊 on 2018/6/4.
//  Copyright © 2018年 赵振磊. All rights reserved.
//

#import "ZZTableView.h"
@interface ZZTableView ()
{
    NSString *cellClassString;      //cell类名
}
@end
@interface ZZTableView ()<UITableViewDataSource, UITableViewDelegate>
@end
@implementation ZZTableView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self zz_init];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if (self = [super initWithFrame:frame style:style]) {
        
        [self zz_init];
    }
    return self;
}
#pragma mark - 初始化
- (void)zz_init {
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.dataSource = self;
    self.delegate = self;
}
#pragma mark - 注册cell
- (void)registerCell:(NSString *)registerCell {
    _registerCell = [registerCell stringByAppendingString:@"_ZZ"];
    cellClassString = registerCell;
    [self registerClass:NSClassFromString(registerCell) forCellReuseIdentifier:_registerCell];
}
#pragma mark - 注册cell header footer
- (void)registerCell:(NSString *)registerCell tableHeader:(UIView *)header tableFooter:(UIView *)footer {
    [self registerCell:registerCell];
    
    if (header) {
        self.tableHeaderView = header;
    }
    
    if (footer) {
        self.tableFooterView = footer;
    }
}
#pragma mark - 设置datasource
- (void)dataSource:(ZZ_NumberOfSections)sections numberOfRows:(ZZ_NumberOfRows)rows cellForRow:(ZZ_CellForRow)cell {
    _sections = sections;
    _rows = rows;
    _cells = cell;
}
#pragma mark - 设置delegate
- (void)delegate:(ZZ_HeaderHeight)headerHeight footerHeight:(ZZ_FooterHeight)footerHeight cellHeight:(ZZ_CellHeight)cellHeight {
    _headerHeight = headerHeight;
    _footerHeight = footerHeight;
    _cellHeight = cellHeight;
}
#pragma mark - 只设置cell高度
- (void)delegateCellHeight:(ZZ_CellHeight)cellHeight {
    _cellHeight = cellHeight;
}
#pragma mark - 设置段头 段尾
- (void)delegateSectionHeader:(ZZ_SectionHeader)sectionHeader sectionFooter:(ZZ_SectionFooter)sectionFooter {
    _sectionHeader = sectionHeader;
    _sectionFooter = sectionFooter;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return _sections ? _sections() : 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _rows ? _rows() : 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return _headerHeight ? _headerHeight(section) : CGFLOAT_MIN;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return _footerHeight ? _footerHeight(section) : CGFLOAT_MIN;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return _cellHeight ? _cellHeight(indexPath) : CGFLOAT_MIN;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return _sectionHeader ? _sectionHeader(section) : [[UIView alloc] init];
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return _sectionFooter ? _sectionFooter(section) : [[UIView alloc] init];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Class cellClass = NSClassFromString(cellClassString);
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:_registerCell forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:_registerCell];
    }
    
    return _cells(cell, indexPath, _registerCell);
}
@end
