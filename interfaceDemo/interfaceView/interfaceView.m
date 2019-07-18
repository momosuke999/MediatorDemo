//
//  interfaceView.m
//  interfaceDemo
//
//  Created by CHUXIANWANG on 2019/6/10.
//  Copyright © 2019年 CHUXIANWANG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "interfaceView.h"
#import <UIKit/UIKit.h>
#import "Masonry.h"
#import <SDWebImage/SDWebImage.h>




@implementation interfaceView

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self createControl];
    }
    return self;
} //调用create controll


-(void)setInterfaceM:(interfaceModel *)InterfaceM{
    
    
    //--------------------set model for non array lebels-------------
    
    _filmNameLabel.text = InterfaceM.title;
    
   NSDictionary * imageURLs =InterfaceM.images;
  NSString * imageURL =[imageURLs objectForKey:@"small"];
   
   // NSURL *photourl = [NSURL URLWithString:imageURL];
    //UIImage *images = [UIImage imageWithData:[NSData dataWithContentsOfURL:photourl]];
   //_filmIcon.image = images;

   [_filmIcon sd_setImageWithURL:[NSURL URLWithString:imageURL]];
   

    
    bool kanji = NO;
    for (int i=0; i<InterfaceM.original_title.length; i++) {
        NSRange range =NSMakeRange(i, 1);
        NSString * strFromSubStr=[InterfaceM.original_title substringWithRange:range];
        const char * cStringFromstr=[strFromSubStr UTF8String];
        
        if (strlen(cStringFromstr)==3) {
            kanji = YES;
            }
    }
    
    if(kanji == YES){
        if(InterfaceM.title != InterfaceM.original_title && InterfaceM.original_title.length <= 15){
            _mainland_pubdateLabel.text =InterfaceM.original_title;
        }
        else{
            _mainland_pubdateLabel.text = @" ";
        }
    }
    else{
        if(InterfaceM.title != InterfaceM.original_title && InterfaceM.original_title.length <= 30){
            _mainland_pubdateLabel.text =InterfaceM.original_title;
        }
        else{
            _mainland_pubdateLabel.text = @" ";
        }
    }


    NSDictionary *rates = InterfaceM.rating;
    
    double d = [rates[@"average"] doubleValue];
    NSString * dstr = [NSString stringWithFormat:@"%.2f", d];
    NSString*string6 = @"评分";
    if([dstr isEqualToString: @"0.00"]){
        _rateAverageLabel.text = @"暂无评分";
    }
    //NSDecimalNumber *dn = [NSDecimalNumber decimalNumberWithString:dstr];    //NSString *string7 = [dn stringValue];
    else{
    _rateAverageLabel.text = [NSString stringWithFormat:@"%@: %@", string6,dstr];
    }
  
    
    
    //stars
  // NSDictionary * Stars = [rates dictionaryWithObjectsAndKeys:@"details", nil];
   // _starsLabel.text =[NSString stringWithFormat:@"%ld", (long)InterfaceM.rating.stars];
    
    
    
    //******************set update for array labels without image**********************//
    
    //1.pubdate
  
    NSArray * pubdateArray = InterfaceM.pubdates;
    NSString * pubdateR= @"";
    for (int i = 0; i < pubdateArray.count; i++){
        NSString * tempName = pubdateArray[i];
        pubdateR = [pubdateR stringByAppendingString:tempName];
        if(i <pubdateArray.count-1){
            pubdateR =[pubdateR stringByAppendingString:@","];
        }
        
    }
    NSString * String3 = @"上映日期";
    _pubdateLabel.text =[NSString stringWithFormat:@"%@: %@", String3, pubdateR];
    _pubdateLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _pubdateLabel.numberOfLines = 0;
    _pubdateLabel.preferredMaxLayoutWidth = 300;
    
  
    //2.genre
    NSArray * genreArray = InterfaceM.genres;
    NSString * genreR= @"";
    for(int i = 0; i < genreArray.count; i++){
        NSString * tempName = genreArray[i];
        genreR = [genreR stringByAppendingString:tempName];
        if(i <genreArray.count-1){
            genreR = [genreR stringByAppendingString:@", "];
        }
        
    }
     NSString * string2 = @"影片类型";
    _genreLabel.text =[NSString stringWithFormat:@"%@: %@", string2, genreR];
    

    
  
    //3.castname
    NSArray * castnameArray = InterfaceM.casts;
    NSString* castR = @"";
    NSString * tempName2 = @"";
    for(int i =0; i < castnameArray.count; i++){
        NSDictionary * setModel= castnameArray[i];
        tempName2 = [setModel objectForKey:@"name"];
        if(tempName2.length){
            castR = [castR stringByAppendingString:tempName2];
            if(i< castnameArray.count -1){
                  castR = [castR stringByAppendingString:@", "];
             }
        }
    
    }
    
 
    NSString * string3 = @"主演";
    _castnameLabel.text= [NSString stringWithFormat: @"%@: %@", string3,castR];
    _castnameLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _castnameLabel.numberOfLines = 0;
    _castnameLabel.preferredMaxLayoutWidth = 300;
   // NSLog(@"----%@",_castnameLabel.text);
    
    
    
    
    
    //5.directorname
    NSArray * directnameArray = InterfaceM.directors;
    NSString* directnameR = @"";
    for(int i =0; i < directnameArray.count; i++){
        NSDictionary * setModel= directnameArray[i];
        NSString * tempName = [setModel objectForKey:@"name"];
        if(tempName.length){
        directnameR= [directnameR stringByAppendingString:tempName ];
        if(i< directnameArray.count -1){
            directnameR = [directnameR stringByAppendingString:@", "];
            }
        }
    }
    NSString * string4 = @"导演";
    _directorsNameLabel.text= [NSString stringWithFormat: @"%@: %@", string4,directnameR];
    _directorsNameLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _directorsNameLabel.numberOfLines = 0;
    _directorsNameLabel.preferredMaxLayoutWidth = 330;

    
 
}



//******************-creat top, center, footer view-**********************//

-(void) createControl{
    [self createTopView];
    
   [self creatCenterView];
    
 [self creatGrayView];
}



//top view with film name and mainland pubdate
-(void)createTopView{
     __weak __typeof(self) weakSelf = self;
    UIView *topView = [[UIView alloc]init];
    [self.contentView addSubview:topView];
   [topView mas_makeConstraints:^(MASConstraintMaker * make) {
        make.left.equalTo(weakSelf.contentView.mas_left).with.offset(0);
       make.right.equalTo(weakSelf.contentView.mas_right).with.offset(0);
     make.height.mas_equalTo(40);
     make.top.equalTo(self.contentView).offset(0);

    }];
 //   topView.frame = CGRectMake(0, 0, self.frame.size.width, 60);
   topView.backgroundColor = UIColor.blackColor;
    topView.translatesAutoresizingMaskIntoConstraints = NO;



    //film title
   UILabel * titleLabel = [[UILabel alloc] init];
   [topView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker * make){
        make.left.equalTo(topView).offset(0);
        make.right.equalTo(topView).offset(0);
        make.height.mas_equalTo(30);
        make.top.equalTo(topView).offset(5);
        
    }];
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.textColor = [UIColor whiteColor];
    _filmNameLabel = titleLabel;
    

    
    

    UILabel * mainlandLabel = [[UILabel alloc] init];
    [topView addSubview: mainlandLabel];
    [mainlandLabel mas_makeConstraints:^(MASConstraintMaker * make){
     //  make.left.equalTo(topView).offset(0);
        make.right.equalTo(topView).offset(0);
        make.height.mas_equalTo(30);
        make.top.equalTo(topView).offset(5);
        
    }];
    mainlandLabel.font = [UIFont systemFontOfSize:14];
    mainlandLabel.textColor = [UIColor whiteColor];
     _mainland_pubdateLabel = mainlandLabel;


}


//center view with icon, directer, cast
-(void)creatCenterView{
    UIView * centerView = [[UIView alloc]init];
    [self.contentView addSubview:centerView];
    [centerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(0);
        make.right.equalTo(self.contentView).offset(0);
        make.height.mas_equalTo(200);
        make.top.equalTo(self.contentView).offset(45);
    }];
    //centerView.backgroundColor = [UIColor orangeColor];
    centerView.translatesAutoresizingMaskIntoConstraints = NO;
    
    //genre
    
    UILabel * genreLabel = [[UILabel alloc] init];
    [centerView addSubview:genreLabel];
    [genreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(centerView).offset(80);
        make.height.mas_equalTo(20);
        make.top.equalTo(centerView).offset(50);
    }];
    genreLabel.font = [UIFont systemFontOfSize:14];
    genreLabel.textColor = [UIColor blackColor];
    _genreLabel = genreLabel;
    
    
    
    UILabel *pubdateLabel = [[UILabel alloc] init];
    [centerView addSubview:pubdateLabel];
    [pubdateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(centerView).offset(80);
        make.height.mas_equalTo(40);
        make.top.equalTo(centerView).offset(65);
    }];
    pubdateLabel.font = [UIFont systemFontOfSize:14];
    pubdateLabel.textColor = [UIColor blackColor];
    _pubdateLabel = pubdateLabel;
    
    
 
    //icon
 
    
   UIImageView *iconLabel = [[UIImageView alloc] init];
    iconLabel.opaque = YES;
    [centerView addSubview:iconLabel];
    iconLabel.frame =CGRectMake(5, 60, 70, 100);
    _filmIcon = iconLabel;
  
    
    //director
    
    UILabel* directLable = [[UILabel alloc] init];
    [centerView addSubview:directLable];
    [directLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(centerView).offset(80);
        make.height.mas_equalTo(40);
        make.top.equalTo(centerView).offset(125);
    }];
    directLable.font = [UIFont systemFontOfSize:14];
    directLable.textColor = [UIColor blackColor];
    _directorsNameLabel = directLable;
     
     
    
 /*   //director icon
    UIImageView * directIcon = [[UIImageView alloc] init];
    [centerView addSubview:directIcon];
    [directIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(directIcon.mas_right).mas_equalTo(2);
        make.top.mas_equalTo(directIcon);
    }];
   // _DirectorsIcon = directIcon; */
 
    
    
    UILabel * rateLabel = [[UILabel alloc] init];
    [centerView addSubview:rateLabel];
    [rateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(centerView).offset(87);
        make.height.mas_equalTo(18);
        make.top.equalTo(centerView).offset(155);
    }];
    rateLabel.font = [UIFont systemFontOfSize:14];
    rateLabel.textColor = [UIColor blackColor];
    _rateAverageLabel = rateLabel;
    
    
    
    //castname
   UILabel * castLabel = [[UILabel alloc]init];
    [centerView addSubview:castLabel];
    [castLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(centerView).offset(80);
        make.height.mas_equalTo(50);
        make.top.equalTo(centerView).offset(93);
    }];
    castLabel.font = [UIFont systemFontOfSize:14];
    castLabel.textColor = [UIColor blackColor];
    _castnameLabel = castLabel;
    
    

   /* UIButton * details = [[UIButton alloc] init];
    [centerView addSubview:details];
    details.frame = CGRectMake(160, 170, 90, 20);
    
   // details = [[UIButton alloc] init];
    [details setTitle:@"查看详情" forState:UIControlStateNormal];
    details.titleLabel.font= [UIFont systemFontOfSize:18 ];
    [details addTarget:self action:@selector(didTappedDetails: ) forControlEvents:UIControlEventTouchUpInside];
    details.backgroundColor = [UIColor grayColor];
    _DetailsBtn = details;*/

}





//gray underline
-(void)creatGrayView{
    UIView * grayView = [[UIView alloc] init];
    grayView.backgroundColor =UIColor.grayColor;
    [self.contentView addSubview:grayView];
    [grayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(0);
        make.right.equalTo(self.contentView).offset(0);
        make.height.mas_equalTo(2);
        make.top.equalTo(self.contentView).offset(250);
    }];
    grayView.translatesAutoresizingMaskIntoConstraints = NO;
}

@end
