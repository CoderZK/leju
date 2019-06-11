//
//  LxmOrderStateVC.h
//  HappyTogether
//
//  Created by 李晓满 on 16/12/12.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "BaseTableViewController.h"
typedef enum {
    
    LxmOrderStateVC_Type_weiPay,
    LxmOrderStateVC_Type_weiJiHuo,
    LxmOrderStateVC_Type_weiUse,
    LxmOrderStateVC_Type_peiSong,
    LxmOrderStateVC_Type_overOrder
    
}LxmOrderStateVC_Type;
@interface LxmOrderStateVC : BaseTableViewController
@property(nonatomic,assign)LxmOrderStateVC_Type type;
@property(nonatomic,weak)UIViewController * preVC;
@end
