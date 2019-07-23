//
//  interfaceView.h
//  interfaceDemo
//
//  Created by CHUXIANWANG on 2019/6/10.
//  Copyright © 2019年 CHUXIANWANG. All rights reserved.
//

//#ifndef interfaceView_h
#define interfaceView_h
//@class interfaceModel;
#import <UIKit/UIKit.h>
#import "interfaceModel.h"

@interface interfaceView: UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel * filmNameLabel;
@property (nonatomic, weak) IBOutlet UILabel * filmNameEnLabel;
@property (nonatomic, weak) IBOutlet UIImageView * filmIcon;
@property (nonatomic, weak) IBOutlet UILabel * rateAverageLabel;
@property (nonatomic, weak) IBOutlet UILabel * castnameLabel;
@property (nonatomic, weak) IBOutlet UILabel * directorsNameLabel;
@property (nonatomic, weak) IBOutlet UILabel * pubdateLabel;
@property (nonatomic, weak) IBOutlet UILabel * genreLabel;
@property (nonatomic, weak) IBOutlet UILabel *mainland_pubdateLabel;

@property (nonatomic, strong) interfaceModel * InterfaceM;

@end/* interfaceView_h */
