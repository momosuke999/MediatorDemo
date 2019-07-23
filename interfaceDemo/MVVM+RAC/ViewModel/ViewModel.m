//
//  ViewModel.m
//  interfaceDemo
//
//  Created by zhanghao on 2019/7/11.
//  Copyright © 2019年 CHUXIANWANG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "interfaceModel.h"
#import "ViewModel.h"
#import <AFNetworking.h>

#define url @"https://api.douban.com/v2/movie/in_theaters?apikey=0b2bdeda43b5688921839c8ecb20399b&city=%E5%8C%97%E4%BA%AC&start=0&count=100&client=&udid="

@interface FilmViewModel()

@property(nonatomic,strong)RACCommand * command;

@end


@implementation FilmViewModel

-(instancetype)init{
    if(self == [super init]){
        [self initViewModel];
    }
    return self;
}

-(void)initViewModel{
    @weakify(self);
    self.command = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self);
        return[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            //create and subscribe signal for sending
                //RACSubscriber is a protocol not an interface
                //when signal is subscribed, this block will be called
                //RACDisposable will be actived when signal is error or canceled
            @strongify(self);
            [self getData: ^(NSArray <interfaceModel *> * array){
                [subscriber sendNext: array];//send signal
                [subscriber sendCompleted];//disabel when signal sent sompleted
            }];
            return nil;
        }];
    }];
}

//block: load json data
-(void)getData: (void(^)(NSArray <interfaceModel*> * array))succeedBlock{
 //   NSString * url = @"https://api.douban.com/v2/movie/in_theaters?apikey=0b2bdeda43b5688921839c8ecb20399b&city=%B1%B1%BE%A9&start=0&count=100&client=&udid=";
 
    NSURL* Dataurl = [NSURL URLWithString:url];
 
    
   // AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
//    manager.responseSerializer = [AFJSONResponseSerializer serializer];
  //  [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    
    
    
    NSString * Datastring = [NSString stringWithContentsOfURL:Dataurl encoding:NSUTF8StringEncoding error:nil];
    
    NSData * data = [Datastring dataUsingEncoding:NSUTF8StringEncoding];
    
        NSDictionary * jsonData = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    
    NSMutableArray *array = [NSMutableArray array];
    
    NSArray *  subjectsArray = jsonData[@"subjects"];
 //   [ removeAllObjects];
    
    for (NSDictionary * tempDict in subjectsArray) {
        interfaceModel* model = [interfaceModel interfaceModelWithDict:tempDict];
        [array addObject:model];
    }
    
        if(succeedBlock){
            succeedBlock(array);
        }
    //  } failure:nil];
}

@end
