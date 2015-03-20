//
//  DetailViewController.h
//  WeekTwoAssessment
//
//  Created by Leandro Pessini on 3/20/15.
//  Copyright (c) 2015 Brazuca Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "City.h"

@protocol ChangeTitleDelegate <NSObject>

-(void)changeRootViewTitleButtonTapped:(NSString *)cityName;

@end

@interface DetailViewController : UIViewController

@property (nonatomic, assign) id<ChangeTitleDelegate> delegate;
@property City *city;

@end
