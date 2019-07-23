//
//  ViewController.m
//  interfaceDemo
//
//  Created by CHUXIANWANG on 2019/6/10.
//  Copyright © 2019年 CHUXIANWANG. All rights reserved.
//

#import "ViewController.h"
#import "interfaceView.h"
#import "ViewModel.h"
#import <ReactiveCocoa.h>
#import "getImages.h"
#import "ObjectToDict.h"
#import "CTMediator+CTMediatorModuleAActions.h"
#import "CollectionViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic,strong) FilmViewModel * viewModel;
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic,strong) NSArray * myDataArray;
@end


@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib
       self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height - 20)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    [self bindWithViewModel];
 
}


#pragma bind with viewmodel to execute the internet request

-(void)bindWithViewModel{
    @weakify(self);
    [self.viewModel.command.executionSignals.switchToLatest subscribeNext:^(NSArray<interfaceModel *> * array){
        @strongify(self);
        self->_myDataArray = [array copy];
        [self.tableView reloadData];
    }];
    //execute the command
    [self.viewModel.command execute:nil];
}

-(FilmViewModel *)viewModel{
    if(!_viewModel){
        _viewModel = [[FilmViewModel alloc]init];
    }
    return _viewModel;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 250.f;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.myDataArray count];
}


#pragma for dowanload images

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellidentifier = @"cellidentifier";
    interfaceView * cell = [tableView dequeueReusableCellWithIdentifier:cellidentifier];
    
   if(cell == nil){
        cell =[[interfaceView alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentifier];
    }
    cell.InterfaceM = self.myDataArray[indexPath.row];//load data and view to cells

    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    CollectionViewController *viewController = [[CollectionViewController alloc]init];

    interfaceModel * filmModel = self.myDataArray[indexPath.row];
    NSDictionary * filmList = [ObjectToDict getObjectData: filmModel];
    
    NSArray * casts =filmList[@"casts"];
    NSArray * directs = filmList[@"directors"];
    
    viewController.myImageArray = [getImages getImagesList:casts andDirectors:directs];

    [self presentViewController:viewController animated:YES completion:nil];
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
