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
	NSMutableArray *recentlysearhedCities;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	[self setUpVC];
	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewDidAppear:(BOOL)animated
{
	[self populateRecentlySerachedTableView];
}

#pragma  mark -Set Up Initial VC
-(void) setUpVC
{
	[self setUpInitialVCElements]; //sets up initial VC elements
	[self setUpSerchedResultsTableView]; //sets up serached results ta
	[self SetUpRecentlySearchedTableView]; //sets up recently serached table view
}

-(void) setUpInitialVCElements
{
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
	if(tableView==self.searchedResultsTable)
	return cities.count;
	else
	return recentlysearhedCities.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	SearchedResultsCVCellTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:KSERACH_RESULTS_TABLE_VIEW_CELL_IDENTIFIER];
	if(cell==nil)
	{
		cell=[[[NSBundle mainBundle]loadNibNamed:KSERACH_RESULT_TABLE_VIEW_CELL_XIB owner:KSERACH_RESULT_TABLE_VIEW_CELL_CLASS options:nil]firstObject];
	}
	CityDetails *city;
	if(tableView==self.searchedResultsTable)
	{
		if(cities.count > KZERO_INT_CONST)
		{
			city=cities[indexPath.row];
			[cell setUpCellAttributes:city];
		}
	}
	else
	{
		if(recentlysearhedCities.count > KZERO_INT_CONST)
		{
			city=recentlysearhedCities[indexPath.row];
			[cell setUpCellAttributes:city];

		}
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


#pragma mark- loading Table views

-(void) setUpSerchedResultsTableView
{
	self.searchedResultsTable.delegate=self;
	self.searchedResultsTable.dataSource=self;
	
}


-(void) SetUpRecentlySearchedTableView
{
	self.recentlySearchedPlacesTable.delegate=self;
	self.recentlySearchedPlacesTable.dataSource=self;
	[self populateRecentlySerachedTableView];
}


-(void) populateRecentlySerachedTableView
{
	SessionData *session=[SessionData getInstance];
	if(session.recentlySearchedItems.count > KZERO_INT_CONST)
	{
		self.recentlySerachedtableViewHieght.constant=[recentlysearhedCities count]*KTABLE_ROW_HIEGHT;
		recentlysearhedCities=session.recentlySearchedItems;
		[self.recentlySearchedPlacesTable reloadData];
	}
	
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
				 NSInteger tableHieght=[cityDetails count ]*KTABLE_ROW_HIEGHT;
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
					  [session.recentlySearchedItems addObject:session.currentCityDetails];
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
		[session.recentlySearchedItems addObject:session.currentCityDetails];
		//as soon as ok is clicked the control passes to home VC and displays current location
		[weakSelf performSegueWithIdentifier:KUNWIND_SEGUE_TO_HOMEVC_IDENTIFIER sender:weakSelf];
	}];
}


@end
