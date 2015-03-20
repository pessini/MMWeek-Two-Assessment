//
//  ViewController.m
//  WeekTwoAssessment
//
//  Created by Leandro Pessini on 3/20/15.
//  Copyright (c) 2015 Brazuca Labs. All rights reserved.
//

#import "MainViewController.h"
#import "City.h"
#import "DetailViewController.h"

@interface MainViewController ()<UITableViewDataSource, UITableViewDelegate, ChangeTitleDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property DetailViewController *detailViewController;

@end

@implementation MainViewController

#pragma mark -UIView LifeCycles
- (void)viewDidLoad {
    [super viewDidLoad];

    // initialize array with cities
    [self populateCitiesInArray];   
}

-(void)viewDidAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

#pragma mark -ChangeTitleDelegate

-(void)changeRootViewTitleButtonTapped:(NSString *)cityName
{
    self.navigationItem.title = cityName;
}

#pragma mark -UITableViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"CityCell"];
    cell.textLabel.text = [[self.cities objectAtIndex:indexPath.row] cityName];
    cell.detailTextLabel.text = [[self.cities objectAtIndex:indexPath.row] stateName];
    cell.imageView.image =[[self.cities objectAtIndex:indexPath.row] cityImage];

    return cell;

}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cities.count;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        City *item = [self.cities objectAtIndex:indexPath.row];
        [self.cities removeObjectAtIndex:indexPath.row];
        item = nil;
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark -Segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowDetailSegue"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        City *city = [self.cities objectAtIndex:indexPath.row];
        DetailViewController *vc = segue.destinationViewController;
        vc.city = city;
        vc.title = city.cityName;
        vc.delegate = self;
    }
}

#pragma mark -Helper Methods

-(void)populateCitiesInArray
{
    City *cityOne = [[City alloc] initWithCityName:@"Indaiatuba"
                                          andState:@"SP"
                                          andImage:[UIImage imageNamed:@"indaiatuba"]];

    City *cityTwo = [[City alloc] initWithCityName:@"Rio de Janeiro"
                                          andState:@"RJ"
                                          andImage:[UIImage imageNamed:@"rio-de-janeiro"]];

    City *cityThree = [[City alloc] initWithCityName:@"Sao Paulo"
                                          andState:@"SP"
                                          andImage:[UIImage imageNamed:@"sao-paulo-sp"]];

    City *cityFour = [[City alloc] initWithCityName:@"Florianopolis"
                                          andState:@"SC"
                                          andImage:[UIImage imageNamed:@"florianopolis"]];

    self.cities = [NSMutableArray arrayWithObjects:cityOne, cityTwo, cityThree, cityFour, nil];

}

- (IBAction)unwindToThisViewController:(UIStoryboardSegue *)unwindSegue
{
}


@end
