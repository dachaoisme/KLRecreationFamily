//
//  HttpCommonModel.h
//  KLRecreationFamily
//
//  Created by 王园园 on 16/7/11.
//  Copyright © 2016年 Wangyuanyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

///分页效果的显示model
@interface HttpResponsePageModel : NSObject

///当前页数
@property(nonatomic,strong)NSString     *responseCurrentPage;
///总页数数
@property(nonatomic,strong)NSString     *responsePageTotalCount;
///每页的数目
@property(nonatomic,strong)NSString     *responsePageLength;
-(id)initWithDic:(NSDictionary *)dic;


@end

///基本数据类型的model
@interface HttpResponseCodeModel : NSObject

@property(nonatomic,assign)ResponseCode         responseCode;           //类型
@property(nonatomic,strong)NSString            *responseMsg;            //返回的message
@property(nonatomic,strong)NSString            *responseMsgCode;
@property(nonatomic,strong)NSDictionary        *responseCommonDic;      //data里面的数据

-(id)initWithDic:(NSDictionary *)dic;


@end


