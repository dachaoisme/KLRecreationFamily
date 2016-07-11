//
//  PreparePregnantViewController.m
//  KLRecreationFamily
//
//  Created by 王园园 on 16/7/11.
//  Copyright © 2016年 Wangyuanyuan. All rights reserved.
//

#import "PreparePregnantViewController.h"

@interface PreparePregnantViewController ()

@end

@implementation PreparePregnantViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"备孕";
    
    [self createLeftBackNavBtn];
    
    
    //创建备孕视图
    [self createPreparePregnantView];
    
    
    
    
    
    
}

#pragma mark - 创建备孕视图
- (void)createPreparePregnantView{
    
    //状态的改变
    UIButton *preparePregnantBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    preparePregnantBtn.frame = CGRectMake(SCREEN_WIDTH/2 - 40, NAV_TOP_HEIGHT + 10, 80, 80);
    preparePregnantBtn.layer.cornerRadius = 40;
    preparePregnantBtn.layer.masksToBounds = YES;
    [preparePregnantBtn setImage:[UIImage imageNamed:@"beiyun"] forState:UIControlStateNormal];
    [self.view addSubview:preparePregnantBtn];
    
    
    //设置
    UIView *settingView = [[UIView alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(preparePregnantBtn.frame) + 50, SCREEN_WIDTH - 40, 80)];
    settingView.layer.cornerRadius = 10;
    settingView.layer.borderColor = [UIColor blackColor].CGColor;
    settingView.layer.borderWidth = 1;
    settingView.layer.masksToBounds = YES;
    [self.view addSubview:settingView];
    
    
    //您的生日
    UIView *birthdayView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(settingView.frame), CGRectGetHeight(settingView.frame)/2)];
    [settingView addSubview:birthdayView];
    
    UILabel *leftAlertLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 80, 20)];
    leftAlertLabel.text = @"您的生日:";
    leftAlertLabel.font = [UIFont systemFontOfSize:14];
    [birthdayView addSubview:leftAlertLabel];
    
    UILabel *birthdayLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(leftAlertLabel.frame), CGRectGetMinY(leftAlertLabel.frame), CGRectGetWidth(birthdayView.frame) - CGRectGetWidth(leftAlertLabel.frame), CGRectGetHeight(leftAlertLabel.frame))];
    birthdayLabel.text = @"1988年10月10日";
    birthdayLabel.font = [UIFont systemFontOfSize:14];
    [birthdayView addSubview:birthdayLabel];
    
    //添加触发弹框的事件
    UITapGestureRecognizer *tapBirthdayGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapBirthdayGestureAction:)];
    [birthdayView addGestureRecognizer:tapBirthdayGesture];
    
    //划线部分
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(birthdayView.frame), CGRectGetWidth(settingView.frame), 1)];
    lineView.backgroundColor = [UIColor blackColor];
    [settingView addSubview:lineView];
    
   //上次月经
    UIView *menstruationView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(lineView.frame), CGRectGetWidth(settingView.frame), CGRectGetHeight(settingView.frame)/2 - 1)];
    [settingView addSubview:menstruationView];
    
    UILabel *leftMenstruationLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 80, 20)];
    leftMenstruationLabel.text = @"上次月经:";
    leftMenstruationLabel.font = [UIFont systemFontOfSize:14];
    [menstruationView addSubview:leftMenstruationLabel];
    
    UILabel *menstruationContentLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(leftAlertLabel.frame), CGRectGetMinY(leftAlertLabel.frame), CGRectGetWidth(birthdayView.frame) - CGRectGetWidth(leftAlertLabel.frame), CGRectGetHeight(leftAlertLabel.frame))];
    menstruationContentLabel.text = @"1988年10月10日";
    menstruationContentLabel.font = [UIFont systemFontOfSize:14];
    [menstruationView addSubview:menstruationContentLabel];
    
    
    //添加点击月经的事件
    UITapGestureRecognizer *tapMenstruationGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapMenstruationGestureAction:)];
    [menstruationView addGestureRecognizer:tapMenstruationGesture];
    

    //创建进入的UIButton
    UIButton *goinButton = [UIButton buttonWithType:UIButtonTypeCustom];
    goinButton.frame = CGRectMake(20, SCREEN_HEIGHT - 80, SCREEN_WIDTH - 40, 50);
    [goinButton setTitle:@"进入康乐家庭" forState:UIControlStateNormal];
    [goinButton setTitleColor:[CommonUtils colorWithHex:@"00beaf"] forState:UIControlStateNormal];
    goinButton.layer.borderWidth = 1;
    goinButton.layer.borderColor = [UIColor blackColor].CGColor;
    goinButton.layer.cornerRadius = 10;
    goinButton.layer.masksToBounds = YES;
    [goinButton addTarget:self action:@selector(goinHomePage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goinButton];
    
    
}

#pragma mark - 选择生日模块响应事件
- (void)tapBirthdayGestureAction:(UITapGestureRecognizer *)gesture{
    
    [CommonUtils showToastWithStr:@"选择生日"];
    
}

#pragma mark - 选择月经事件模块的响应事件
- (void)tapMenstruationGestureAction:(UITapGestureRecognizer *)gesture{
    
    [CommonUtils showToastWithStr:@"选择月经"];
}

#pragma mark - 进入首页模块的响应事件
- (void)goinHomePage:(UIButton *)sender{
    
    [CommonUtils showToastWithStr:@"进入首页"];
    [self.navigationController popToRootViewControllerAnimated:YES];
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
