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
	NSInteger clickedRow;
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

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	clickedRow=indexPath.row;
	[self onClickShowResturantsInCity];
	
}


#pragma mark- ACTIONS ON VC
- (IBAction)searchButton:(id)sender
{
	
	if(self.locationSearchBar.text.length > 0)
	{
		[self.locationSearchBar becomeFirstResponder];
		NSString *searchCity=self.locationSearchBar.text;
		[DataParser getCityDetails:[searchCity lowercaseString] withCompletionHandler:^(NSArray *cityDetails, NSString *errorMsg)
		 {
			 if(errorMsg==nil)
			 {
				 NSInteger tableHieght=[cityDetails count ]*60;
				 self.searchedResultsTableHieght.constant=tableHieght;
				 self.locationSearchBar.text=nil;
				 cities=cityDetails;
				 [self.searchedResultsTable reloadData];
			 }
			 else
			 {
				 [AlertDisplay showAlertPopupWithTitle:KERROR_MSG forView:self];
			 }
		 }];
	}

}

- (IBAction)detectMyLocationButtonPressed:(id)sender {
    [[LocationManager getInstance]getLocation:^(double latitude, double longitude, NSError *error)
     {
         NSLog(@"%f,%f",longitude,longitude);
         if(error==nil)
         {
             lat=latitude;
             lon=longitude;
             [DataParser getLocation:lat withLongitude:lon withCompletionHandler:^(CityDetails *city, NSString *errorMsg)
			  {
				  NSString *str=[NSString stringWithFormat:@"%@%@",@"city :",city.name];
				  [AlertDisplay showAlertPopupWithTitle:str  forView:self withBlock:^{
					  SessionData *session=[SessionData getInstance];
					  session.currentSelectedLocationButtonTitle=city.name;
					  session.currentCityDetails=city;
					  [self performSegueWithIdentifier:@"unwindfromLocation" sender:self];
					  //[self.navigationController popViewControllerAnimated:YES];
				  }];
				}];
             
         }
         else
         {
             [AlertDisplay showAlertPopupWithTitle:@"Error in Fetching Your Location" forView:self];
         }
     }];

}

-(void) onClickShowResturantsInCity
{
	CityDetails *city=cities[clickedRow];
	
	NSString *str=[NSString stringWithFormat:@"%@%@",@"city :",city.name];
	[AlertDisplay showAlertPopupWithTitle:str  forView:self withBlock:^{
		SessionData *session=[SessionData getInstance];
		session.currentSelectedLocationButtonTitle=city.name;
		session.currentCityDetails=city;
		[self performSegueWithIdentifier:@"unwindfromLocation" sender:self];
	}];
}


@end
