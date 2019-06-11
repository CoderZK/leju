//
//  LxmShenQingTuiDanView.m
//  HappyTogether
//
//  Created by 李晓满 on 16/12/8.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "LxmShenQingTuiDanVC.h"

@interface LxmShenQingTuiDanVC ()<UITextViewDelegate>
{
    UITextView * _bgTextView;
    UITextView * _textView;
}
@end

@implementation LxmShenQingTuiDanVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.frame = CGRectMake(0, 0, ScreenW, ScreenH);
    
    UIView * headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 170)];
    headerView.backgroundColor = [UIColor whiteColor];
    self.tableView.tableHeaderView = headerView;
    
    UIView * topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 30)];
    topView.backgroundColor = BGGrayColor;
    [headerView addSubview:topView];
    
    
    //备注的站位字符
    UITextView * bgTextView = [[UITextView alloc] initWithFrame:CGRectMake(10, 30, ScreenW-20, 140)];
    _bgTextView = bgTextView;
    _bgTextView.font = [UIFont systemFontOfSize:14];
    
    _bgTextView.textColor = [CharacterGrayColor colorWithAlphaComponent:0.3];
    [headerView addSubview:bgTextView];
    
    //备注
    UITextView * textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 30, ScreenW-20, 140)];
    _textView = textView;
    textView.font = [UIFont systemFontOfSize:14];
    textView.backgroundColor = [UIColor clearColor];
    textView.delegate = self;
    [headerView addSubview:textView];
    
    
    UILabel * noteLab = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, ScreenW-20, 20)];
    noteLab.backgroundColor = BGGrayColor;
    noteLab.textColor = CharacterDarkColor;
    noteLab.font = [UIFont systemFontOfSize:12];
    
    [topView addSubview:noteLab];
    
    
    UIView * footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 70)];
    self.tableView.tableFooterView = footerView;
    
    UIButton * bottomBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 20, ScreenW, 40)];
    [bottomBtn addTarget:self action:@selector(bottomBtn) forControlEvents:UIControlEventTouchUpInside];
    [bottomBtn setBackgroundImage:[UIImage imageNamed:@"yellow"] forState:UIControlStateNormal];
    bottomBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [bottomBtn setTitle:@"提交" forState:UIControlStateNormal];
    [footerView addSubview:bottomBtn];

    if (self.type == LxmShenQingTuiDanVC_tuidan)
    {
        self.navigationItem.title = @"申请退单";
        _bgTextView.text = @"请填写退单原因";
        noteLab.text = @"提示:到店时间前半小时前退单全额退款,半小时之后将收取违约费";
    }
    else
    {
        self.navigationItem.title = @"客服中心";
        _bgTextView.text = @"请简要描述你的问题和意见";
        noteLab.text = @"问题和意见";
    }
    
    
}
//备注的监控事件
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if(![text isEqualToString:@""])
    {
        [_bgTextView setHidden:YES];
    }
    if([text isEqualToString:@""]&&(range.length==1)&&range.location==0&&textView.text.length < 2)
    {
        [_bgTextView setHidden:NO];
    }
    return YES;
}
//备注的监控事件
- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    
    if ([textView.text isEqualToString:@""]||[[textView.text stringByReplacingOccurrencesOfString:@"\n" withString:@""] isEqualToString:@""])
    {
        textView.text = @"";
        [_bgTextView setHidden:NO];
    }
    else
    {
        
        [_bgTextView setHidden:YES];
    }
    
    return YES;
}

-(void)bottomBtn
{
    //提交
}

@end
