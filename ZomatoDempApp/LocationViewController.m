//
//  LocationViewController.m
//  ZomatoDempApp
//
//  Created by Mohini Sindhu  on 07/03/17.
//  Copyright © 2017 Mohini. All rights reserved.
//

#import "LocationViewController.h"

@interface LocationViewController ()

@end

@implementation LocationViewController{
	NSArray *cities;
	double lat;
	double lon;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma  mark -Set Up Initial VC
-(void) setUpVC
{
	self.searchedResultsTableHieght.constant=0;
	self.searchedResultsTable.delegate=self;
	self.searchedResultsTable.dataSource=self;
	[self.navigationController.navigationBar setBarTintColor:[UIColor redColor]];
	[[self.detectMyLocationButton layer] setBorderWidth:2.0f];
	[[self.detectMyLocationButton layer] setBorderColor:[UIColor greenColor].CGColor];
}


#pragma mark-Table View Delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	 return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return cities.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	SearchedResultsCVCellTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"LocationResults"];
	if(cell==nil)
	{
		cell=[[[NSBundle mainBundle]loadNibNamed:@"SearchedResultsCVCellTableViewCell" owner:@"SearchedResultsCVCellTableViewCell" options:nil]firstObject];
	}
	if(cities.count >0){
	CityDetails *city=cities[indexPath.row];
	cell.cityNameLabel.text=city.name;
	cell.countryNameLabel.text=city.country_name;
	}
	return cell;
	
	
}
-(double)tableView : (UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
	return 60;
}


#pragma mark- ACTIONS ON VC
- (IBAction)searchButton:(id)sender
{
	
	if(self.locationSearchBar.text.length > 0)
	{
		[self.locationSearchBar becomeFirstResponder];
		NSString *searchCity=self.locationSearchBar.text;
		[DataParser getDetailsAboutCity:[searchCity lowercaseString] withCompletionHandler:^(NSArray *cityDetails, NSString *errorMsg)
		 {
			 if(errorMsg==nil)
			 {
				 self.searchedResultsTableHieght.constant=340;
				 self.locationSearchBar.text=nil;
				 cities=cityDetails;
				 [self.searchedResultsTable reloadData];
			 }
			 else
			 {
				 [AlertDisplay showAlertPopupWithTitle:ERROR_MSG forView:self];
			 }
		 }];
	}

}

- (IBAction)detectMyLocationButtonPressed:(UIButton *)sender {
	
	[[LocationManager getInstance]getLocation:^(double latitude, double longitude, NSError *error)
	{
		if(error==nil)
		{
		lat=latitude;
		lon=longitude;
			
		}
		else
		{
			[AlertDisplay showAlertPopupWithTitle:@"Error in Fetching Your Location" forView:self];
		}
	}];
	
}
@end
