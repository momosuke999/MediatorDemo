//
//  ImageDownload.h
//  interfaceDemo
//
//  Created by CHUXIANWANG on 2019/7/2.
//  Copyright © 2019年 CHUXIANWANG. All rights reserved.
//


#import <Foundation/Foundation.h>
@class interfaceModel;


@interface ImageDownload : NSObject

@property(nonatomic, strong) interfaceModel * filmRecord;
@property(nonatomic, copy)void (^completionHandler)(void);

-(void)startDownload;
-(void)cancelDownload;

@end


 /* ImageDownload_h */
