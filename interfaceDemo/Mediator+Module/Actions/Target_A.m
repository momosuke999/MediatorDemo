//
//  Action.m
//  interfaceDemo
//
//  Created by zhanghao on 2019/7/16.
//  Copyright © 2019年 CHUXIANWANG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Target_A.h"
#import "DetailsView.h"
#import <SDWebImage/SDWebImage.h>

typedef  void(^CTUrlRouterCallbackBlock)(NSDictionary * info);

@implementation Target_A

-(UICollectionViewCell*)Action_cell:(NSDictionary*)params{
    UICollectionView* collectionView = params[@"collectionView"];
    NSString * identifier = params[@"identifier"];
    NSIndexPath * indexPath =params[@"indexPath"];
    NSArray * imageUrls = params[@"ImageUrls"];
    
    DetailsView * cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    NSString * imageUrl =imageUrls[indexPath.item];
    [cell.castsIcons sd_setImageWithURL:[NSURL URLWithString:imageUrl]];
    return cell;
    
}



@end
