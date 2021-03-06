//
//  HttpServer.h
//  KLRecreationFamily
//
//  Created by 王园园 on 16/7/11.
//  Copyright © 2016年 Wangyuanyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

//请求失败的时候的block
typedef void(^XYPHttpErrorBlock)(NSError *error);
//最基本数据model
typedef void(^XYPBaseBlock)(HttpResponseCodeModel *model);
///page数据mode
typedef void(^XYPPagesBlock)(HttpResponsePageModel *pageModel);
typedef void(^XYPNoneListBlock)(HttpResponseCodeModel *responseModel ,NSDictionary *listDic);


@interface HttpServer : NSObject

/**
 *  @brief  单利初始化
 *
 *  @param
 *  @return
 */
+ (instancetype)sharedInstance;

/**
 *  @brief  get请求
 *
 *  @param  methond  表示请求的method，字段，如“v1/focus/index”
 *
 *  @param  传入的参数，在此方法里面，会把其变成字符串URL
 *
 *  @return
 */
-(void)getWithMethod:(NSString *)methond withParams:(NSDictionary *)dic withSuccess:(XYPBaseBlock)successBlock withFailBlock:(XYPHttpErrorBlock)failBlock;
/**
 *  @brief  post请求
 *
 *  @param  methond  表示请求的method，
 *
 *  @param  传入的参数，在此方法里面，会把其变成字符串URL
 *
 *  @return
 */
-(void)postWithMethod:(NSString *)methond withParams:(NSDictionary *)dic withUploadDic:(NSDictionary *)uploadDic withSuccess:(XYPBaseBlock)successBlock withFailBlock:(XYPHttpErrorBlock)failBlock;



@end
