//
//  onlineModel.m
//  interfaceDemo
//
//  Created by CHUXIANWANG on 2019/6/14.
//  Copyright © 2019年 CHUXIANWANG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "onlineModel.h"
#import <UIKit/UIKit.h>

@implementation onlineModel


-(void)getOnlineData{
    NSDictionary *parameters =@{@"page":@"1", @"pagesize":@"10"};
    NSString * urlString = @"https://api.douban.com/v2/movie/in_theaters?apikey=0b2bdeda43b5688921839c8ecb20399b&city=%B1%B1%BE%A9&start=0&count=100&client=&udid=";
    AFHTTPSessionManager * managers = [AFHTTPSessionManager manager];
    managers.requestSerializer=[AFHTTPRequestSerializer serializer];
    managers.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/plain",@"application/json",@"text/javascript",nil];
    [managers POST:urlString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress){
    }
           success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"success...%@",responseObject[@"OnlineData"]);
        NSMutableArray * array = [NSMutableArray array];
        for(int i =0; i < [responseObject[@"OnlineData"] count];++i){
            NSDictionary * key = [responseObject[@"OnlineData"] objectAtIndexedSubscript:i];
            interfaceModel *interfacemodel = [interfaceModel mj_objectWithKeyValues:key];
            [array addObject:interfacemodel];
            
            if(array.count>0 ){
                if([self.delegate respondsToSelector:@selector(getDataSeuccess:)]){
                    [self.delegate getDataSeuccess:array];
            }
        }
            else{
                if([self.delegate respondsToSelector:@selector(getDataFail:)]){
                    [self.delegate getDataFail:@"error"];
                }
            }
        }
    }
    failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"failed...%@", error);
    
     }];
}


-(void) sendNotificationData:(NSMutableArray* )array{
    if(array>0){
        NSDictionary *OnlineData = [NSDictionary dictionaryWithObjects:array forKeys:@"OnlineData"];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"Notification" object: nil userInfo: OnlineData];
    }
}


@end
