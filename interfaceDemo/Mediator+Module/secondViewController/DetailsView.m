//
//  DetailsView.m
//  interfaceDemo
//
//  Created by zhanghao on 2019/7/16.
//  Copyright © 2019年 CHUXIANWANG. All rights reserved.
//

#import "DetailsView.h"
#import <SDWebImage/SDWebImage.h>

@implementation DetailsView


-(instancetype)initWithFrame:(CGRect)frame{
    if(self == [super initWithFrame:frame]){
        [self setupUI];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
      self.castsIcons.frame =CGRectMake(0, 0, 100, 130);

}


-(UIImageView *)castsIcons {
    if(_castsIcons ==nil){
        _castsIcons = [[UIImageView alloc]init];
        
    }
    return _castsIcons;
}


-(void)setupUI{
    self.contentView.layer.cornerRadius = 4;
    self.contentView.layer.masksToBounds = YES;
    [self.contentView addSubview:self.castsIcons];

}
    



@end
