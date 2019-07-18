//
//  ViewModel.h
//  interfaceDemo
//
//  Created by zhanghao on 2019/7/11.
//  Copyright © 2019年 CHUXIANWANG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "interfaceModel.h"
#import <ReactiveCocoa/ReactiveCocoa.h>


@interface FilmViewModel : NSObject

@property (nonatomic,strong,readonly)RACCommand * command;

@end
