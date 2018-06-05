//
//  ViewController.m
//  ZZTableViewBlockDemo
//
//  Created by 赵振磊 on 2018/6/5.
//  Copyright © 2018年 赵振磊. All rights reserved.
//

#import "ViewController.h"
#import "ZZTableView.h"
#import "MyCell.h"
@interface ViewController ()
{
    ZZTableView *table;
}
@end
@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *tableHeader = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)];
    tableHeader.textColor = [UIColor blackColor];
    tableHeader.text = @"TableHeader";
    
    UILabel *tableFooter = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)];
    tableFooter.textColor = [UIColor blackColor];
    tableFooter.text = @"tableFooter";
    
    table = [[ZZTableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.view addSubview:table];
    
    //注册cell及头部
    [table registerCell:@"MyCell" tableHeader:tableHeader tableFooter:tableFooter];
    
    //DataSource 设置 组数 cell数 cell设置
    [table dataSource:^NSInteger{//组数
        return 5;
    } numberOfRows:^NSInteger{//行数
        return 5;
    } cellForRow:^UITableViewCell *(MyCell *cell, NSIndexPath *indexPath, NSString *cellId) {//cell设置
        cell.title.text = [NSString stringWithFormat:@"%zd",indexPath.row];
        return cell;
    }];
    
    
//    //只设置cell行高
//    [table delegateCellHeight:^CGFloat(NSIndexPath *indexPath) {
//        return 20;
//    }];
    
    //delegate 高度信息
    [table delegate:^CGFloat(NSInteger section) {//段头高度
        return 20;
    } footerHeight:^CGFloat(NSInteger section) {//段尾高度
        return 20;
    } cellHeight:^CGFloat(NSIndexPath *indexPath) {//cell高度
        return 40;
    }];
    
    //段头信息
    [table delegateSectionHeader:^UIView *(NSInteger section) {
        UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20)];
        header.backgroundColor = [UIColor redColor];
        return header;
    } sectionFooter:^UIView *(NSInteger section) {
        UIView *footer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20)];
        footer.backgroundColor = [UIColor greenColor];
        return footer;
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
