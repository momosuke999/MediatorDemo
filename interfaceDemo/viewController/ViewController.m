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
//#import "CTMediator.h"

#import "CTMediator+CTMediatorModuleAActions.h"
#import "DemoModuleADetailViewController.h"

@interface ViewController ()
@property(nonatomic,strong) FilmViewModel * viewModel;
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic,strong) NSArray * myDataArray;
@end


@implementation ViewController
//   NSMutableArray * dataArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   // self.view.backgroundColor = [UIColor greenColor];
    //initialize the tableview
       self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height - 20)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    [self bindWithViewModel];
 
    

}





//bind with viewmodel to execute the internet request
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
    //return dataArray.count;
    return [self.myDataArray count];
}




#pragma for dowanload images



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellidentifier = @"cellidentifier";
    interfaceView * cell = [tableView dequeueReusableCellWithIdentifier:cellidentifier];
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
   if(cell == nil){
        cell =[[interfaceView alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentifier];
    }
    cell.InterfaceM = self.myDataArray[indexPath.row];//load data and view to cells

    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //for(int i = 0; i < indexPath.row; i++){
    DemoModuleADetailViewController *viewController = [[DemoModuleADetailViewController alloc]init];
    [self presentViewController:viewController animated:YES completion:nil];

    //}
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
