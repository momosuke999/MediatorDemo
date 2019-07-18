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
#import "DemoModuleADetailViewController.h"
#import <UIKit/UIKit.h>
#import <Masonry.h>

@implementation DetailsView


-(instancetype)initWithFrame:(CGRect)frame{
    if(self == [super initWithFrame:frame]){
        [self initWithStyle];
    }
    return self;
}

-(void)initWithStyle{
    UIImageView * castImage = [[UIImageView alloc]init];
    [self.contentView addSubview:castImage ];
    [castImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(castImage.superview);
        make.height.equalTo(castImage.mas_width);
    }];
    self.castsIcons = castImage;
}


//-(void)setDirectList:(DemoModuleADetailViewController *)CV{
//    NSString * directURL= CV.directImageURL;
//    [_directorsIcons sd_setImageWithURL:[NSURL URLWithString:directURL]];
//}
    
    



@end
