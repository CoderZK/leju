//
//  ZKQiangBaiShiVC.m
//  HappyTogether
//
//  Created by kunzhang on 16/12/1.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "ZKQiangBaiShiVC.h"
#import "ZKQiangBaiShiAndZiZhuCell.h"
#import "ZKQiangBaiShiOrZiZhuModel.h"
#import "LxmQiangBaiShiSureOrderVC.h"
#import "LxmQingQueRenOrderVC.h"

@interface ZKQiangBaiShiVC ()
/** 数据数组 */
@property(nonatomic , strong)NSMutableArray *dataArray;
@end

@implementation ZKQiangBaiShiVC

-(NSMutableArray *)dataArray {
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
   self.tableView.frame = CGRectMake(0, -44, ScreenW, ScreenH+44);
    
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, ScreenW*440/750)];
    imageView.image = [UIImage imageNamed:@"banner"];
    self.tableView.tableHeaderView = imageView;
    
    [self.tableView registerClass:[ZKQiangBaiShiAndZiZhuCell class] forCellReuseIdentifier:@"cell"];
    
    //假数据
    for (int i = 0 ; i< 10; i++) {
        ZKQiangBaiShiOrZiZhuModel * model =[[ZKQiangBaiShiOrZiZhuModel alloc] init];
        model.name =  [NSString stringWithFormat:@"金陵江南大饭店午餐拼桌%d",i ];
        model.address =  [NSString stringWithFormat:@"新北区通江路%d号",i * 5];
        //人数
        model.renshu =  [NSString stringWithFormat:@"%d",i * 3];;
        //还剩几人
        model.shengren = [NSString stringWithFormat:@"%d",i * 2];;
        //价格
        model.money =  [NSString stringWithFormat:@"%d",i*100 + 99];
        //折扣价
        model.discontM =  [NSString stringWithFormat:@"%d",i * 50 + 99];
        //打几折
        model.jizhe =  [NSString stringWithFormat:@"%f",i * 0.06];
        [self.dataArray addObject:model];
    }
    

    
    // Do any additional setup after loading the view.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}
- (UITableViewCell * )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ZKQiangBaiShiOrZiZhuModel * model =self.dataArray[indexPath.row];
    ZKQiangBaiShiAndZiZhuCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    //传进cell 里面告诉cell里面的内容是抢白食还是超级自助
    cell.isQiangBaiShi = self.isQiangBaiShi;
    cell.model = model;
    
    // cell.nameLB.text = @"fgkodkgfeoprkgkp";
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [cell.qiangBT addTarget:self action:@selector(qiangBTCLick:) forControlEvents:UIControlEventTouchUpInside];
    cell.qiangBT.tag = indexPath.row;
    
    
    return cell;
}
-(void)qiangBTCLick:(UIButton *)button
{
    if ([button.titleLabel.text isEqualToString:@"立即抢购"])
    {
        LxmQiangBaiShiSureOrderVC * vc = [[LxmQiangBaiShiSureOrderVC alloc] initWithTableViewStyle:UITableViewStyleGrouped];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else
    {
        LxmQingQueRenOrderVC * vc = [[LxmQingQueRenOrderVC alloc] initWithTableViewStyle:UITableViewStyleGrouped];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 115;
    
    
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
