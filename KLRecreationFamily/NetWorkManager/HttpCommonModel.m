//
//  HttpCommonModel.m
//  KLRecreationFamily
//
//  Created by 王园园 on 16/7/11.
//  Copyright © 2016年 Wangyuanyuan. All rights reserved.
//

#import "HttpCommonModel.h"

@implementation HttpResponsePageModel

/*
 
 成功：{"state":0, "data":{}|[]}
 失败：{"state":1, "msg_code":"10001", "msg_text":"失败原因说明"}
 */

-(id)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        
        self.responseCurrentPage    = [dic stringForKey:@"page"];
        self.responsePageTotalCount = [dic stringForKey:@"cnt"];
        self.responsePageLength     = [dic stringForKey:@"len"];
    }
    
    return self;
}

@end


@implementation HttpResponseCodeModel


- (id)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    
    if (self) {
        
        self.responseCode           =[[dic stringForKey:@"state"] integerValue];
        self.responseMsg            = [dic stringForKey:@"msg_text"];
        self.responseMsgCode        = [dic stringForKey:@"msg_code"];
        self.responseCommonDic      = [dic objectForKey:@"data"];

    }
    
    return self;
}



@end