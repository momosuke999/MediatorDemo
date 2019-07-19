//
//  Mediator.h
//  interfaceDemo
//
//  Created by zhanghao on 2019/7/12.
//  Copyright © 2019年 CHUXIANWANG. All rights reserved.
//

#import "CTMediator.h"
#import <UIKit/UIKit.h>
//#import "DetailsView.h"

//mediator for both viewcontrollers
//interface detailVC from the main VC by clicking the buttons
        //and the actions is here through the CTmediator

@interface CTMediator(CTMediatorModuleAActions)


- (UIViewController *)CTMediator_viewControllerForDetail;

-(UICollectionViewCell*)CTMediator_collectionViewCellWithIdentifier:(NSString*)identifier collectionView:(UICollectionView*)collectionView indexPath:(NSIndexPath*)indexPath;


-(void) CTMediator_configCollectionViewCell:(UICollectionViewCell*)cell withImageUrls:(NSArray*)ImageURLs atIndexPath:(NSIndexPath*)indexPath;

-(void)CTMediator_cleanCollectionViewCellTarget;

@end
