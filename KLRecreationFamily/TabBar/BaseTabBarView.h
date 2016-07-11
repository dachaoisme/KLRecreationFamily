//
//  BaseTabBarView.h
//  KLRecreationFamily
//
//  Created by 王园园 on 16/7/11.
//  Copyright © 2016年 Wangyuanyuan. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol BaseTabBarDelegate <NSObject>

-(void)tabBarSelected:(NSInteger)index;

@end

@interface BaseTabBarView : UIView

{
    NSInteger selIndex;
    UIView * tipView;
}
@property(nonatomic,assign)id<BaseTabBarDelegate> delegate;

@property(nonatomic,strong)NSArray * titleArr;
@property(nonatomic,strong)NSArray * imgArr;
@property(nonatomic,strong)NSArray * imgSelArr;

-(void)setContentView;
-(void)setSelected:(NSInteger)index;


@end
