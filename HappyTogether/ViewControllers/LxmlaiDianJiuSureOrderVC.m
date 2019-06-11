//
//  LxmlaiDianJiuSureOrderVC.m
//  HappyTogether
//
//  Created by 李晓满 on 16/12/8.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "LxmlaiDianJiuSureOrderVC.h"
#import "LxmSureOrderAddressCell.h"
#import "LxmSureOrderCaiCell.h"
#import "LxmHomeHeaderView.h"
#import "LxmQiangBaiShiFooterView.h"
#import "LxmSelectPeopleVC.h"
#import "LxmDianBaiJiuorderDetailVC.h"

@interface LxmlaiDianJiuSureOrderVC ()
{
    NSInteger _payType;
}
@end

@implementation LxmlaiDianJiuSureOrderVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"确认订单";
    self.tableView.separatorColor = BGGrayColor;
    self.tableView.frame = CGRectMake(0, 0, ScreenW, ScreenH-50);
    
    UIView * bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, ScreenH-50, ScreenW, 50)];
    bottomView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bottomView];
    
    UILabel * moneyLab = [[UILabel alloc] initWithFrame:CGRectMake(10, 15, ScreenW-10-100, 20)];
    NSString * str1 = @"待支付￥986";
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:str1];
    [attri addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13] range:NSMakeRange(0, 3)];
    [attri addAttribute:NSForegroundColorAttributeName value:CharacterDarkColor range:NSMakeRange(0, 3)];
    moneyLab.textColor = [UIColor redColor];
    moneyLab.font = [UIFont systemFontOfSize:18];
    moneyLab.attributedText = attri;
    [bottomView addSubview:moneyLab];
    
    UIButton * bottomBtn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenW-100, 0, 100, 50)];
    [bottomBtn setBackgroundImage:[UIImage imageNamed:@"btn_jiesuan"] forState:UIControlStateNormal];
    [bottomBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [bottomBtn setTitle:@"确认支付" forState:UIControlStateNormal];
    bottomBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [bottomView addSubview:bottomBtn];
}
-(void)btnClick
{
    LxmDianBaiJiuorderDetailVC * vc = [[LxmDianBaiJiuorderDetailVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 2)
    {
        return 4;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        LxmSureOrderAddressCell * cell =[tableView dequeueReusableCellWithIdentifier:@"LxmSureOrderAddressCell"];
        if (!cell)
        {
            cell=[[LxmSureOrderAddressCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LxmSureOrderAddressCell"];
        }
        return cell;
    }
    else if (indexPath.section == 1)
    {
        LxmSureOrderCaiCell * cell =[tableView dequeueReusableCellWithIdentifier:@"LxmSureOrderCaiCell"];
        if (!cell)
        {
            cell=[[LxmSureOrderCaiCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LxmSureOrderCaiCell"];
        }
        return cell;
    }
    else
    {
        UITableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell)
        {
            cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
            
            
            UIButton *btn=[[UIButton alloc] initWithFrame:CGRectMake(0, 17, 10, 10)];
            [btn setImage:[UIImage imageNamed:@"pic_1"] forState:UIControlStateNormal];
            [btn setImage:[UIImage imageNamed:@"ico_xuanzhong"] forState:UIControlStateSelected];
            btn.userInteractionEnabled=NO;
            cell.accessoryView=btn;
            
        }
        UIButton * btn = (UIButton *)cell.accessoryView;
        btn.selected = (_payType==indexPath.row);
        cell.textLabel.textColor = CharacterDarkColor;
        cell.textLabel.font = [UIFont systemFontOfSize:13];
        if (indexPath.row == 0)
        {
            cell.imageView.image = [UIImage imageNamed:@"bg_zhifub"];
            cell.textLabel.text = @"支付宝支付";
        }
        else if (indexPath.row == 1)
        {
            cell.imageView.image = [UIImage imageNamed:@"bg_weixin"];
            cell.textLabel.text = @"微信支付";
        }
        else if (indexPath.row == 2)
        {
            cell.imageView.image = [UIImage imageNamed:@"bg_leju"];
            cell.textLabel.text = @"乐聚通支付";
        }
        else
        {
            cell.imageView.image = [UIImage imageNamed:@"bg_daodian"];
            cell.textLabel.text = @"到店支付";
        }
        return cell;
    }

}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return nil;
    }
    LxmHomeHeaderView * headerView =[tableView dequeueReusableHeaderFooterViewWithIdentifier:@"LxmHomeHeaderView"];
    if (!headerView)
    {
        headerView = [[LxmHomeHeaderView alloc] initWithReuseIdentifier:@"LxmHomeHeaderView"];
        UIView * linView = [[UIView alloc] initWithFrame:CGRectMake(0, 40, ScreenW, 0.5)];
        linView.backgroundColor = BGGrayColor;
        [headerView addSubview:linView];
    }
    headerView.isImgHidden = YES;
    if (section == 1)
    {
         headerView.titleLab.text = @"来点酒";
    }
    else
    {
         headerView.titleLab.text = @"支付方式";
    }
   
    headerView.linView.hidden = YES;
    return headerView;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == 1)
    {
        LxmQiangBaiShiFooterView * footerView =[tableView dequeueReusableHeaderFooterViewWithIdentifier:@"LxmQiangBaiShiFooterView"];
        if (!footerView)
        {
            footerView = [[LxmQiangBaiShiFooterView alloc] initWithReuseIdentifier:@"LxmQiangBaiShiFooterView"];
            
            UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 40, ScreenW, 5)];
            view.backgroundColor = BGGrayColor;
            [footerView addSubview:view];
            
        }
        footerView.bgImageView.backgroundColor = [UIColor whiteColor];
        return footerView;
    }
    return nil;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return 70;
    }
    else if (indexPath.section == 1)
    {
        return 80;
    }
    else
    {
        return 40;
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 1)
    {
        return 40+5;
    }
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 0.01;
    }
    return 40;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0)
    {
        LxmSelectPeopleVC * vc = [[LxmSelectPeopleVC alloc] init];
        vc.type = LxmSelectPeopleVC_Type_laidianjiu;
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.section == 2)
    {
        _payType = indexPath.row;
        [self.tableView reloadData];
    }
}
@end
