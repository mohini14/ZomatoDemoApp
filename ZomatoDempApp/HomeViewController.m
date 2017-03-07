//
//  HomeViewController.m
//  ZomatoDempApp
//
//  Created by Mohini on 06/03/17.
//  Copyright © 2017 Mohini. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpVC];
    
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
	
}


-(void) setUpVC
{
	[self setNavigationBarItems];
}


-(void) setNavigationBarItems{
	
	[self.navigationController.navigationBar setBarTintColor:[UIColor redColor]];
	UIBarButtonItem *selectedLocation=[[UIBarButtonItem alloc] initWithTitle:@"SelectedLocation" style:UIBarButtonItemStylePlain target:self action:@selector(selectedLocationAction:)];
	selectedLocation.tintColor=[UIColor whiteColor];
	self.navigationItem.leftBarButtonItem=selectedLocation;
	

}

-(void)selectedLocationAction:(id)sender
{
	[self performSegueWithIdentifier:@"HomeToLocation" sender:sender];
}


-(IBAction)unwindfromLocationVC:(UIStoryboardSegue *)unwindSegue{
	//to come back from signup view controller
}






@end
