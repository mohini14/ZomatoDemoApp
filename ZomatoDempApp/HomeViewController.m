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

@implementation HomeViewController{
	NSArray *resturants;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.selectLocationButton.title=@ "YOUR LOCATION";
	self.session.currentSelectedLocationButtonTitle=self.selectLocationButton.title;
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


}

#pragma mark-Collection View Delegate Methods
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
	
}








-(IBAction)unwindfromLocationVC:(UIStoryboardSegue *)unwindSegue
{
	//to come back from signup view controller
}

-(IBAction)unwindfromLocation:(UIStoryboardSegue *)unwindSegue
{
	 self.session=[SessionData getInstance];
	if([unwindSegue.identifier isEqualToString:@"unwindfromLocation"]){
		self.selectLocationButton.title=self.session.currentSelectedLocationButtonTitle;
	}
	
	
}




@end
