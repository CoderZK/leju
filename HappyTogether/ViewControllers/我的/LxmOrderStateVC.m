//
//  LxmOrderStateVC.m
//  HappyTogether
//
//  Created by 李晓满 on 16/12/12.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "LxmOrderStateVC.h"
#import "LxmSureOrderCaiCell.h"
#import "LYOrderHeaderView.h"
#import "LYOrderFooterView.h"
#import "OrderDetailTVC.h"

@interface LxmOrderStateVC ()

@end

@implementation LxmOrderStateVC
static NSString *cellID = @"cellID";
static NSString *cellHeaderID = @"cellHeaderID";
static NSString *cellFooterID = @"cellfooterID";

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.frame = CGRectMake(0, 0, ScreenW, ScreenH);
    self.tableView.separatorColor = BGGrayColor;
    [self.tableView registerClass:[LxmSureOrderCaiCell class] forCellReuseIdentifier:cellID];
    [self.tableView registerClass:[LYOrderHeaderView class] forHeaderFooterViewReuseIdentifier:cellHeaderID];
    [self.tableView registerClass:[LYOrderFooterView class] forHeaderFooterViewReuseIdentifier:cellFooterID];
   
}

#pragma mark -tableview代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LxmSureOrderCaiCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.selectionStyle = UIAccessibilityTraitNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    OrderDetailTVC *tvc = [[OrderDetailTVC alloc] initWithTableViewStyle:UITableViewStyleGrouped];
    [self.navigationController pushViewController:tvc animated:YES];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    LYOrderHeaderView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:cellHeaderID];
    return view;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    LYOrderFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:cellFooterID];
    [view.leftBtn addTarget:self action:@selector(leftBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    view.leftBtn.tag = 100+section;
    [view.rightBtn addTarget:self action:@selector(rightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    view.rightBtn.tag = 100+section;
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 80;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 45;
}

//点击cell左键
- (void)leftBtnClick:(UIButton *)sender{
    NSInteger section = sender.tag - 100;
}

//点击cell右键
- (void)rightBtnClick:(UIButton *)sender{
    NSInteger section = sender.tag - 100;
    OrderDetailTVC *tvc = [[OrderDetailTVC alloc] initWithTableViewStyle:UITableViewStyleGrouped];
    [self.navigationController pushViewController:tvc animated:YES];
}
@end
