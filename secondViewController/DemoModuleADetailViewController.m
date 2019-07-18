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

@interface DemoModuleADetailViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property(nonatomic,strong) UILabel * valueLabel;
@property(nonatomic,strong) UICollectionView * collectionView;
//@property(nonatomic,strong) FilmViewModel * viewModel;

@end

@implementation DemoModuleADetailViewController

- (void)didReceiveMemoryWarning {
   [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc]init];
    [flowLayout setScrollDirection: UICollectionViewScrollDirectionHorizontal];
    
     self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height - 20)];
    
    self.collectionView.dataSource=self;
    self.collectionView.delegate=self;
    [self.collectionView setBackgroundColor:[UIColor whiteColor]];
    
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    [self.view addSubview:self.collectionView];

    
    
    self.view.backgroundColor = [UIColor whiteColor];
 //   [self.view addSubview:self.valueLabel];
    [self.view addSubview:self.returnBtn];
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
   return self.myDataArray.count;
}




-(void)didTappedReturnBtn:(UIButton*)returnBtn{
    if(self.navigationController == nil){
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    self.returnBtn.frame = CGRectMake(160, 170, 90, 20);
    self.valueLabel.frame = CGRectMake(120, 130, 30, 30);
}



-(void)bindWithVC{
    
}


-(UIButton*) returnBtn{
    if(_returnBtn == nil){
        _returnBtn = [[UIButton alloc]init];
        _returnBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_returnBtn addTarget:self  action:@selector(didTappedReturnBtn:) forControlEvents:UIControlEventTouchUpInside];
        [ _returnBtn setTitle:@"返回" forState:UIControlStateNormal];
        [_returnBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];

    }
    return _returnBtn;
}

@end
