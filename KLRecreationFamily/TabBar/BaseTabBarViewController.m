//
//  BaseTabBarViewController.m
//  KLRecreationFamily
//
//  Created by 王园园 on 16/7/11.
//  Copyright © 2016年 Wangyuanyuan. All rights reserved.
//

#import "BaseTabBarViewController.h"


#import "HomePageViewController.h"
#import "HealthViewController.h"
#import "RecordViewController.h"
#import "MineViewController.h"

@interface BaseTabBarViewController ()

{
    HomePageViewController *homePageVC ;
    HealthViewController   *healthVC;
    RecordViewController   *recordVC;
    MineViewController     *mineVC;
}

@end

@implementation BaseTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tabBar.hidden = YES;
    //初始化各个controller
    homePageVC = [[HomePageViewController alloc] init];
    UINavigationController *homePageNavC = [[UINavigationController alloc] initWithRootViewController:homePageVC];
    
    
    healthVC = [[HealthViewController alloc] init];
    UINavigationController *healthNavC = [[UINavigationController alloc] initWithRootViewController:healthVC];
    
    
    recordVC = [[RecordViewController alloc] init];
    UINavigationController *recordNavC = [[UINavigationController alloc] initWithRootViewController:recordVC];
    
    
    mineVC = [[MineViewController alloc] init];
    UINavigationController *mineNavC = [[UINavigationController alloc] initWithRootViewController:mineVC];
    
    
    
    [self setViewControllers:[NSArray arrayWithObjects:
                              homePageNavC,
                              healthNavC,
                              recordNavC,
                              mineNavC,
                              nil]];
    
    
    _baseTabBarView=[[BaseTabBarView alloc] init];
    _baseTabBarView.frame =CGRectMake(0, SCREEN_HEIGHT-49, SCREEN_WIDTH, 49);
    _baseTabBarView.backgroundColor = [UIColor clearColor];
    _baseTabBarView.delegate=self;
    _baseTabBarView.titleArr=[[NSArray alloc] initWithObjects:
                              @"首页",
                              @"健康",
                              @"记录",
                              @"更多",
                              nil];
    _baseTabBarView.imgArr=[[NSArray alloc] initWithObjects:
                            @"tab_icon_home",
                            @"tab_icon_creativity",
                            @"tab_icon_package",
                            @"tab_icon_package",
                            nil];
    _baseTabBarView.imgSelArr=[[NSArray alloc] initWithObjects:
                               @"tab_icon_home_hl",
                               @"tab_icon_creativity",
                               @"tab_icon_package_hl",
                               @"tab_icon_package",
                               nil];
    
    [self.view addSubview:_baseTabBarView];
    
    [_baseTabBarView setContentView];
    [_baseTabBarView setSelected:0];
    



}

-(void)stateBarHidden
{
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
}
-(void)tabBarShow
{
    _baseTabBarView.hidden=NO;
    if (_baseTabBarView.frame.origin.x!=0 || _baseTabBarView.frame.origin.y!=self.view.bounds.size.height-49) {
        [UIView animateWithDuration:0 animations:^{
            _baseTabBarView.frame=CGRectMake(0, self.view.bounds.size.height-49, SCREEN_WIDTH, 49);
        }];
    }
}
-(void)tabBarHiddenToBottom:(BOOL)toBottom
{
    if (_baseTabBarView.frame.origin.x==0 && _baseTabBarView.frame.origin.y==self.view.bounds.size.height-49) {
        [UIView animateWithDuration:0 animations:^{
            if (toBottom) {
                _baseTabBarView.frame=CGRectMake(0, self.view.bounds.size.height, SCREEN_WIDTH, 49);
            }else
                _baseTabBarView.frame=CGRectMake(-SCREEN_WIDTH, self.view.bounds.size.height-49, SCREEN_WIDTH, 49);
        }completion:^(BOOL finished){
            if (finished) {
                _baseTabBarView.hidden=YES;
            }
        }];
    }
}

-(void)tabBarSelected:(NSInteger)index
{
    
    self.selectedIndex=index;
    [_baseTabBarView setSelected:index];
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    app.navController=(UINavigationController*)self.selectedViewController;
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
