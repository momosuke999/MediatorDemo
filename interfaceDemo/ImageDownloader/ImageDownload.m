//
//  ImageDownload.m
//  interfaceDemo
//
//  Created by CHUXIANWANG on 2019/7/2.
//  Copyright © 2019年 CHUXIANWANG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ImageDownload.h"
#import "interfaceModel.h"


#define IconWidth 50
#define IconLength 85


@interface ImageDownload ()

@property(nonatomic, strong)NSURLSessionDataTask *sessionTask;
//@property(nonatomic, strong)UIImage * FilmIconView;
@end


@implementation ImageDownload

-(void)startDownload{
    NSDictionary * imageURLs =self.filmRecord.images;
    NSString * imageURL =[imageURLs objectForKey:@"small"];
    NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:imageURL]];
    _sessionTask = [[NSURLSession sharedSession] dataTaskWithRequest: request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error != nil)
        {
            if ([error code] == NSURLErrorAppTransportSecurityRequiresSecureConnection)
            {
                abort();
            }
        }
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            UIImage * image = [[UIImage alloc]initWithData: data];
            
            if(image.size.width!=IconWidth && image.size.height!= IconLength){
                
                CGSize itemSize = CGSizeMake(IconWidth, IconLength);
                
                UIGraphicsBeginImageContextWithOptions(itemSize, NO, 0.0f);
                
                CGRect imageRect = CGRectMake(0, 0, itemSize.width, itemSize.height);
                
                [image drawInRect:imageRect];
                
                self.filmRecord.FilmIconView = UIGraphicsGetImageFromCurrentImageContext();
                
                UIGraphicsEndPDFContext();
            }
            else{
                self.filmRecord.FilmIconView = image;
            }
            if(self.completionHandler != nil){
                self.completionHandler();
            }
        }];
    }];
    [self.sessionTask resume];
}



-(void)cancelDownload{
    [self.sessionTask cancel];
    _sessionTask = nil;
}



@end
