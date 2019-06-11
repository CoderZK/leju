//
//  LxmSettingVC.m
//  HappyTogether
//
//  Created by 李晓满 on 16/12/9.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "LxmSettingVC.h"
#import "Clear.h"

@interface LxmSettingVC ()

@end

@implementation LxmSettingVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"设置";
    self.tableView.frame = CGRectMake(0, 0, ScreenW, ScreenH);
    self.tableView.separatorColor = BGGrayColor;
    
    UIView * footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 60)];
    footerView.backgroundColor = BGGrayColor;
    self.tableView.tableFooterView = footerView;
    
    UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 10, ScreenW, 50)];
    [btn setBackgroundImage:[UIImage imageNamed:@"white"] forState:UIControlStateNormal];
    [btn setTitleColor:CharacterGrayColor forState:UIControlStateNormal];
    [btn setTitle:@"退出登录" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [footerView addSubview:btn];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 2;
    }
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    
    if (indexPath.section == 0)
    {
        if (indexPath.row == 0)
        {
            UITableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
            if (!cell)
            {
                cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
                
                UIImageView * accImgView = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenW-35, 28, 7, 13)];
                accImgView.image = [UIImage imageNamed:@"lxmcelljiantou"];
                cell.accessoryView = accImgView;
            }
            cell.textLabel.textColor = CharacterDarkColor;
            cell.textLabel.font = [UIFont systemFontOfSize:14];
            cell.textLabel.text = @"修改密码";
            return cell;
        }
        else
        {
            
            
            UITableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:@"cell1"];
            if (!cell)
            {
                cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell1"];
                
                UILabel * detailLab = [[UILabel alloc] initWithFrame:CGRectMake(ScreenW *0.5, 0, ScreenW *0.5-10, 50)];
                detailLab.font = [UIFont systemFontOfSize:14];
                detailLab.textColor = CharacterLightGrayColor;
                detailLab.textAlignment = 2;
                detailLab.text = @"已开启";
                [cell addSubview:detailLab];

            }
            cell.textLabel.font = [UIFont systemFontOfSize:14];
            cell.textLabel.textColor = CharacterDarkColor;
            cell.textLabel.text = @"消息通知";
            return cell;
        }
    }
    else
    {
        
        
        if (indexPath.row == 0)
        {
            UITableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
            if (!cell)
            {
                cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
                
                UIImageView * accImgView = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenW-35, 28, 7, 13)];
                accImgView.image = [UIImage imageNamed:@"lxmcelljiantou"];
                cell.accessoryView = accImgView;
            }
            cell.textLabel.textColor = CharacterDarkColor;
            cell.textLabel.font = [UIFont systemFontOfSize:14];
            cell.detailTextLabel.textColor = CharacterDarkColor;
            cell.detailTextLabel.font = [UIFont systemFontOfSize:14];
            cell.textLabel.text = @"法律条款";
            return cell;
        }
        else if (indexPath.row == 1)
        {
            UITableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
            if (!cell)
            {
                cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
                
                UIImageView * accImgView = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenW-35, 28, 7, 13)];
                accImgView.image = [UIImage imageNamed:@"lxmcelljiantou"];
                cell.accessoryView = accImgView;
            }
            cell.textLabel.textColor = CharacterDarkColor;
            cell.textLabel.font = [UIFont systemFontOfSize:14];
            cell.detailTextLabel.textColor = CharacterDarkColor;
            cell.detailTextLabel.font = [UIFont systemFontOfSize:14];
            cell.textLabel.text = @"用户指南";
            return cell;
        }
        else
        {
            UITableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:@"cell2"];
            if (!cell)
            {
                cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell2"];
                
                UILabel * detailLab = [[UILabel alloc] initWithFrame:CGRectMake(ScreenW *0.5, 0, ScreenW *0.5-10, 50)];
                detailLab.font = [UIFont systemFontOfSize:14];
                detailLab.textColor = CharacterLightGrayColor;
                detailLab.textAlignment = 2;
                detailLab.text = [NSString stringWithFormat:@"%.2f M",[Clear folderSizeAtPath]];
                [cell addSubview:detailLab];
                
            }
            cell.textLabel.font = [UIFont systemFontOfSize:14];
            cell.textLabel.textColor = CharacterDarkColor;
            cell.textLabel.text = @"清除缓存";
            return cell;
        }
    }
   
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 1)
    {
        BaseTableViewHeaderFooterView * headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"BaseTableViewHeaderFooterView"];
        if (!headerView)
        {
            headerView = [[BaseTableViewHeaderFooterView alloc] initWithReuseIdentifier:@"BaseTableViewHeaderFooterView"];
            UILabel * lab = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, ScreenW-20, 50)];
            lab.textColor = CharacterLightGrayColor;
            lab.font = [UIFont systemFontOfSize:11];
            lab.text = @"如果你要关闭或者开启应用的消息通知,请在iPhone的\"设置\"--\"通知\"功能中,找到该应用程序进行更改";
            lab.numberOfLines = 2;
            [headerView addSubview:lab];
        }
        headerView.bgImageView.backgroundColor = BGGrayColor;
        return headerView;

    }
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 5;
    }
    else
    {
        return 50;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 1)
    {
        return 15;
    }
    return 0.01;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        
    }else if (indexPath.section == 1){
        if (indexPath.row == 2) {
            [Clear cleanCache:^{
                [SVProgressHUD showSuccessWithStatus:@"已清除缓存"];
                [self.tableView reloadData];
            }];
        }
    }else{
        
    }
}
@end
