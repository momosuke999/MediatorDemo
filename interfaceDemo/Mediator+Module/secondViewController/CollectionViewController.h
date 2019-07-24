//
//  DetailVC.h
//  interfaceDemo
//
//  Created by zhanghao on 2019/7/15.
//  Copyright © 2019年 CHUXIANWANG. All rights reserved.
//
#import "DetailsView.h"
#import <UIKit/UIKit.h>
@interface CollectionViewController : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource>

@property(nonatomic, strong) UIButton * returnBtn;

@property(nonatomic,strong) NSArray* myImageArray;

@property(nonatomic, strong) UILabel * textLabel;

@end
