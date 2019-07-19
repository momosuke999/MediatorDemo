//
//  DetailsView.m
//  interfaceDemo
//
//  Created by zhanghao on 2019/7/16.
//  Copyright © 2019年 CHUXIANWANG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SDWebImage/SDWebImage.h>
#import "DetailsView.h"
//#import "DemoModuleADetailViewController.h"
#import <UIKit/UIKit.h>
#import <Masonry.h>

@implementation DetailsView


-(instancetype)initWithFrame:(CGRect)frame{
    if(self == [super initWithFrame:frame]){
        _castsIcons = [[UIImageView alloc]init];
   //     [self.contentView]
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
      self.castsIcons.frame =CGRectMake(5, 60, 70, 100);
}



//-(void)setCastList:(DemoModuleADetailViewController *)CV{
//    NSString * directURL= CV.directImageURL;
//    [_directorsIcons sd_setImageWithURL:[NSURL URLWithString:directURL]];
//}
    
    



@end
