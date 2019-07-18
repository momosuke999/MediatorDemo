//
//  Mediator.m
//  interfaceDemo
//
//  Created by zhanghao on 2019/7/12.
//  Copyright © 2019年 CHUXIANWANG. All rights reserved.
//


#import "CTMediator+CTMediatorModuleAActions.h"

NSString * const kCTMediatorTargetA = @"A";

NSString * const kCTMediatorActionNativeFetchDetailViewController = @"nativeFetchDetailViewController";


@implementation CTMediator(CTMediatorModuleAActions)

- (UIViewController *)CTMediator_viewControllerForDetail{
    UIViewController * viewController = [self performTarget:kCTMediatorTargetA action:kCTMediatorActionNativeFetchDetailViewController params:@{@"key":@"detail"} shouldCacheTarget:NO];
    
    if([viewController isKindOfClass:[UIViewController class]]){
        return viewController;
    }
    else
        return [[UIViewController alloc] init];
}


@end
