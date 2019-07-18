//
//  Mediator.h
//  interfaceDemo
//
//  Created by zhanghao on 2019/7/12.
//  Copyright © 2019年 CHUXIANWANG. All rights reserved.
//

#import "CTMediator.h"
#import <UIKit/UIKit.h>


//mediator for both viewcontrollers
//interface detailVC from the main VC by clicking the buttons
        //and the actions is here through the CTmediator

@interface CTMediator(CTMediatorModuleAActions)


- (UIViewController *)CTMediator_viewControllerForDetail;


@end
