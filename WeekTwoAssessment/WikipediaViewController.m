//
//  WikipediaViewController.m
//  WeekTwoAssessment
//
//  Created by Leandro Pessini on 3/20/15.
//  Copyright (c) 2015 Brazuca Labs. All rights reserved.
//

#import "WikipediaViewController.h"

@interface WikipediaViewController ()<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property NSString *wikipedia;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@end

@implementation WikipediaViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.wikipedia = [NSString stringWithFormat:@"https://en.wikipedia.org/wiki/%@", self.whichCity];
    [self loadUrlRequestFromString:[self.wikipedia stringByReplacingOccurrencesOfString:@" " withString:@"_"]];

}

#pragma mark -UIWebView Delegates

-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [self.spinner startAnimating];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.spinner stopAnimating];
}

#pragma mark -IBAction

- (IBAction)onDismissButtonTapped:(UIBarButtonItem *)sender {
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -Helper Methods

-(void)loadUrlRequestFromString:(NSString *)string
{
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

@end
