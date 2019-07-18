//
//  interfaceModel.h
//  interfaceDemo
//
//  Created by CHUXIANWANG on 2019/6/10.
//  Copyright © 2019年 CHUXIANWANG. All rights reserved.
//

//#ifndef interfaceModel_h
#define interfaceModel_h
#import <UIKit/UIKit.h>

@class data_rating, data_casts, data_directors;

//interfaceModel
@interface interfaceModel: NSObject

@property(nonatomic,strong) NSDictionary * rating;

@property(nonatomic,strong) NSArray * genres;

@property(nonatomic, copy) NSString * title;

@property(nonatomic, strong) NSArray *casts;

@property(nonatomic, strong) NSArray * duration;

@property(nonatomic, assign) NSInteger collect_count;

@property(nonatomic, copy) NSString * mainland_pubdate;

@property(nonatomic,assign) bool * has_video;

@property(nonatomic, copy) NSString * original_title;

@property(nonatomic,copy)NSString * subtype;

@property(nonatomic, strong) NSArray <data_directors *> * directors;

@property(nonatomic, strong)NSArray * pubdates;

@property(nonatomic, strong) NSArray * year;

@property(nonatomic, strong) NSDictionary * images;

@property(nonatomic,copy)NSString * alt;

@property(nonatomic, copy)NSString * idm;

@property (nonatomic, strong) UIImage *FilmIconView;


+(instancetype)interfaceModelWithDict:(NSDictionary *) Dictionary;

@end



//dataRating
@interface data_rating : NSObject

@property(nonatomic,assign) NSInteger max;

@property(nonatomic,assign) double average;

@property(nonatomic, strong) NSDictionary * details;

@property(nonatomic,assign) NSInteger stars;

@property(nonatomic, assign) NSInteger min;

@end








//dataCasts
@interface data_casts : NSObject

@property(nonatomic, strong) NSDictionary * avatars;
@property(nonatomic, copy) NSString * name_en;

@property(nonatomic,copy)NSString * name;

@property(nonatomic, copy)NSString * alt;

@property(nonatomic, copy) NSString * idm;


@end


//dataDirectors
@interface data_directors: NSObject

@property(nonatomic, strong) NSDictionary * avartas;

@property(nonatomic, copy) NSString * name_en;

@property(nonatomic, copy) NSString * name;

@property(nonatomic, copy)NSString * alt;

@property(nonatomic, copy) NSString * idm;

@end





/* interfaceModel_h */
