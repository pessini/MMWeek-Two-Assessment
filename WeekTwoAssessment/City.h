//
//  City.h
//  WeekTwoAssessment
//
//  Created by Leandro Pessini on 3/20/15.
//  Copyright (c) 2015 Brazuca Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface City : NSObject

@property NSString *cityName;
@property NSString *stateName;
@property UIImage *cityImage;

-(instancetype)initWithCityName:(NSString *)cityName
                       andState:(NSString *)stateName
                       andImage:(UIImage *)cityImage;

@end
