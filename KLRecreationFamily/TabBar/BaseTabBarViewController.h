//
//  BaseTabBarViewController.h
//  KLRecreationFamily
//
//  Created by 王园园 on 16/7/11.
//  Copyright © 2016年 Wangyuanyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTabBarView.h"


@interface BaseTabBarViewController : UITabBarController<BaseTabBarDelegate>

-(void)tabBarShow;
-(void)tabBarHiddenToBottom:(BOOL)toBottom;
-(void)tabBarSelected:(NSInteger)index;
-(void)beatyImgShow;

@property(nonatomic,assign)BOOL isLoaded;
@property(nonatomic,strong)BaseTabBarView *baseTabBarView;



@end
