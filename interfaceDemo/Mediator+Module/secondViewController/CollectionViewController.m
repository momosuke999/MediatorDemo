//
//  DetailVC.m
//  interfaceDemo
//
//  Created by zhanghao on 2019/7/15.
//  Copyright © 2019年 CHUXIANWANG. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
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
    [self.view addSubview:self.textLabel];
    if(self.myImageArray.count ==0){
        self.textLabel.text = @"暂无";
    }

    UICollectionViewFlowLayout * flowLayout =[[UICollectionViewFlowLayout alloc] init];
   [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    flowLayout.estimatedItemSize = CGSizeMake(100, 200);
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(30, 30, 300, 250) collectionViewLayout:flowLayout];
    [self.collectionView registerClass:[DetailsView class] forCellWithReuseIdentifier:reuseIdentifier];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    [self.view addSubview:self.collectionView];
    
}


- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    self.textLabel.frame = CGRectMake(100, 200, 50, 50);
    self.textLabel.textColor = [UIColor blackColor];
    self.textLabel.font = [UIFont systemFontOfSize:20];
    self.returnBtn.frame = CGRectMake(150,350 , 50, 30);

   
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
        [_returnBtn setTitle:@"返回" forState:UIControlStateNormal];
        _returnBtn.titleLabel.font= [UIFont systemFontOfSize:20 ];
        [_returnBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _returnBtn.backgroundColor = [UIColor whiteColor];
    }
    return _returnBtn;
    
}

-(UILabel*)textLabel{
    if(_textLabel == nil){
        _textLabel = [[UILabel alloc]init];
    }
    return _textLabel;
}

#pragma generate CollectionView

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.myImageArray.count;
}


//call the mediator
-(void)dealloc{
    [[CTMediator sharedInstance]CTMediator_cleanCollectionViewCellTarget];
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return [[CTMediator sharedInstance] CTMediator_collectionViewCellWithIdentifier:reuseIdentifier collectionView:collectionView withImageUrls:self.myImageArray indexPath:indexPath];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
