//
//  City.m
//  WeekTwoAssessment
//
//  Created by Leandro Pessini on 3/20/15.
//  Copyright (c) 2015 Brazuca Labs. All rights reserved.
//

#import "City.h"

@implementation City

-(instancetype)initWithCityName:(NSString *)cityName andState:(NSString *)stateName andImage:(UIImage *)cityImage
{
    self = [super init];

    if (self)
    {
        self.cityName = cityName;
        self.stateName = stateName;
        self.cityImage = cityImage;
    }

    return self;
}

@end
