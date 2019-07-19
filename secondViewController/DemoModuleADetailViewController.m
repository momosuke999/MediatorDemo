//
//  DetailVC.m
//  interfaceDemo
//
//  Created by zhanghao on 2019/7/15.
//  Copyright © 2019年 CHUXIANWANG. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "DemoModuleADetailViewController.h"
#import <UIKit/UIKit.h>
#import "interfaceModel.h"
#import "DetailsView.h"
#import "ViewModel.h"
#import "CTMediator+CTMediatorModuleAActions.h"

#pragma reuse identifier
static NSString* const reuseIdentifier = @"colelctionViewId";


@interface DemoModuleADetailViewController()

@property(nonatomic,strong) UICollectionView * collectionView;

@end


#pragma viewController

@implementation DemoModuleADetailViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.returnBtn];
    
    //temperary data source
    _myImageArray= @[@"https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1530362237.95.jpg", @"https://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1478066140.77.jpg",@"https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p805.jpg", @"https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1466186775.21.jpg" ];
    
    //init CollectionView
    UICollectionViewFlowLayout * flowLayout =[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 300, 300) collectionViewLayout:flowLayout];
    flowLayout.estimatedItemSize = CGSizeMake(80, 50);
    _collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    [self.view addSubview:self.collectionView];
    
    
    
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
    return 4;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return [[CTMediator sharedInstance] CTMediator_collectionViewCellWithIdentifier:reuseIdentifier collectionView:collectionView indexPath:indexPath];
}


-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{

    
    [[CTMediator sharedInstance] CTMediator_configCollectionViewCell:cell withImageUrls:_myImageArray atIndexPath:indexPath];

}




- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeZero;
}

-(void)dealloc{
    [[CTMediator sharedInstance]CTMediator_cleanCollectionViewCellTarget];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
