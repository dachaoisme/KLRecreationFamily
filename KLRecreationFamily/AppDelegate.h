//
//  AppDelegate.h
//  KLRecreationFamily
//
//  Created by 王园园 on 16/7/11.
//  Copyright © 2016年 Wangyuanyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BaseTabBarViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) BaseTabBarViewController *mainTabBar;
@property (strong, nonatomic) UINavigationController *navBar;
@property (strong, nonatomic) UINavigationController *navController;

-(void)setRootViewControllerWithYesEnterIndexVC:(BOOL)yesEnterIndexVC;
@end

