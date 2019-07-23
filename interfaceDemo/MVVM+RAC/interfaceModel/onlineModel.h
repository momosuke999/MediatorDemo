//
//  onlineModel.h
//  interfaceDemo
//
//  Created by CHUXIANWANG on 2019/6/14.
//  Copyright © 2019年 CHUXIANWANG. All rights reserved.
//



#import "interfaceModel.h"
#import "MJExtension.h"
#import "AFNetworking.h"
#import <UIKit/UIKit.h>

@protocol onlinmDelegate <NSObject>

-(void)getDataSeuccess:(NSArray *) list;

-(void)getDataFail:(NSArray *) message;

@end

@interface onlineModel : NSObject

@property (nonatomic, assign) id<onlinmDelegate> delegate;

-(void)getOnlineData;

@end

/* onlineModel_h */
