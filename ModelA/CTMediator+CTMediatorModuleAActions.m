//
//  Mediator.m
//  interfaceDemo
//
//  Created by zhanghao on 2019/7/12.
//  Copyright © 2019年 CHUXIANWANG. All rights reserved.
//


#import "CTMediator+CTMediatorModuleAActions.h"


NSString * const kCTMediatorTargetA = @"A";

NSString * const kCTMediatorActionNativeFetchDetailViewController = @"nativeFetchDetailViewController";

NSString * const kCTMediatorActionCell = @"cell";
NSString * const kCTMediatorActionConfigCell = @"configCell";

@implementation CTMediator(CTMediatorModuleAActions)

- (UIViewController *)CTMediator_viewControllerForDetail{
    UIViewController * viewController = [self performTarget:kCTMediatorTargetA action:kCTMediatorActionNativeFetchDetailViewController params:@{@"key":@"value"} shouldCacheTarget:NO];
    
    if([viewController isKindOfClass:[UIViewController class]]){
        return viewController;
    }
    else{
        return [[UIViewController alloc] init];
    }
}


//generate collectionView

-(UICollectionViewCell*)CTMediator_collectionViewCellWithIdentifier:(NSString*)identifier  collectionView:(UICollectionView*)collectionView indexPath:(NSIndexPath*)indexPath{
    return [self performTarget:kCTMediatorTargetA action:kCTMediatorActionCell params:@{                      @"identifier":identifier, @"collectionView":collectionView, @"indexPath": indexPath} shouldCacheTarget:YES];
}

-(void)CTMediator_configCollectionViewCell:(UICollectionViewCell*)cell withImageUrls:(NSArray*)ImageUrls atIndexPath:(NSIndexPath*)indexPath{
   
    
    [self performTarget:kCTMediatorTargetA action:kCTMediatorActionConfigCell params:@{@"cell":cell, @"ImageUrls":ImageUrls,@"indexPath":indexPath} shouldCacheTarget:YES];
}

-(void)CTMediator_cleanCollectionViewCellTarget{
    [self releaseCachedTargetWithTargetName:kCTMediatorTargetA];
    
}



@end
