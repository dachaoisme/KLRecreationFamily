//
//  HomePageViewController.m
//  KLRecreationFamily
//
//  Created by 王园园 on 16/7/11.
//  Copyright © 2016年 Wangyuanyuan. All rights reserved.
//

#import "HomePageViewController.h"
#import "ThreeStateGoinViewController.h"
@interface HomePageViewController ()

@end

@implementation HomePageViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self theTabBarHidden:NO];
    
}
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    //[self theTabBarHidden:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"首页";
    [self firstEnter];
}
-(void)firstEnter
{
    ThreeStateGoinViewController *threeStateVC = [[ThreeStateGoinViewController alloc] init];
//    UINavigationController *navC = [[UINavigationController alloc] initWithRootViewController:threeStateVC];
//    self.window.rootViewController = navC;
    [self.navigationController pushViewController:threeStateVC animated:YES];
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
