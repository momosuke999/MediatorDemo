//
//  Action.h
//  interfaceDemo
//
//  Created by zhanghao on 2019/7/16.
//  Copyright © 2019年 CHUXIANWANG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface Target_A: NSObject

- (UIViewController *)Action_nativeFetchDetailViewController:(NSDictionary *)params;

-(UICollectionViewCell*)Action_cell:(NSDictionary*)params;

//-(void)Action_configCell:(NSDictionary*)params;


@end
