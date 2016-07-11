//
//  ThreeStateGoinViewController.m
//  KLRecreationFamily
//
//  Created by 王园园 on 16/7/11.
//  Copyright © 2016年 Wangyuanyuan. All rights reserved.
//

#import "ThreeStateGoinViewController.h"

#import "PreparePregnantViewController.h"
#import "HasBeenPregnantViewController.h"
#import "PregnantAfterViewController.h"
#import "AppDelegate.h"
@interface ThreeStateGoinViewController ()

@end

@implementation ThreeStateGoinViewController

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
    [self theTabBarHidden:YES];
}

-(void)viewWillDisappear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBarHidden = YES;
    
    //创建当前视图
    [self createStateView];
    
    
}

#pragma mark - 创建状态视图
- (void)createStateView{
    
    UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectMake(20, NAV_TOP_HEIGHT + 20, SCREEN_WIDTH - 40, 50)];
    titleLable.text = @"请选择您目前的状态";
    titleLable.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:titleLable];
    
    
    //身份视图的创建背景视图
    UIView *backGroundView = [[UIView alloc] initWithFrame:CGRectMake(10, SCREEN_HEIGHT/2 - 100, SCREEN_WIDTH - 20, 200)];
    [self.view addSubview:backGroundView];
    
    
    //创建三种身份的背景图
    
    //备孕状态
    UIButton *preparePregnantBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    preparePregnantBtn.frame = CGRectMake(CGRectGetWidth(backGroundView.frame)/2 - 40, 10, 80, 80);
    preparePregnantBtn.layer.cornerRadius = 40;
    preparePregnantBtn.layer.masksToBounds = YES;
    [preparePregnantBtn setImage:[UIImage imageNamed:@"beiyun"] forState:UIControlStateNormal];
    [preparePregnantBtn addTarget:self action:@selector(preparePregnantAction:) forControlEvents:UIControlEventTouchUpInside];
    [backGroundView addSubview:preparePregnantBtn];
    
    //孕中状态
    UIButton *hasBeenPregnantBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    hasBeenPregnantBtn.frame = CGRectMake(10, CGRectGetMaxY(preparePregnantBtn.frame) + 10, 80, 80);
    [hasBeenPregnantBtn setImage:[UIImage imageNamed:@"huaiyun"] forState:UIControlStateNormal];
    hasBeenPregnantBtn.layer.cornerRadius = 40;
    hasBeenPregnantBtn.layer.masksToBounds = YES;
    [hasBeenPregnantBtn addTarget:self action:@selector(hasBeenPregnantAction:) forControlEvents:UIControlEventTouchUpInside];
    [backGroundView addSubview:hasBeenPregnantBtn];
    
    

    //孕后状态
    UIButton *pregnantAfterBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    pregnantAfterBtn.frame = CGRectMake(CGRectGetWidth(backGroundView.frame) - 90, CGRectGetMaxY(preparePregnantBtn.frame) + 10, 80, 80);
    [pregnantAfterBtn setImage:[UIImage imageNamed:@"baoma"] forState:UIControlStateNormal];
    pregnantAfterBtn.layer.cornerRadius = 40;
    pregnantAfterBtn.layer.masksToBounds = YES;
    [pregnantAfterBtn addTarget:self action:@selector(PregnantAfterAction:) forControlEvents:UIControlEventTouchUpInside];
    [backGroundView addSubview:pregnantAfterBtn];
    
    
    
    //创建一个button进入首页入口
    UIButton *goinAppBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    goinAppBtn.frame = CGRectMake(SCREEN_WIDTH / 2 - 50, SCREEN_HEIGHT - 50, 100, 20);
    [goinAppBtn setTitle:@"进入首页" forState:UIControlStateNormal];
    [goinAppBtn addTarget:self action:@selector(goinAppAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goinAppBtn];
    
    
    
    
    
}

#pragma mark - 备孕状态响应事件
- (void)preparePregnantAction:(UIButton *)sender{
    
    
    [CommonUtils showToastWithStr:@"备孕"];
    
    PreparePregnantViewController *preparePregnant = [[PreparePregnantViewController alloc] init];
    [self.navigationController pushViewController:preparePregnant animated:YES];
    
}


#pragma mark - 孕中状态响应事件
- (void)hasBeenPregnantAction:(UIButton *)sender{
    
//    [CommonUtils showToastWithStr:@"已孕"];
    
    HasBeenPregnantViewController *hasBeenPregnantVC = [[HasBeenPregnantViewController alloc] init];
    [self.navigationController pushViewController:hasBeenPregnantVC animated:YES];
}

#pragma mark - 孕后按钮的响应事件
- (void)PregnantAfterAction:(UIButton *)sender{
    
//    [CommonUtils showToastWithStr:@"孕后"];
    
    PregnantAfterViewController *prenantAfterVC = [[PregnantAfterViewController alloc] init];
    [self.navigationController pushViewController:prenantAfterVC animated:YES];

}


#pragma mark - 进入app
- (void)goinAppAction{
    
    //[self.navigationController popViewControllerAnimated:YES];
    [(AppDelegate *)[UIApplication sharedApplication].delegate setRootViewControllerWithYesEnterIndexVC:YES];
    
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
