//
//  DetailVC.m
//  interfaceDemo
//
//  Created by zhanghao on 2019/7/15.
//  Copyright © 2019年 CHUXIANWANG. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "interfaceModel.h"
#import "CollectionViewController.h"
#import "CTMediator+CTMediatorModuleAActions.h"

#pragma reuse identifier
static NSString* const reuseIdentifier = @"colelctionViewId";


@interface CollectionViewController()

@property(nonatomic,strong) UICollectionView * collectionView;

@end


#pragma viewController

@implementation CollectionViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.returnBtn];
    
    //temperary data source
  //  self.myImageArray= @[@"https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1530362237.95.jpg", @"https://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1478066140.77.jpg",@"https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p805.jpg", @"https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1466186775.21.jpg" ];
    //NSLog(@"%@", self.myImageArray);
    
    UICollectionViewFlowLayout * flowLayout =[[UICollectionViewFlowLayout alloc] init];
   [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    flowLayout.estimatedItemSize = CGSizeMake(100, 200);
    
    
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(30, 30, 300, 250) collectionViewLayout:flowLayout];
    [self.collectionView registerClass:[DetailsView class] forCellWithReuseIdentifier:reuseIdentifier];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    
    [self.view addSubview:self.collectionView];
  //  [self.collectionView reloadData];
    
}



- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    self.returnBtn.frame = CGRectMake(100,400 , 40, 20);
    
}

#pragma set button and lazy load

- (void)didTappedReturnBtn:(UIButton *)button
{
    if (self.navigationController == nil) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}


- (UIButton *)returnBtn
{
    if (_returnBtn == nil) {
        _returnBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_returnBtn addTarget:self action:@selector(didTappedReturnBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_returnBtn setTitle:@"return" forState:UIControlStateNormal];
        _returnBtn.titleLabel.font= [UIFont systemFontOfSize:14 ];
        [_returnBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        _returnBtn.backgroundColor = [UIColor grayColor];
    }
    return _returnBtn;
    
}



#pragma get the image list




//-----------------------------**

#pragma generate CollectionView

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.myImageArray.count;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1 ;
}



-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}


//call the mediator
-(void)dealloc{
    [[CTMediator sharedInstance]CTMediator_cleanCollectionViewCellTarget];
}




-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return [[CTMediator sharedInstance] CTMediator_collectionViewCellWithIdentifier:reuseIdentifier collectionView:collectionView withImageUrls:self.myImageArray indexPath:indexPath];
//    self.automaticallyAdjustsScrollViewInsets = NO;

    
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
