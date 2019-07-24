//
//  getImages.m
//  interfaceDemo
//
//  Created by zhanghao on 2019/7/23.
//  Copyright © 2019年 CHUXIANWANG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "getImages.h"

@implementation getImages

+(NSArray*)getImagesList: (NSArray*)casts andDirectors: (NSArray*)directs{
    
    NSMutableArray * iconList = [NSMutableArray array];
    NSString * tempIcon = @"";
    
    for(int i = 0; i<casts.count; i++){
        NSDictionary * temp= casts[i];
        NSArray * temp1 = temp[@"avatars"];
        if( ![temp1 isKindOfClass:[NSNull class]]){
            tempIcon = [temp1 valueForKey:@"small"];
            [iconList addObject:tempIcon];
        }
        
    }
    
    for(int i =0; i < directs.count; i ++){
        NSDictionary * temp = directs[i];
        NSArray * temp1 = temp[@"avatars"];
        if(![temp1 isKindOfClass:[NSNull class]]){
            tempIcon = [temp1 valueForKey:@"small"];
            [iconList addObject:tempIcon];
        }
    }
    
    return iconList;
}

@end
