//
//  DetailViewController.m
//  WeekTwoAssessment
//
//  Created by Leandro Pessini on 3/20/15.
//  Copyright (c) 2015 Brazuca Labs. All rights reserved.
//

#import "DetailViewController.h"
#import "WikipediaViewController.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *cityNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *stateNameTextField;
@property (weak, nonatomic) IBOutlet UIImageView *cityImageView;
@property (weak, nonatomic) IBOutlet UILabel *wikipediaLabel;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.cityNameTextField.text = self.city.cityName;
    self.stateNameTextField.text = self.city.stateName;
    self.cityImageView.image = self.city.cityImage;

}

- (IBAction)onLabelTapped:(UITapGestureRecognizer *)tapGestureRecognizer
{
    CGPoint point = [tapGestureRecognizer locationInView:self.view];
    if (CGRectContainsPoint(self.wikipediaLabel.frame, point))
    {
        [self performSegueWithIdentifier:@"ShowWikipediaSegue" sender:nil];
    }
}

#pragma mark -Segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowWikipediaSegue"])
    {
        WikipediaViewController *vc = segue.destinationViewController;
        vc.whichCity = self.city.cityName;
    }
}

- (IBAction)textFieldDidChanged:(UITextField *)sender
{
    if ([sender isEqual:self.cityNameTextField])
    {
        self.city.cityName = self.cityNameTextField.text;
    }
    else if ([sender isEqual:self.stateNameTextField])
    {
        self.city.stateName = self.stateNameTextField.text;
    }
}

- (IBAction)onChangeRootViewControllerButtonTapped:(UIButton *)sender
{
    [self.delegate changeRootViewTitleButtonTapped:self.city.cityName];
}




@end
