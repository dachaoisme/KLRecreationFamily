//
//  ConfigDefine.h
//  KLRecreationFamily
//
//  Created by 王园园 on 16/7/11.
//  Copyright © 2016年 Wangyuanyuan. All rights reserved.
//

#ifndef ConfigDefine_h
#define ConfigDefine_h

#pragma mark - 全局参数配置
//====sdks 微信
#define MF_WeChat_AppKey @""
#define MF_WeChat_AppID  @"wx79e27896493774c9"
#define MF_WeChat_Secret @"aa8c8f83b88ffa2dd8cb15a927441307"
//高德
//个人
//#define k_map_AppKey @"bfcdde8157e2605ec119e32d511bcf3c"
//企业
#define k_map_AppKey @"32863171e0292a6e3b59a88c41dab43a"

// 友盟
#define k_um_AppKey @"55c01cc967e58e4304006420"


#define weakSelf(wSelf)  __weak __typeof(&*self)wSelf = self;

// 判断iPhone4/4s
#define IS_IPHONE_4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
//判断iphone5
#define IS_IPHONE_5 ( fabs( ( double )[[ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )
//判断iphone6
#define IS_IPHONE_6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
//判断iphone6+
#define IS_IPHONE_6_PLUS ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

//判断系统
#define iOS7 [[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0
#define iOS8 [[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0
#define iOS9 [[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0


// 调试状态, 打开Log功能
#ifdef DEBUG
#define KLLog(...) NSLog(__VA_ARGS__)
#else // 发布状态, 关闭Log功能
#define KLLog(...)
#endif

//判断是否为真机
#if TARGET_IPHONE_SIMULATOR
#define SIMULATOR 1
#elif TARGET_OS_IPHONE
#define SIMULATOR 0
#endif

//非空判断 宏
#define IsNilOrNull(_ref)   (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]))

#ifdef DEBUG
#   define XHNLog(fmt, ...) NSLog((@"%@ [Line %d] " fmt), [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, ##__VA_ARGS__);
#   define NSLog(...) NSLog(__VA_ARGS__)
#else
#   define XHNLog(...)
#   define NSLog(...) {}
#endif

//各个高度
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#define STATUSBAR_HEIGHT 20

#define NAVIGATIONBAR_HEIGHT 44

#define NAV_TOP_HEIGHT 64

#define TABBAR_HEIGHT 49

#define TABBAR_ICON_HEIGHT 30

#define CONTENT_HEIGHT (SCREEN_HEIGHT-NAV_TOP_HEIGHT-TABBAR_HEIGHT)

#define CONTENT_HEIGHT_Super (SCREEN_HEIGHT-TABBAR_HEIGHT)

#define CONTENT_HEIGHT_2 (SCREEN_HEIGHT-NAV_TOP_HEIGHT)

#define LLColorHex(hex) [CommonUtils colorWithHex:hex]
#define LLColorLine     LLColorHex(@"d1d1d1")// 目前使用的线的颜色（中间的分割线）
#define F_PX_TO_PT(px) px/3.0
#define PX_TO_PT(px) px*SCREEN_WIDTH/1242.0
#define LLColorBg       LLColorHex(@"f3f3f3")// 页面背景的颜色

///NavigationBar主题颜色
#define NAVIGATIONBAR_THEMECOLOR [UIColor blackColor]
#define NAVIGATIONBAR_TITLECOLOR [UIColor whiteColor]

#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1.0]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define RGBVCOLOR(v) RGBCOLOR(((v&0xFF0000)>>16),((v&0xFF00)>>8),(v&0xFF))
#define RGBVACOLOR(v,a) RGBACOLOR(((v&0xFF0000)>>16),((v&0xFF00)>>8),(v&0xFF),a)



///首页红点提示
#define NOTI_BADGE_CHANGE           @"noi_badge_change"



#endif /* ConfigDefine_h */
