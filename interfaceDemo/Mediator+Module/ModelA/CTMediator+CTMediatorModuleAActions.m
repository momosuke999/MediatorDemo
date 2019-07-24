//
//  Mediator.m
//  interfaceDemo
//
//  Created by zhanghao on 2019/7/12.
//  Copyright © 2019年 CHUXIANWANG. All rights reserved.
//


#import "CTMediator+CTMediatorModuleAActions.h"
#import "DetailsView.h"

NSString * const kCTMediatorTargetA = @"A";

NSString * const kCTMediatorActionCell = @"cell";
NSString * const kCTMediatorActionConfigCell = @"configCell";

@implementation CTMediator(CTMediatorModuleAActions)

//generate collectionView

-(UICollectionViewCell*)CTMediator_collectionViewCellWithIdentifier:(NSString*)identifier collectionView:(UICollectionView*)collectionView withImageUrls:(NSArray*)ImageUrls indexPath:(NSIndexPath*)indexPath{
    
    return [self performTarget:kCTMediatorTargetA action:kCTMediatorActionCell params:@{                      @"identifier":identifier, @"collectionView":collectionView, @"ImageUrls": ImageUrls, @"indexPath": indexPath} shouldCacheTarget:YES];
}




-(void)CTMediator_cleanCollectionViewCellTarget{
    [self releaseCachedTargetWithTargetName:kCTMediatorTargetA];
    
}



@end
