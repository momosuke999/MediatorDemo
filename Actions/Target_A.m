//
//  Action.m
//  interfaceDemo
//
//  Created by zhanghao on 2019/7/16.
//  Copyright © 2019年 CHUXIANWANG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Target_A.h"
#import "DemoModuleADetailViewController.h"
#import <SDWebImage/SDWebImage.h>

typedef  void(^CTUrlRouterCallbackBlock)(NSDictionary * info);

@implementation Target_A

- (UIViewController *)Action_nativeFetchDetailViewController:(NSDictionary *)params{
    DemoModuleADetailViewController *viewController = [[DemoModuleADetailViewController alloc] init];
    //viewController.valueLabel.text = params[@"key"];
    return viewController;
    
}



-(UICollectionViewCell*)Action_cell:(NSDictionary*)params{
    UICollectionView* collectionView = params[@"collectionView"];
    NSString * identifier = params[@"identifier"];
    NSIndexPath * indexPath =params[@"indexPath"];
    DetailsView * cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    return cell;
    
}

-(id)Action_configCell:(NSDictionary*)params{
    NSArray * ImageUrls = params[@"ImageUrls"];
    NSIndexPath * indexPath =params[@"indexPath"];
    DetailsView* cell = params[@"cell"];
    NSString * imageUrl = ImageUrls[(long)indexPath.row];
    [cell.castsIcons sd_setImageWithURL:[NSURL URLWithString:imageUrl]];
    
    return nil;
    
}






@end
