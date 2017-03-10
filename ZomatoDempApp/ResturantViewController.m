//
//  ResturantViewController.m
//  ZomatoDempApp
//
//  Created by Mohini Sindhu  on 10/03/17.
//  Copyright © 2017 Mohini. All rights reserved.
//

#import "ResturantViewController.h"

@interface ResturantViewController ()

@end

@implementation ResturantViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self setUpVC]; //method sets up initial VC settings
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) setUpVC
{
	[self.navigationController.navigationBar setBarTintColor:[UIColor redColor]];
	[self setLabel]; //method sets up Resturant Name Label
	[self setWebView]; //method loads the content of the resturant with URL
	

}

-(void) setLabel
{
	SessionData *session=[SessionData getInstance];
	self.resturantName.text=session.resturant.name;
}
-(void) setWebView
{
	SessionData *session=[SessionData getInstance];
	NSString *urlString = session.resturant.url;
	NSURL *url = [NSURL URLWithString:urlString];
	NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
	[self.resturantWebView loadRequest:urlRequest];
}

@end
