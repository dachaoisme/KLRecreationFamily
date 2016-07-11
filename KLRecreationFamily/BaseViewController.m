//
//  BaseViewController.m
//  KLRecreationFamily
//
//  Created by 王园园 on 16/7/11.
//  Copyright © 2016年 Wangyuanyuan. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

    
    KLLog(@"\n\nThe Last ViewController is == %@\n\n",NSStringFromClass([self class]));
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [CommonUtils colorWithHex:@"fafafa"];

    
}

-(UIView*)createContentView //创建背景视图
{
    UIView * view=[[UIView alloc] init];
    view.backgroundColor=[UIColor whiteColor];
    view.translatesAutoresizingMaskIntoConstraints=NO;
    view.clipsToBounds=YES;
    
    UIView * line1=[[UIView alloc] init];
    line1.backgroundColor=[CommonUtils colorWithHex:@"d4d4d4"];
    line1.translatesAutoresizingMaskIntoConstraints=NO;
    [view addSubview:line1];
    
    UIView * line2=[[UIView alloc] init];
    line2.backgroundColor=[CommonUtils colorWithHex:@"d4d4d4"];
    line2.translatesAutoresizingMaskIntoConstraints=NO;
    [view addSubview:line2];
    
    NSDictionary * views=NSDictionaryOfVariableBindings(line1,line2);
    [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[line1]|" options:0 metrics:nil views:views]];
    [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[line2]|" options:0 metrics:nil views:views]];
    
    [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[line1(0.5)]" options:0 metrics:nil views:views]];
    [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[line2(0.5)]|" options:0 metrics:nil views:views]];
    
    return view;
}

#pragma mark --orientations
-(float)setNaveBarHeight{
    return 64.0f;
}

#pragma mark - 设置tabBar的显示以及隐藏
- (void)theTabBarHidden:(BOOL)hidden {
    if (hidden) {
        UITabBarController *tabBar = self.tabBarController;
        BaseTabBarViewController *vc = (BaseTabBarViewController *)tabBar;
        [vc tabBarHiddenToBottom:NO];
        
    } else {
        UITabBarController *tabBar = self.tabBarController;
        BaseTabBarViewController *vc = (BaseTabBarViewController *)tabBar;
        [vc tabBarShow];
        
        
    }
}

#pragma mark - 新添加
#pragma mark - 左侧返回按钮
- (void)createLeftBackNavBtn
{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"nav_icon_back"] forState:UIControlStateNormal];
    [button setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(doNavEventBack:) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(20, 0, 65, 44);
    
    UIBarButtonItem * menuButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = menuButton;
}
- (void)doNavEventBack:(id)sender
{
    NSArray * arr = self.navigationController.childViewControllers;
    if (arr && [arr count] > 1) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

#pragma mark - 左侧自定义按钮
-(void)creatLeftNavWithTitle:(NSString *)title
{
    UIButton *userDefineLeftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    userDefineLeftBtn.frame = CGRectMake(0, 0, 60, 40);
    [userDefineLeftBtn setTitle:title forState:UIControlStateNormal];
    [userDefineLeftBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [userDefineLeftBtn addTarget:self action:@selector(leftItemActionWithBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftItem1 = [[UIBarButtonItem alloc] initWithCustomView:userDefineLeftBtn];
    self.navigationItem.leftBarButtonItem = leftItem1;
    
}
-(void)creatLeftNavWithImageName:(NSString *)imageName
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 10, 25, 25)];
    imageView.image        = [UIImage imageNamed:imageName];
    imageView.contentMode  = UIViewContentModeScaleToFill;
    
    UIButton *userDefineLeftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    userDefineLeftBtn.frame = CGRectMake(0, 0, 60, 40);
    [userDefineLeftBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [userDefineLeftBtn addTarget:self action:@selector(leftItemActionWithBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [userDefineLeftBtn addSubview:imageView];
    
    UIBarButtonItem *leftItem1 = [[UIBarButtonItem alloc] initWithCustomView:userDefineLeftBtn];
    self.navigationItem.leftBarButtonItem = leftItem1;
    
}
-(void)leftItemActionWithBtn:(UIButton *)sender
{
    
}

#pragma mark - 右侧自定义按钮
-(void)creatRightNavWithImageName:(NSString *)imageName
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 10, 25, 25)];
    imageView.image        = [UIImage imageNamed:imageName];
    imageView.contentMode  = UIViewContentModeScaleToFill;
    
    UIButton *userDefineLeftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    userDefineLeftBtn.frame     = CGRectMake(-10, 0, 60, 40);
    [userDefineLeftBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [userDefineLeftBtn addTarget:self action:@selector(rightItemActionWithBtn:) forControlEvents:UIControlEventTouchUpInside];
    [userDefineLeftBtn addSubview:imageView];
    
    UIBarButtonItem *rightItem1 = [[UIBarButtonItem alloc] initWithCustomView:userDefineLeftBtn];

    self.navigationItem.rightBarButtonItem = rightItem1;
    
}

-(void)creatRightNavWithTitle:(NSString *)title
{
    UIButton *userDefineLeftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    userDefineLeftBtn.frame     = CGRectMake(-10, 0, 100, 40);
    [userDefineLeftBtn setTitle:title forState:UIControlStateNormal];
    [userDefineLeftBtn setTitleColor:[CommonUtils colorWithHex:@"00beaf"] forState:UIControlStateNormal];
    userDefineLeftBtn.titleLabel.textAlignment = NSTextAlignmentRight;
    userDefineLeftBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [userDefineLeftBtn addTarget:self action:@selector(rightItemActionWithBtn:) forControlEvents:UIControlEventTouchUpInside];
    userDefineLeftBtn.contentHorizontalAlignment =UIControlContentHorizontalAlignmentRight;
    
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:userDefineLeftBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
    
}
-(void)rightItemActionWithBtn:(UIButton *)sender
{
    
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
