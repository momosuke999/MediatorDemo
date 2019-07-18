//
//  DetailVC.h
//  interfaceDemo
//
//  Created by zhanghao on 2019/7/15.
//  Copyright © 2019年 CHUXIANWANG. All rights reserved.
//
#import "interfaceModel.h"
#import <UIKit/UIKit.h>
@interface DemoModuleADetailViewController : UIViewController

//@property(nonatomic,strong) UICollectionView * collectionView;

@property(nonatomic, strong) UIButton * returnBtn;
//@property(nonatomic,strong, readonly) UILabel * valueLabel;

@property(nonatomic,strong) NSArray* myDataArray;
@property(nonatomic,strong)NSString * castImageURL;
@property(nonatomic, strong)NSString * directImageURL;
@end
