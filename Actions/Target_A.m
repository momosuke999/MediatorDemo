//
//  Action.m
//  interfaceDemo
//
//  Created by zhanghao on 2019/7/16.
//  Copyright © 2019年 CHUXIANWANG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Target_A.h"
#import "DemoModuleADetailViewController.h"

//typedef  void(^CTUrlRouterCallbackBlock)(NSDictionary * info);

@implementation Target_A

- (UIViewController *)Action_nativeFetchDetailViewController:(NSDictionary *)params{
    DemoModuleADetailViewController *viewController = [[DemoModuleADetailViewController alloc] init];
    viewController.valueLabel.text = params[@"key"];
    return viewController;
    
}

@end
