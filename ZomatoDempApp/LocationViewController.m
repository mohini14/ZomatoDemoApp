//
//  LocationViewController.m
//  ZomatoDempApp
//
//  Created by Mohini Sindhu  on 07/03/17.
//  Copyright © 2017 Mohini. All rights reserved.
//

#import "LocationViewController.h"

#define KNUMBER_OF_SECTIONS_IN_TABLE_VIEW 1
#define KTABLE_ROW_HIEGHT 60

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
	[self setUpVC];
	
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
	 return KNUMBER_OF_SECTIONS_IN_TABLE_VIEW;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return cities.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	SearchedResultsCVCellTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:KSERACH_RESULTS_TABLE_VIEW_CELL_IDENTIFIER];
	if(cell==nil)
	{
		cell=[[[NSBundle mainBundle]loadNibNamed:KSERACH_RESULT_TABLE_VIEW_CELL_XIB owner:KSERACH_RESULT_TABLE_VIEW_CELL_CLASS options:nil]firstObject];
	}
	if(cities.count >0){
	CityDetails *city=cities[indexPath.row];
	cell.cityNameLabel.text=city.name;
	cell.countryNameLabel.text=city.country_name;
	}
	return cell;
	
	
}
-(double)tableView : (UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
	return KTABLE_ROW_HIEGHT;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	clickedRow=indexPath.row;
	//method passes the controll to main VC as soon as table view cell is clicked
	[self onClickToMainVC];
	
}




#pragma mark- ACTIONS ON VC
//method fetches the name of cities on the basis of searched string and dispalys in table view
- (IBAction)searchButton:(id)sender
{
	
	if(self.locationSearchBar.text.length > KZERO_INT_CONST)
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
				 
				 //updating local array cities with data fetched from the server
				 cities=cityDetails;
				 
				 //reloading table view as soon as data is fetched
				 [self.searchedResultsTable reloadData];
			 }
			 else
			 {
				 [AlertDisplay showAlertPopupWithTitle:KERROR_MSG forView:self];
			 }
		 }];
	}

}


//method fetches the current location of user
- (IBAction)detectMyLocationButtonPressed:(id)sender {
	//Location manager returns the current coordinates of user's location
    [[LocationManager getInstance]getLocation:^(double latitude, double longitude, NSError *error)
     {
         NSLog(@"%f,%f",longitude,longitude);
         if(error==nil)
         {
             lat=latitude;
             lon=longitude;
			 //getLocation method fetches the name of the city of user
             [DataParser getLocation:lat withLongitude:lon withCompletionHandler:^(CityDetails *city, NSString *errorMsg)
			  {
				  __weak LocationViewController *weakSelf = self;
				  NSString *str=[NSString stringWithFormat:@"%@%@",@"city :",city.name];
				  [AlertDisplay showAlertPopupWithTitle:str  forView:self withBlock:^{
					  //updating session data property for current location
					  SessionData *session=[SessionData getInstance];
					  session.currentSelectedLocationButtonTitle=city.name;
					  session.currentCityDetails=city;
                      session.lat=lat;
                      session.lon=lon;
					  [weakSelf performSegueWithIdentifier:KUNWIND_SEGUE_TO_HOMEVC_IDENTIFIER sender:weakSelf];
				  }];
				}];
             
         }
         else
         {
             [AlertDisplay showAlertPopupWithTitle:KDATA_FETCHING_ERROR_MESSAGE forView:self];
         }
     }];

}

//method displays the location fetched  on to main VC
-(void)  onClickToMainVC
{
	CityDetails *city=cities[clickedRow];
	NSString *str=[NSString stringWithFormat:@"%@%@",@"city :",city.name];
	__weak LocationViewController *weakSelf = self;
	[AlertDisplay showAlertPopupWithTitle:str  forView:self withBlock:^{
		//updating session data property for current location
		SessionData *session=[SessionData getInstance];
		session.currentSelectedLocationButtonTitle=city.name;
		session.currentCityDetails=city;
        session.lat=lat;
        session.lon=lon;
		//as soon as ok is clicked the control passes to home VC and displays current location
		[weakSelf performSegueWithIdentifier:KUNWIND_SEGUE_TO_HOMEVC_IDENTIFIER sender:weakSelf];
	}];
}


@end
