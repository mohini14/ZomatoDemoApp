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
	
}

-(void) setLabel
{
	SessionData *session=[SessionData getInstance];
	self.restName.text=session.resturant.name;
	self.ResturantImage.image=session.resturant.image;
	self.restRating.text=[NSString stringWithFormat:@"%@",session.resturant.rating];
	self.restAdress.text=session.resturant.adress;
	self.avrgCostForTwo.text=[NSString stringWithFormat:@"%@%@",@"average cost for two : ",session.resturant.averageCostForTwo];
	
}



@end
