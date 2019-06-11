//
//  LxmOrderConentVC.m
//  HappyTogether
//
//  Created by 李晓满 on 16/11/30.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "LxmOrderConentVC.h"
#import "LxmOderContentHeaderView.h"
#import "LxmOderContentCell.h"
#import "LxmAlertView.h"
#import "LxmAlertView1.h"
#import "LxmSureOrderVC.h"

@interface LxmOrderConentVC ()<LxmAlertViewDelegate>
{
    UINavigationBar * _myNavibar;
    LxmAlertView * _view;
}
@end

@implementation LxmOrderConentVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    UINavigationBar * myNavibar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
    _myNavibar = myNavibar;
    [myNavibar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    myNavibar.shadowImage = [[UIImage alloc] init];
    [self.view addSubview:myNavibar];
    
    UINavigationItem * item = [[UINavigationItem alloc] init];
    myNavibar.items = @[item];
    
    UIButton *leftBtn=[[UIButton alloc] initWithFrame:CGRectMake(0,0, 25, 25)];
    leftBtn.tag = 100;
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"ico_fh"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    item.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    
    self.tableView.frame = CGRectMake(0, 0, ScreenW, ScreenH);
    [self configHeaderView];
}
-(void)btnClick:(UIButton *)btn
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)configHeaderView{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, ScreenW*351/750+115)];
    UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, ScreenW*351/750)];
    imgV.image = [UIImage imageNamed:@"22"];
    [headerView addSubview:imgV];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, ScreenW*351/750+60, ScreenW, 5)];
    line.backgroundColor = BGGrayColor;
    [headerView addSubview:line];
    
    UILabel *priceLab = [[UILabel alloc] initWithFrame:CGRectMake(0, ScreenW*351/750, 100, 60)];
    priceLab.text = @"￥480";
    priceLab.textAlignment = 2;
    priceLab.textColor = [UIColor redColor];
    priceLab.font = [UIFont systemFontOfSize:30];
    [headerView addSubview:priceLab];
    
    UILabel *oldPriceLab = [[UILabel alloc] initWithFrame:CGRectMake(100, ScreenW*351/750+30, 60, 20)];
    oldPriceLab.text = @"￥599";
    oldPriceLab.textColor = CharacterGrayColor;
    oldPriceLab.font = [UIFont systemFontOfSize:15];
    NSString * str1 = oldPriceLab.text;
    NSUInteger length = [str1 length];
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:oldPriceLab.text];
    [attri addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(0, length)];
    [attri addAttribute:NSStrikethroughColorAttributeName value:CharacterGrayColor range:NSMakeRange(0, length)];
    [oldPriceLab setAttributedText:attri];
    [headerView addSubview:oldPriceLab];
    
    UIButton *xuanZeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    xuanZeBtn.frame = CGRectMake(ScreenW-100-20, ScreenW*351/750+10, 100, 40);
    xuanZeBtn.backgroundColor = YellowColor;
    [xuanZeBtn addTarget:self action:@selector(xuanZeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [xuanZeBtn setTitle:@"我选好了" forState:UIControlStateNormal];
    [xuanZeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    xuanZeBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [headerView addSubview:xuanZeBtn];
    
    UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, ScreenW*351/750+65, ScreenW, 50)];
    titleLab.textAlignment = 1;
    titleLab.textColor = CharacterDarkColor;
    titleLab.text = @"中式菜谱A";
    titleLab.font = [UIFont systemFontOfSize:17];
    [headerView addSubview:titleLab];
    
    self.tableView.tableHeaderView = headerView;
}

-(void)xuanZeBtnClick
{
    LxmAlertView * view = [[LxmAlertView alloc] initWithimage:[UIImage imageNamed:@"bg_youhuijuan"]];
    _view = view;
    view.delegate = self;
    [view show];
}
-(void)LxmAlertView:(LxmAlertView *)view btnAtIndex:(NSInteger)index
{
    if (index == 10)
    {
        [_view removeFromSuperview];
        //捡优惠券
        LxmAlertView1 * view1 = [[LxmAlertView1 alloc] initWithimage:[UIImage imageNamed:@""] price:@"30"];
        [view1 show];
    }
    else
    {
        //去支付
        [_view removeFromSuperview];
        LxmSureOrderVC * vc = [[LxmSureOrderVC alloc] initWithTableViewStyle:UITableViewStyleGrouped];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LxmOderContentCell * cell =[tableView dequeueReusableCellWithIdentifier:@"LxmOderContentCell"];
    if (!cell)
    {
        cell=[[LxmOderContentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LxmOderContentCell"];
    }
    return cell;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    LxmOderContentHeaderView * headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"LxmOderContentHeaderView"];
    if (!headerView)
    {
        headerView = [[LxmOderContentHeaderView alloc] initWithReuseIdentifier:@"LxmOderContentHeaderView"];
    }
    return headerView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

@end
